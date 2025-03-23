template <typename Loader, typename Data>
__global__ void PredictLeafKernelTensorCore(Data data,
                                          common::Span<const RegTree::Node> d_nodes,
                                          common::Span<half> d_out_predictions,
                                          common::Span<size_t const> d_tree_segments,
                                          common::Span<FeatureType const> d_tree_split_types,
                                          common::Span<uint32_t const> d_cat_tree_segments,
                                          common::Span<RegTree::CategoricalSplitMatrix::Segment const> d_cat_node_segments,
                                          common::Span<uint32_t const> d_categories,
                                          size_t tree_begin, size_t tree_end, size_t num_features,
                                          size_t num_rows, size_t entry_start, bool use_shared,
                                          float missing) {
    const auto ridx = blockDim.x * blockIdx.x + threadIdx.x;
    if (ridx >= num_rows) {
        return;
    }

    // Assume data is organized in a matrix, for example,
    // [num_rows x num_features].

    // Declare cuBLAS handles
    cublasHandle_t handle;
    cublasCreate(&handle);

    // Allocate device memory for matrices
    half* d_matrixA;
    half* d_matrixB;
    half* d_matrixC;
    size_t size = num_rows * num_features * sizeof(half);
    cudaMalloc(&d_matrixA, size);
    cudaMalloc(&d_matrixB, size);
    cudaMalloc(&d_matrixC, size);

    // Copy data to device memory (adjust based on your data organization)
    cudaMemcpy(d_matrixA, data, size, cudaMemcpyHostToDevice);

    // Initialize d_matrixB (assuming a diagonal matrix with values of 1.0f)
    for (size_t i = 0; i < num_features; ++i) {
        d_matrixB[i * num_features + i] = __float2half_rn(1.0f);
    }

    // Perform matrix multiplication using cuBLAS
    cublasSgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N,
                num_rows, num_features, num_features,
                &__float2half_rn(1.0f), d_matrixA, num_features,
                d_matrixB, num_features,
                &__float2half_rn(0.0f), d_matrixC, num_features);

    // Free device memory
    cudaFree(d_matrixA);
    cudaFree(d_matrixB);
    cudaFree(d_matrixC);

    // Destroy cuBLAS handle
    cublasDestroy(handle);

    Loader loader(data, use_shared, num_features, num_rows, entry_start, missing);

    for (size_t tree_idx = tree_begin; tree_idx < tree_end; ++tree_idx) {
        TreeView d_tree{
            tree_begin,          tree_idx,           d_nodes,
            d_tree_segments,     d_tree_split_types, d_cat_tree_segments,
            d_cat_node_segments, d_categories};

        bst_node_t leaf = -1;

        if (d_tree.HasCategoricalSplit()) {
            leaf = GetLeafIndex<true, true>(ridx, d_tree, &loader);
        } else {
            leaf = GetLeafIndex<true, false>(ridx, d_tree, &loader);
        }

        d_out_predictions[ridx * (tree_end - tree_begin) + tree_idx] = __float2half_rn(leaf);
    }
}

// The following kernel utilizes the shared memory for better data locality.
template <typename Loader, typename Data>
__global__ void predict_leaf_kernel_shared_mem(Data data,
                                               common::span<const reg_tree::node> d_nodes,
                                               common::span<half> d_out_predictions,
                                               common::span<size_t const> d_tree_segments,
                                               common::span<feature_type const> d_tree_split_types,
                                               common::span<uint32_t const> d_cat_tree_segments,
                                               common::span<reg_tree::categorical_split_matrix::segment const> d_cat_node_segments,
                                               common::span<uint32_t const> d_categories,
                                               size_t tree_begin, size_t tree_end, size_t num_features,
                                               size_t num_rows, size_t entry_start, bool use_shared,
                                               float missing) {
  const auto ridx = blockDim.x * blockIdx.x + threadIdx.x;
  if (ridx >= num_rows) {
    return;
  }

  // Allocate shared memory for data, adjust based on your data structure.
  // For example, this assumes a 2D array for data.
  __shared__ float shared_data[block_dim_x * num_features];

  // Load data into shared memory
  if (threadIdx.x < num_features) {
    shared_data[threadIdx.x] = data[ridx * num_features + threadIdx.x];
  }
  __syncthreads();

  Loader loader(shared_data, use_shared, num_features, num_rows, entry_start, missing);

  for (size_t tree_idx = tree_begin; tree_idx < tree_end; ++tree_idx) {
    TreeView d_tree{tree_begin, tree_idx, d_nodes, d_tree_segments, d_tree_split_types, d_cat_tree_segments,
                    d_cat_node_segments, d_categories};

    bst_node_t leaf = -1;

    if (d_tree.has_categorical_split()) {
      leaf = get_leaf_index<true, true>(ridx, d_tree, &loader);
    } else {
      leaf = get_leaf_index<true, false>(ridx, d_tree, &loader);
    }

    d_out_predictions[ridx * (tree_end - tree_begin) + tree_idx] = __float2half_rn(leaf);
  }
}

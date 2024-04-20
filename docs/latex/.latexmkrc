# Set main LaTeX file
$main_file = "main.tex";

# Build directory
$outdir = ".build";

# Compiler options
$lualatex = "lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=$outdir %O %S";

# Rule to create the build directory
mkdir $outdir unless -d $outdir;

# Compilation rule (runs until no more changes detected)
$pdflatex = "$lualatex -output-directory=$outdir %O %S";
$pdf_mode = 1;

# Rule for cleaning auxiliary files and build directory
$clean_ext = "bbl blg aux log out fdb_latexmk";
sub clean {
    rmtree $outdir;
}

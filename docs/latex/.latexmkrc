# Set main LaTeX file
$main_file = "main.tex";

# Build directory
$outdir = ".build";

# Compiler options
$lualatex = "lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=$outdir %O %S";
$bibtex = "bibtex -output-directory=$outdir %O %S";

# Formatting tools
$biber = "biber --output-directory=$outdir %O %S";
$makeindex = "makeindex -s gind.ist -o %O.ind %O.idx";

# Required packages (ensure they are installed)
$usepackage = qw(
    fontspec
    enumitem
    extsizes
    subfig
    caption
    natbib
    babel-russian
    titlesec
    lh
    cyrillic
);
push @generated_exts, 'bbl', 'blg';

# Rule to create the build directory
mkdir $outdir unless -d $outdir;

# Compilation rule (runs until no more changes detected)
$pdflatex = "$lualatex -output-directory=$outdir %O %S";
$pdf_mode = 1;

# Rules for bibliography and index generation
add_cus_dep('bib', 'bbl', 0, 'run_biber');
sub run_biber { system("biber $base_name"); }
add_cus_dep('idx', 'ind', 0, 'run_makeindex');
sub run_makeindex { system("$makeindex $base_name"); }

# Rule for cleaning auxiliary files and build directory
$clean_ext = "bbl blg aux log out fdb_latexmk";
sub clean {
    rmtree $outdir;
}

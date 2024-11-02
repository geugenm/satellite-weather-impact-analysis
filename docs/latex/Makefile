# Name of the main LaTeX file
MAIN = main

# Define the source directory
SRC_DIR = src

# Build directory
BUILD_DIR = .build

# Tool for formatting TeX files (change if needed)
TEX_FORMATTER = latexindent

# Target for building the PDF
all: $(BUILD_DIR)/$(MAIN).pdf

# Rule to create the build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compilation rule using latexmk
$(BUILD_DIR)/$(MAIN).pdf: $(SRC_DIR)/$(MAIN).tex | $(BUILD_DIR) $(SRC_DIR)/.latexmkrc
	cd $(SRC_DIR) && latexmk -pdf -outdir=../$(BUILD_DIR) $(MAIN).tex && cd ..

# Rule for formatting TeX files
format:
ifndef TEX_FORMATTER
	@echo "Error: TeX formatter '$(TEX_FORMATTER)' not found. Please install it or update the Makefile with the correct command."
else
	$(TEX_FORMATTER) -l $(SRC_DIR)/$(MAIN).tex -o $(SRC_DIR)/$(MAIN).tex
endif

.PHONY: all clean

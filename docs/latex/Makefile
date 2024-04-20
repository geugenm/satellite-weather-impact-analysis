# Name of the main LaTeX file
MAIN = main

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
$(BUILD_DIR)/$(MAIN).pdf: $(MAIN).tex | $(BUILD_DIR) .latexmkrc
	latexmk -pdf -outdir=$(BUILD_DIR) $(MAIN).tex

# Rule for formatting TeX files
format:
ifndef TEX_FORMATTER
	@echo "Error: TeX formatter '$(TEX_FORMATTER)' not found. Please install it or update the Makefile with the correct command."
else
	$(TEX_FORMATTER) -l $(MAIN).tex -o $(MAIN).tex
endif

# Clean rule to remove build directory
clean:
	latexmk -c && rm -rf $(BUILD_DIR)

.PHONY: all clean

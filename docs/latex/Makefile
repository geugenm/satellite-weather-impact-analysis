# Name of the main LaTeX file
MAIN = main

# Build directory
BUILD_DIR = .build

# Target for building the PDF
all: $(BUILD_DIR)/$(MAIN).pdf

# Rule to create the build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compilation rule using latexmk
$(BUILD_DIR)/$(MAIN).pdf: $(MAIN).tex | $(BUILD_DIR) .latexmkrc
	latexmk -pdf -outdir=$(BUILD_DIR) $(MAIN).tex

# Clean rule to remove build directory
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean

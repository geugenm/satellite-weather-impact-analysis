# Name of the main LaTeX file
MAIN = main

# Compiler options (adjust if needed)
LUALATEX = lualatex -shell-escape
BIBTEX = bibtex

# Build directory
BUILD_DIR = .build

# Rule to create the build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compilation rule
all: $(BUILD_DIR)/$(MAIN).pdf
$(BUILD_DIR)/$(MAIN).pdf: $(MAIN).tex | $(BUILD_DIR)
	$(LUALATEX) -output-directory=$(BUILD_DIR) $(MAIN).tex
	$(BIBTEX) $(BUILD_DIR)/$(MAIN)
	$(LUALATEX) -output-directory=$(BUILD_DIR) $(MAIN).tex
	$(LUALATEX) -output-directory=$(BUILD_DIR) $(MAIN).tex

# Clean rule
clean:
	rm -rf $(BUILD_DIR)

# Package installation guide (manual for cross-platform)
install_packages:
	@echo "Automatic package installation is not available for all platforms."
	@echo "Please refer to the documentation for your TeX distribution to install missing packages."
	@echo "Here are some resources:"
	@echo "  * TeX Live (Linux/Mac/Windows): https://www.tug.org/texlive/"
	@echo "  * MiKTeX (Windows): https://miktex.org/"
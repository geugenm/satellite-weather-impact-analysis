# Name of the main LaTeX file
MAIN = main

# Compiler options (adjust if needed)
LUALATEX = lualatex -shell-escape
BIBTEX = bibtex

# Build directory
BUILD_DIR = .build

# Required packages
PACKAGES = fontspec enumitem extsizes subfig caption natbib babel-russian titlesec lh cyrillic

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

# Package installation using tlmgr (TeX Live)
install_packages:
ifndef TL_ROOT
	@echo "tlmgr not found. Trying manual installation instructions."
	$(MAKE) install_packages_manual
else
	@echo "Installing required packages using tlmgr..."
	tlmgr install $(PACKAGES)
endif

# Manual package installation guide
install_packages_manual:
	@echo "Automatic package installation is not available for all platforms."
	@echo "Please refer to the instructions below based on your TeX distribution:"
	@echo ""
	@echo "**TeX Live (Linux/Mac/Windows):**"
	@echo "1. Open a terminal or command prompt."
	@echo "2. Run the following command, replacing <package_name> with each required package:"
	@echo "   tlmgr install <package_name>"
	@echo ""
	@echo "**MiKTeX (Windows):**"
	@echo "1. Open the MiKTeX Console."
	@echo "2. Go to the 'Packages' tab."
	@echo "3. Search for each required package and install it."
	@echo ""
	@echo "**MacTeX (macOS):**"
	@echo "1. Open the TeX Live Utility."
	@echo "2. Go to the 'Packages' tab."
	@echo "3. Search for each required package and install it."
	@echo ""

.PHONY: all clean install_packages install_packages_manual

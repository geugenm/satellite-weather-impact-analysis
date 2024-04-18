# LuaTeX Project Setup and Compilation Guide

This document provides a comprehensive guide to setting up a LaTeX environment using LuaTeX for efficient document editing and typesetting. We will explore two popular editor options: Emacs with AUCTeX and Kile.

## 1. Installing a TeX Distribution

Choose a TeX distribution that aligns with your operating system:

**Linux:**

* **TeX Live (Recommended):** Offers an extensive package collection and regular updates.
    ```bash
    sudo dnf install texlive-full   # Comprehensive installation
    sudo dnf install texlive-babel-russian  # Russian language support 
    ```
* **Other Distributions:** Explore options like TeXstudio or proTeXt based on your preferences.

**Windows:**

* **MiKTeX:** Popular choice with on-the-fly package installation. Download from https://miktex.org/download.

**macOS:**

* **MacTeX:** A complete TeX distribution tailored for macOS. Download from https://tug.org/mactex/.

## 2. Essential LaTeX Packages

Install the following packages using your TeX distribution's package manager (e.g., `tlmgr` for TeX Live):

* **fontspec:** Advanced font selection and OpenType font support.
* **enumitem:** Customization of list environments.
* **extsizes:** Extended font size options. 
* **subfig:** Management of subfigures and captions.
* **caption:** Enhanced caption formatting.
* **natbib:** Flexible bibliography management.
* **babel-russian:** Russian language hyphenation and typography support.
* **titlesec:** Customization of section headings.
* **lh:** Cyrillic font support for LuaLaTeX or XeLaTeX.

## 3. Editor Configuration

**Doom Emacs:**

1. **Install LaTeX:** Refer to the Emacs package manager or official instructions (https://docs.doomemacs.org/v21.12/modules/lang/latex/).
2. **(Optional) Install pdf-tools:** Enhance PDF interaction within Emacs.

**Kile:**

1. **Install Kile:** Use your system's package manager or download from https://kile.org/.
2. **Kile Features:** Enjoy a user-friendly interface with project management, syntax highlighting, code completion, and integrated PDF viewing.

## 4. Compilation and Workflow

* **Compile:** Use the appropriate command or keybinding (e.g., `lualatex` for LuaLaTeX output).
* **Automate:** Configure your editor to automatically build and view the generated PDF.
* **Optimize:** Utilize editor features and installed packages to streamline your LaTeX workflow.

## 5. Additional Resources

* **Comprehensive TeX documentation:** https://www.tug.org/texlive/doc.html
* **LaTeX community forums and support:** https://tex.stackexchange.com/
* **Package documentation and examples:** Refer to package websites or CTAN (https://ctan.org/).

## 6. Advanced Techniques with Latexmk

**Latexmk** is a powerful tool for automating LaTeX compilation. It can watch for changes in your files and automatically recompile your document, ensuring that the PDF output is always up-to-date. Here's how to use it:

1. **Installation:** Install latexmk using your system's package manager.
2. **Basic Usage:** Navigate to your LaTeX project directory in the terminal and run `latexmk -pdf yourfile.tex`. This will compile your document and generate a PDF file.
3. **Customization:** Create a `.latexmkrc` file in your project directory to customize latexmk's behavior. You can specify options like the compiler to use, the output format, and the number of compilation runs.
4. **Continuous Compilation:** Use the `-pvc` option to enable continuous compilation. Latexmk will watch for changes in your files and automatically recompile your document.

**Here are some additional advanced techniques you can use with latexmk:**

* **Specifying Dependencies:** Use the `$dependency` variable to specify dependencies between files.
* **Running External Tools:** Use the `$postprocess` variable to run external tools after compilation, such as BibTeX or MakeIndex.
* **Using Custom Build Rules:** Define custom build rules to handle specific file types or compilation steps.

**By mastering latexmk, you can significantly improve your LaTeX workflow and make the compilation process more efficient.**

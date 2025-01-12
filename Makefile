# Diretório onde os arquivos temporários e o PDF serão
# gerados por latexmk.
#
# Mantenha sincronizado com o valor em .gitignore
OUT_DIR ?= build

# Opções passadas para latexmk.
LATEXMK_FLAGS ?= -xelatex --synctex=1

TEX_SRCS := $(shell find . -type f -name "*.tex")
BIB_SRCS := $(shell find . -type f -name "*.bib")
IMG_SRCS := $(shell find . -type f -name "*.jpg" -or -name "*.png" -or -name "*.eps")

SRCS := $(TEX_SRCS) $(BIB_SRCS) $(IMG_SRCS)

# Compilar a versão final do PDF.
pdf: $(OUT_DIR)/main.pdf

clean:
	@rm -rf $(OUT_DIR)

$(OUT_DIR)/main.pdf: $(SRCS)
	@rm -rf $(OUT_DIR)
	@latexmk $(LATEXMK_FLAGS) -output-directory=$(OUT_DIR) main.tex

PHONY: pdf clean
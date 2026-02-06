SRC_DIR = src/stepper_board
DOC_DIR = doc

PY_FILES = $(filter-out $(SRC_DIR)/__init__.py, $(wildcard $(SRC_DIR)/*.py))
MD_FILES = $(patsubst $(SRC_DIR)/%.py, $(DOC_DIR)/%.md, $(PY_FILES))

$(DOC_DIR)/%.md: $(SRC_DIR)/%.py
	pixi run -e doc pydoc-markdown -I $(SRC_DIR) -m $* > $@

doc: $(MD_FILES)

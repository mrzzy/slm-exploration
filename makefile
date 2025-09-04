#
# SLM Exploration
# Makefile
# 

SHELL := /bin/bash
MODELS_DIR:= models
MODEL:= $(MODELS_DIR)/Llama-3.2-1B

.PHONY: all models clean

all: models

models: $(MODEL)

$(MODEL): $(VENV)
	mkdir -p $(MODELS_DIR)
	source .venv/bin/activate && huggingface-cli download meta-llama/Llama-3.2-1B --include "original/*"  --local-dir $@

$(VENV):
	python3 -m venv $(VENV)
	source $(VENV)/bin/activate && pip install -r requirements.txt

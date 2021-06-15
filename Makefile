# Copyright (c) 2021 Koen Vervloesem
# SPDX-License-Identifier: MIT
SHELL := /usr/bin/env bash
CODE = src/main.c

help: ## Show this help message
	@echo "Supported targets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1:\3/p' \
	| column -t -s ':'

format: ## Format code
	@echo "Formatting code..."
	clang-format -i $(CODE)

check: ## Check code
	@echo "Checking code..."
	diff $(CODE) <(clang-format $(CODE)) 1>&2
	yamllint .

build: ## Build code to firmware file
	@echo "Building code..."
	pio run

upload: ## Upload code to microcontroller
	@echo "Uploading code to microcontroller..."
	pio run -t upload

.DEFAULT_GOAL := help
.PHONY: \
	help\
	format \
	check \
	build \
	upload

.PHONY: build dev dev-web install install-web install-api lint test typecheck example

# Build the browser bundle into web/dist (consumed by nudle.serve as static_dir).
build:
	cd web && npm run build

# Run the counter end-to-end example. Needs `make build` first.
example:
	cd api && uv run python ../examples/counter.py

# Web dev server with HMR. ws is proxied to the running nudle.serve on :8080.
dev:
	cd web && npm run dev

# Install
install: install-web install-api

install-web:
	cd web && npm install

install-api:
	cd api && uv sync

# Quality
lint:
	cd web && npx @biomejs/biome check .
	cd api && uv run ruff check . && uv run ruff format --check .

typecheck:
	cd web && npx tsc --noEmit

test:
	cd web && npx vitest run
	cd api && uv run pytest

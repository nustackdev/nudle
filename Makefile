.PHONY: dev dev-web dev-api install install-web install-api lint test typecheck

# Development
dev:
	$(MAKE) dev-web & $(MAKE) dev-api & wait

dev-web:
	cd web && npm run dev

dev-api:
	cd api && uv run uvicorn nudle.server:app --reload --port 8000

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

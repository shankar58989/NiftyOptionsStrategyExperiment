.PHONY: tests docs

dependencies: 
	@echo "Initializing Git..."
	git init
	@echo "Installing dependencies..."
	poetry install --without ColabEnvDep AsmslEnvDep
	poetry run pre-commit install

env: dependencies
	@echo "Activating virtual environment..."
	poetry shell
	
dependencies-colab: 
	@echo "Initializing Git..."
	git init
	@echo "Installing dependencies..."
	poetry install --without DesktopEnvDep AsmslEnvDep --with ColabEnvDep --no-ansi
	# poetry run pre-commit install
	
env-colab: dependencies-colab
	@echo "Virtual environment information"
	poetry env info

dependencies-asmsl: 
	@echo "Initializing Git..."
	git init
	@echo "Installing dependencies..."
	poetry install --without DesktopEnvDep ColabEnvDep --with AsmslEnvDep
	# poetry run pre-commit install
	
env-asmsl: dependencies-asmsl
	@echo "Virtual environment information"
	poetry env info

tests:
	pytest

docs:
	@echo Save documentation to docs... 
	pdoc src -o docs --force
	@echo View API documentation... 
	pdoc src --http localhost:8080	
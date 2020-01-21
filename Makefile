# The binary to build (just the basename).
MODULE := blueprint

BLUE='\033[0;34m'
NC='\033[0m' # No Color

.PHONY: run test lint venv clean

run:
	@python -m $(MODULE)

test:
	@pytest

lint:
	@echo "\n${BLUE}Running Pylint against source and test files...${NC}\n"
	@pylint --rcfile=setup.cfg **/*.py
	@echo "\n${BLUE}Running Bandit against source files...${NC}\n"
	@bandit -r --ini setup.cfg

clean:
	rm -rf .pytest_cache .coverage .pytest_cache coverage.xml

venv:
	pipenv --three

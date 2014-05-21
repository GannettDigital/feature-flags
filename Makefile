install: test
	pip install .

uninstall:
	pip uninstall feature-flags

dev: 
	pip install -e .

test: dev
	pip install pytest
	py.test --doctest-modules feature_flags

acceptance:
	cucumber --no-color

install: test
	pip install -e .

uninstall:
	pip uninstall feature-flags

dev: 
	python setup.py develop

test: dev
	pip install pytest
	py.test --doctest-modules feature_flags

acceptance:
	cucumber --no-color

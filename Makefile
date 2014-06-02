install: test
	python setup.py install

uninstall:
	pip uninstall feature-flags

dev: 
	python setup.py develop

test: dev
	pip install pytest
	py.test --doctest-modules feature_flags

acceptance:
	cucumber --no-color --tags ~@dev


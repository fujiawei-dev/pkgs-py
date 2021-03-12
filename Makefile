.PHONY: ;
.SILENT: ;               # no need for @
.ONESHELL: ;             # recipes execute in same shell
.NOTPARALLEL: ;          # wait for target to finish
.EXPORT_ALL_VARIABLES: ; # send all vars to shell

VERSION = 0.0.7
PACKAGE = project-pkgs

all: setup

dep:
	pip install twine

setup:
	python setup.py sdist
	python setup.py bdist_wheel
	pip install dist/$(PACKAGE)-$(VERSION).tar.gz

upload:
	twine upload dist/$(PACKAGE)-$(VERSION).tar.gz

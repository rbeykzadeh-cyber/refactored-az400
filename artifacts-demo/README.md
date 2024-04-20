## Greeting Python Package

This is a simple Python package that greets the world. It provides the current date and hostname the package is run on.

#### Steps to create the package

`python setup.py sdist bdist_wheel`

#### Steps to upload the package to ADO Artifacts

`twine upload --repository-url https://pkgs.dev.azure.com/your-organization/_packaging/your-feed/pypi/upload/ dist/*`

`twine upload --repository your-feed dist/*`


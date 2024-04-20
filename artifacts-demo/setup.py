from setuptools import setup, find_packages

VERSION = '1.0'
DESCRIPTION = 'A simple package to greet people'
LONG_DESCRIPTION = 'A package that allows you to greet people'

setup(
    name='demo_package',
    version=VERSION,
    description=DESCRIPTION,
    long_description=LONG_DESCRIPTION,
    packages=find_packages(),
    install_requires=[],
    # Include other metadata like author, description, etc.
)
from setuptools import setup


setup(
    name="feature-flags",
    install_requires=[
        "rdflib==4.1.2",
        "click==0.7",
    ],
    packages=[
        "feature_flags",
    ],
    scripts=[
        "bin/feature-lint",
    ],
)

from setuptools import setup


setup(
    name="feature-flags",
    version="0.1.0",
    install_requires=[
        "rdflib==4.1.2",
        "click==0.7",
        "rdflib-jsonld",
    ],
    packages=[
        "feature_flags",
    ],
    scripts=[
        "bin/feature-lint",
        "bin/features-enabled",
    ],
    dependency_links=[
        "http://github.com/RDFLib/rdflib-jsonld/tarball/ed3241a116e551a15aa0d9c187e272ce7b636c55#egg=rdflib-jsonld",
    ]
)

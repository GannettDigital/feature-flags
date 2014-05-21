from setuptools import setup


setup(
    name="feature-flags",
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
    ],
    dependency_links=[
        "http://github.com/RDFLib/rdflib-jsonld/tarball/ed3241a116e551a15aa0d9c187e272ce7b636c55#egg=rdflib-jsonld",
    ]
)

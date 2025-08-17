#!/bin/bash

# Set a value for coverage threshold (default: 90)
COVERAGE_THRESHOLD=${1:-90}

pytest --capture=sys \
       --cov=mylib \
       --cov-report=term-missing \
       --cov-report=xml:coverage.xml \
       --cov-fail-under=${COVERAGE_THRESHOLD} \
       -vv tests
    
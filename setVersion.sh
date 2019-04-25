#!/usr/bin/env bash

# takes an argument to set the version of the project in pom.xml

version=$1
$(mvn versions:set -DnewVersion=${version} > /dev/null 2>&1)
#!/usr/bin/env bash

echo ${env.user}
echo ${env.email}

git config --local user.name "${env.user}"
git config --local user.email "${env.email}"

export TAGS=$(git tag)

export PREV_TAG=$(echo ${TAGS} | awk '{print $NF}')
echo "previous_tag=${PREV_TAG}"

export VERSION=$(./getVersion.sh)
echo "version=${VERSION}"

export TRAVIS_TAG="gitlab-api-v${VERSION}"
echo "travis_tag=${TRAVIS_TAG}"

export IS_SNAPSHOT=$(if [[ $VERSION == *"SNAPSHOT" ]]; then echo "yes"; else echo "no"; fi)
echo "isSnapshot\=${IS_SNAPSHOT}"

git tag $TRAVIS_TAG
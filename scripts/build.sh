#!/usr/bin/env bash

echo BEGIN


# Exit script if you try to use an uninitialized variable.
set -o nounset

# Exit script if a statement returns a non-true return value.
set -o errexit

# Use the error status of the first failure, rather than that of the last item in a pipeline.
set -o pipefail

echo Deploy to GitHub Pages - Start

rm -rf ./tmp/gh-pages
mkdir -p ./tmp
mkdir -p ./tmp/gh-pages

echo This is a test $(date) > foo.txt
cp ./foo.txt ./tmp

cd ./tmp/gh-pages

git init

git config --global user.email "${GH_EMAIL}" > /dev/null 2>&1
git config --global user.name "${GH_NAME}" > /dev/null 2>&1
git remote add origin https://${GH_PAGES_TOKEN}@github.com/${GH_PAGES_REF} 2>&1

git fetch 
git checkout gh-pages

# clean the repo
git rm -rf .
git clean -fxd

cp ../foo.txt ./

git add .
git commit -m "Automated deploy to GitHub pages"
git push --force --quiet origin gh-pages 2>&1

echo Deploy to GitHub Pages - Finished

#!/usr/bin/env bash

set -e

echo Deploy to GitHub Pages - Start

rm -rf ./tmp/gh-pages
mkdir -p ./tmp
mkdir -p ./tmp/gh-pages

echo This is a test $(date) > foo.txt
cp ./foo.txt ./tmp

cd ./tmp/gh-pages

git init

git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name "$GH_NAME" > /dev/null 2>&1
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

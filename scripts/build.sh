#!/bin/sh

set -e

echo Deploy to GitHub Pages - Start

rm -rf ./tmp/gh-pages
mkdir -p ./tmp
mkdir -p ./tmp/gh-pages

echo 'This is a test' > foo.txt
cp ./foo.txt ./tmp/gh-pages

git checkout gh-pages
cd ./tmp/gh-pages


git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name "$GH_NAME" > /dev/null 2>&1
git init
git remote add origin "$remote"

git add -A
git commit -m "Automated deploy to GitHub pages"
git push --force --quiet "https://${GH_PAGES_TOKEN}@${GH_PAGES_REF}" origin gh-pages > /dev/null 2>&1


echo Deploy to GitHub Pages - Finished

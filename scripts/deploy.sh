#!/usr/bin/env sh

# abort on errors
set -e

# navigate into the build output directory
cd dist

hash="$(git show -s --format=%h)"

git init
git checkout -b gh-pages
git add -A
git commit -m "deploy $hash"

git push -f git@github.com:Minivera/DART600-project.git gh-pages:gh-pages

cd ..

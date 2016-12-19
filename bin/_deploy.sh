#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "altaf@fastmail.com"
git config --global user.name "Altaf Ali"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
cp -r ../data ./
git add --all *
git commit -m"Update the book" || true
git push origin gh-pages

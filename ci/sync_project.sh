#!/bin/bash
set -e

git config --global user.email "deploy@patrickmckinnon.com"
git config --global user.name "Deploy User"

echo "Compiled parent repo: https://gitlab.com/smartish-home/patrick" >> README.md
git checkout -b deploy
git add .
git commit -m "Compiled parent repo: https://gitlab.com/smartish-home/patrick"
git remote add github "git@github.com:smartish-home/patrick.git"
git push github deploy:master --force

#!/bin/bash
set -e

for dir in forks/*/* ; do
  # Remove leading forks/ directory segment
  name=${dir#forks\/}

  # Replace intermediate directory segment with dot-notation (smartish-home convention)
  name=${name/\//.}

  echo "Synchronizing $name"

  # Force push gitlab submodule changes to master branch on github
  git -C $dir remote rm github 2> /dev/null || true
  git -C $dir remote add github "git@github.com:smartish-home/$name.git"
  git -C $dir push github master --force
done

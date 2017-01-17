#!/bin/bash
set -e

# Copy submodule files locally
for link in `find ./smartapps ./devicetypes -type l`; do
  dst="$(dirname "$link")/`readlink $link`"
  echo "Unlinking $link -> $dst"
  rm -rf $link
  cp -r $dst $link
done

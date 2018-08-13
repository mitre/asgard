#!/bin/bash

if ! [`gem list github_changelog_generator -i`]; then
  `gem install github_changelog_generator`
fi

cp -f ./heimdallite.html docs/index.html
git add docs/index.html

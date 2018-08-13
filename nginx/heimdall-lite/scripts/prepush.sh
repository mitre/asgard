#!/bin/sh

VERSION=`git describe --tags`
cat heimdallite.html | sed "s|<meta name='version' content='v[0-9].[0-9].[0-9]-[0-9]-[a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9]'>|<meta name='version' content='${VERSION}'>|g" | sed "s|<div class='pull-right hidden-xs'>Version: v[0-9].[0-9].[0-9]-[0-9]-[a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9]</div>|<div class='pull-right hidden-xs'>Version: ${VERSION}</div>|g" > tmp.html
mv tmp.html heimdallite.html

cp -f ./heimdallite.html docs/index.html
git add docs/index.html
git add heimdallite.html

github_changelog_generator aaronlippold/heimdall-lite -t 5031ba0b34f0826e2d4b3ce5930d411dbaaab1a7

git add CHANGELOG.md

git commit --amend --no-edit

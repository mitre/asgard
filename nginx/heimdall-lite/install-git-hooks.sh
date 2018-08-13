#!/bin/bash 

echo "This will install our git hooks into your repo"

cd .git/hooks
ln -f -s ../../scripts/deploy-hook.sh pre-commit

ln -f -s ../../scripts/prepush.sh pre-push

echo "...install complete"



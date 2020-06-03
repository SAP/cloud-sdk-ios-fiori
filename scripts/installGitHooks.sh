#!/bin/bash

# install git prepare-commit-msg hook
rm -f .git/hooks/prepare-commit-msg
ln -s ../../scripts/githooks/prepare-commit-msg .git/hooks/prepare-commit-msg
chmod +x .git/hooks/prepare-commit-msg

# install git pre-push hook
rm -f .git/hooks/pre-push
ln -s ../../scripts/githooks/pre-push.sh .git/hooks/pre-push
chmod +x .git/hooks/pre-push

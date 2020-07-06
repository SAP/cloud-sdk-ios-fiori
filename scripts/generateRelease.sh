# Script to be used in future (without dry run) in CI to automate release process with standard-version (https://github.com/conventional-changelog/standard-version)
# use --release-as option if automatic version bumping is not wanted

npx standard-version --tag-prefix '' --dry-run # --release-as '0.6.0'

# Run `git push --follow-tags origin main` to publish

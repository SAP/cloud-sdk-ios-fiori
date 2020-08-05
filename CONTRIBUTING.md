## Overview

Thank you for your interest in contributing to our project! It's people like you that make the open source community such a great community! 😊

We welcome any type of contribution, not only code. You can help and 
- **analyze issues**: take a look at the [open issues](https://github.com/SAP/cloud-sdk-ios-fiori/issues?state=open). Even if you can't write code, commenting on them, showing that you care about a given issue matters. It helps us triage them.
- **report an issue**: do not hesitate to file a  [new issue](https://github.com/SAP/cloud-sdk-ios-fiori/issues/new). The more details you can give the better
- **provide feedback**: is the README insufficient or the API documentation unclear? Let us know!

## Submitting code and pull request handling

All contributions are handled via Pull Requests (PRs). We are currently busy finalizing our open-source milestone release so your PR _must_ target the [`main`](https://github.com/SAP/cloud-sdk-ios-fiori/tree/main) branch.

Quick checklist summary before submitting a PR:

* 🔎 Make sure tests are added or updated to accommodate your changes. When possible, add tests to verify bug fixes and prevent future regressions.
* 👌 Verify that tests pass and code is free of SwiftLint violations 
* 📖 Check that your commit message follows Conventional Commit standards and has a meaningful description of what it is about
* 👍 Push it!

We reserve the right to close or to not process pull requests.

We recommend to run `setupForCollaborators.sh` in root directory once to install helpful tools. For example, the script will
- install various git hooks
  - to run a SwiftLint check automatically before pushing your sources to remote
  - to help creating a commit messages according to the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standards, just use `git commit` command
- install Xcode project file and adds a run script to ensure that SwiftLint checks are getting executed when you are working within XCode

If you choose to run the script please make sure your dev machine has
- `python` 3.7+ (includes `pip` as package manager)
  - tip: you can use [pyenv](https://github.com/pyenv/pyenv) to manage and switch between multiple python versions
- `npm` (with `npx` as package runner which is included with 5.2+)

## Legal stuff

### Developer Certificate of Origin (DCO)

Due to legal reasons, contributors will be asked to accept a DCO before they submit the first pull request to this projects, this happens in an automated fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

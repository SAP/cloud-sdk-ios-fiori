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
  - automatic formatting with [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) as part of pre-commit
  - to run a [SwiftLint](https://github.com/realm/SwiftLint) check automatically before pushing your sources to remote
  - to help creating a commit messages according to the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) standards, just use `git commit` command
- install Xcode project file
- clone data related to Snapshot Testing
- install [Sourcery](https://github.com/krzysztofzablocki/Sourcery/) to generate UI components

If you choose to run the script please make sure your dev machine has
- `brew` package manager for macOS
- `python` 3.7+ (includes `pip` as package manager)
  - tip: you can use [pyenv](https://github.com/pyenv/pyenv) to manage and switch between multiple python versions
- `npm` (with `npx` as package runner which is included with 5.2+)

## Snapshot Testing

In addition to unit tests we verify the visual correctness of our SwiftUI components with the help of [swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing). The central build will run those tests for pull requests.

To run tests locally you have to download the snapshot reference files which is automatically handled by `setupForCollaborators.sh` script. As an alternative you can use shell script `/scripts/snapshottesting/cloneImages.sh`

Tests can then manually executed in `Apps/Examples` app as part of its unit tests

To add additional snapshot tests please follow this approach:
1. write your tests. As example see `/Apps/Examples/ExamplesTests/SnapshotTests/FioriCharts/LineChartSnapshotTests.swift`
2. run tests to record reference images
3. push reference images (from `/Apps/Examples/cloud-sdk-ios-fiori-snapshot-references`) to its remote and create PR for companion  https://github.com/SAP/cloud-sdk-ios-fiori-snapshot-references repository
4. finally push your code changes and create PR for this repository

## Legal stuff

### Developer Certificate of Origin (DCO)

Due to legal reasons, contributors will be asked to accept a DCO before they submit the first pull request to this projects, this happens in an automated fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

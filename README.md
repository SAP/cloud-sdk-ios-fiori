# cloud-sdk-ios-fiori
SwiftUI implementation of SAP Fiori for iOS Design Language.


## Description
This project is the SwiftUI implementation of the SAP Fiori for iOS Design Language, and is meant to augment and in some cases replace the UIKit-based implementation contained in the SAPFiori framework of the SAP Cloud Platform SDK for iOS.  

> This project is in development, and should not yet be used productively.

This project currently contains 

## Requirements

- iOS 13 or higher, macOS 10.15.3 or higher
- Xcode 11.3.1 or higher
- Swift Package Manager

## Download and Installation

The package is intended for consumption via Swift Package Manager.  

To add to your application target, navigate to the 'Project Settings > Swift Packages' tab, then add the repository URL.

To add to your framework target, add the repository URL to your **Package.swift** manifest.

## Configuration
## Limitations
## Known Issues
## How to obtain support
## Contributing

If you want to contribute, please check the [Contribution Guidelines](./CONTRIBUTING.md).

## To-Do (upcoming changes)

## Project setup
To work with test apps, you must generate the xcodeproj file for the packages.  

From the root of the repo:  `swift package generate-xcodeproj`.  

Then use `/Apps/Apps.xcworkspace`.

> Keep in mind that changes to the generated xcodeproj **will be ignored**.  To maintain folder structure, add files, etc., open `./Package.swift` directly in Xcode.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved.
This file is licensed under the Apache-2.0 license except as noted otherwise in the [LICENSE](/LICENSE) file.

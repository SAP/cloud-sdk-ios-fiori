# Changelog

All notable changes to this project will be documented in this file. See [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for commit guidelines.

## 0.5.6 (2020-08-27)

### Features

* 🎸 color palette update ([e6a774a](https://github.com/SAP/cloud-sdk-ios-fiori/commit/e6a774a0be73cdc47306f056620c8744d55b2c9d))
* 🎸 stacked bar chart ([d0f8029](https://github.com/SAP/cloud-sdk-ios-fiori/commit/d0f802975eda31d37a5c8123acec04ec9acaa8ac))
* 🎸 support contrast color display mode ([a138adb](https://github.com/SAP/cloud-sdk-ios-fiori/commit/a138adba89f8b7fda3ec96b1a1af812cfbcb3698))
* 🎸 support multiple selection in donut chart ([#120](https://github.com/SAP/cloud-sdk-ios-fiori/issues/120)) ([831e0fb](https://github.com/SAP/cloud-sdk-ios-fiori/commit/831e0fb934b4683de6294a5614b720176ae25fa5))
* 🎸 bar chart ([1efba9a](https://github.com/SAP/cloud-sdk-ios-fiori/commit/1efba9ac5c30fc25f893cbe78df32a0f849ca707))
* 🎸 request data for remote int. card (non-cardBundle) ([#113](https://github.com/SAP/cloud-sdk-ios-fiori/issues/113)) ([193316d](https://github.com/SAP/cloud-sdk-ios-fiori/commit/193316dacfc068ca6bdfc22ed872b4117961d12a))

### Bug Fixes

* 🐛 add API doc for resolvedColor() method ([9d95a77](https://github.com/SAP/cloud-sdk-ios-fiori/commit/9d95a778a57815af56db298e3573c726c0ebae9c))
* 🐛 fix the flickering issue on main branch ([053a711](https://github.com/SAP/cloud-sdk-ios-fiori/commit/053a7115e241d03c7c98f22bf95c925156494924)), closes [#106](https://github.com/SAP/cloud-sdk-ios-fiori/issues/106)
* 🐛 fix the problem that title row does not align with card ([8846532](https://github.com/SAP/cloud-sdk-ios-fiori/commit/8846532e8a24ef555ddeffa44d936f0ee2696900)), closes [#117](https://github.com/SAP/cloud-sdk-ios-fiori/issues/117)
* 🐛 fix lint issues ([e33be69](https://github.com/SAP/cloud-sdk-ios-fiori/commit/e33be69b12feeaf90b02c5af11a34aba0beb9030))
* 🐛 integration Card Header: no dynamic value for status ([2a7eae2](https://github.com/SAP/cloud-sdk-ios-fiori/commit/2a7eae24c7dd879544b0df2a494264d10fffd6ab))
* 🐛 truncated header in list card when running iOS 14 ([4912c47](https://github.com/SAP/cloud-sdk-ios-fiori/commit/4912c47e835345d718be121d7640c9974bf7c8f3))


## 0.5.5 (2020-07-31)

### Features

* 🎸 add scatter chart ([2dc3fd1](https://github.com/SAP/cloud-sdk-ios-fiori/commit/2dc3fd1a858007b2c4ffbbae440f41ff31c6d1c8))
* 🎸 support for bubble chart ([#85](https://github.com/SAP/cloud-sdk-ios-fiori/issues/85)) ([4f77e3f](https://github.com/SAP/cloud-sdk-ios-fiori/commit/4f77e3f5e514b4483d83df89f1975d9cfbbb27e4))

### Bug Fixes

* fix visualization for iOS 14 widgets ([2dc3fd1](https://github.com/SAP/cloud-sdk-ios-fiori/commit/2dc3fd1a858007b2c4ffbbae440f41ff31c6d1c8)), closes [#87](https://github.com/SAP/cloud-sdk-ios-fiori/issues/87)

## 0.5.4 (2020-07-21)

### ⚠ BREAKING CHANGES

* **FioriIntegrationCards**: decoder in `BackingCard`

### Features

* 🎸 add combo chart ([#80](https://github.com/SAP/cloud-sdk-ios-fiori/issues/80)) ([19f51d0](https://github.com/SAP/cloud-sdk-ios-fiori/commit/19f51d0dbeb23563be4025b84ccef802ebfe6ffc))
* 🎸 add waterfall chart ([#75](https://github.com/SAP/cloud-sdk-ios-fiori/issues/75)) ([216cb7f](https://github.com/SAP/cloud-sdk-ios-fiori/commit/216cb7fc45f0553fa07c49031507985f6211012f))
* 🎸 improve connecting lines among waterfall columns ([c2bf36d](https://github.com/SAP/cloud-sdk-ios-fiori/commit/c2bf36d29b318c24c6e1456d2b746dc9c9919c26))
* 🎸 Support in-line data in manifest.json ([e3c69a2](https://github.com/SAP/cloud-sdk-ios-fiori/commit/e3c69a2f136f056408860148c435fa1f4c7803f4)), closes [#32](https://github.com/SAP/cloud-sdk-ios-fiori/issues/32)
* 🎸 Single Demo App with Examples ([#82](https://github.com/SAP/cloud-sdk-ios-fiori/pull/82)) ([0117115](https://github.com/SAP/cloud-sdk-ios-fiori/commit/0117115cf261c69ada741fd43083338c511d8ba8))

## 0.5.3 (2020-06-30)

### ⚠ BREAKING CHANGES

* **FioriIntegrationCards**: Class name changed

### Features

* 🎸 add stacked column chart and improve column chart ([9ed685b](https://github.com/SAP/cloud-sdk-ios-fiori/commit/9ed685bb9b26466b7ac6435fb7e82bbb60cecc6f))
* 🎸 color palettes and theme manager ([#66](https://github.com/SAP/cloud-sdk-ios-fiori/issues/66)) ([bfbc5fd](https://github.com/SAP/cloud-sdk-ios-fiori/commit/bfbc5fd236038ababe865a93d287cfe4eefe5dfb))
* 🎸 support colorsForCategory for column and stacked column ([4f88c4d](https://github.com/SAP/cloud-sdk-ios-fiori/commit/4f88c4dc310a2fb1276e436a1c3407ffa97e6dd9))
* 🎸 Support fetching data with Request object ([#68](https://github.com/SAP/cloud-sdk-ios-fiori/issues/68)) ([4689b12](https://github.com/SAP/cloud-sdk-ios-fiori/commit/4689b1255aed5cb78f3ec45de1dde0a2d0db6c0f)), closes [#33](https://github.com/SAP/cloud-sdk-ios-fiori/issues/33)
* 🎸 add custom views of FioriCharts to Xcode library ([bc23d6e](https://github.com/SAP/cloud-sdk-ios-fiori/commit/bc23d6e89fff122c40dea26eb53b529ca3665e41))


### Bug Fixes

* project ‘FioriSwiftUI’ is damaged and cannot be opened ([8c324df](https://github.com/SAP/cloud-sdk-ios-fiori/commit/8c324df954582ceb339469a66dd5fef57c789be4))
* rename BaseBaseCard to BackingCard ([e998644](https://github.com/SAP/cloud-sdk-ios-fiori/commit/e998644ce3ff2010c7e05e4d3c120c7a45c82e6b)), closes [#59](https://github.com/SAP/cloud-sdk-ios-fiori/issues/59)

## 0.5.2 (2020-06-12)

### ⚠ BREAKING CHANGES

* **SegmentedControl:** API renaming

### Features

* add a new chart type - column ([06bb4a6](https://github.com/SAP/cloud-sdk-ios-fiori/commit/06bb4a6b9e496f44e9737f1b5fe8cc16ace163d2))
* add new column chart to test app Micro Chart ([52b41c0](https://github.com/SAP/cloud-sdk-ios-fiori/commit/52b41c07dc359e65f6e582a19d2b1bd0dd135a83))
* pin&zoom and pan for column chart's x axis labels ([44ca423](https://github.com/SAP/cloud-sdk-ios-fiori/commit/44ca42310e360da9e3567f7b11c03251ad0d2648))
* pinch&zoom and pan for column chart ([def04f5](https://github.com/SAP/cloud-sdk-ios-fiori/commit/def04f54027b5501fdbf6fb1ce9f76ee59e96c3c))
* selections for column chart ([0b99e0f](https://github.com/SAP/cloud-sdk-ios-fiori/commit/0b99e0fcd31390108b44a1e4935f78ab6e8f2bcf))


### Bug Fixes

* fix micro chart - column's ui when the column value is negative ([d25cc9a](https://github.com/SAP/cloud-sdk-ios-fiori/commit/d25cc9a964c9a8d8918cc464d77291ddc3ce06bf))
* **SegmentedControl:** dynamic height based on content size ([708674c](https://github.com/SAP/cloud-sdk-ios-fiori/commit/708674c6665a47e81f808621daf8ad0b9824ee81))

## 0.5.1 (2020-06-03)

- fix `version solving failed` when adding try to add package in XCode with version rules

## 0.5.0 (2020-06-03)

- First public release! 🎉
- Introducing FioriCharts and FioriIntegrationCards module
- Software is incomplete (but useable) and remains a work in progress

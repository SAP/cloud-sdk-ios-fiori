# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [0.9.0](https://github.com/SAP/cloud-sdk-ios-fiori/compare/0.5.6...0.9.0) (2020-11-10)


### ⚠ BREAKING CHANGES

* ✏️ change micro charts from public to internal

### Features

* 🎸 a chart is determined by the max of data or axis label ([2296c1a](https://github.com/SAP/cloud-sdk-ios-fiori/commit/2296c1ac20d13a39a4205d7c9cd24c2bc96b292d))
* 🎸 add multiple selection for donut chart ([b8c7359](https://github.com/SAP/cloud-sdk-ios-fiori/commit/b8c73597fe095bd63b555cbe94b00a952f3a311d))
* 🎸 add nav/popup mode for test app ([#159](https://github.com/SAP/cloud-sdk-ios-fiori/issues/159)) ([cf0b96c](https://github.com/SAP/cloud-sdk-ios-fiori/commit/cf0b96c1a3d7172471984b31845782e641af3e3f))
* 🎸 add new mode fixedBottom for x axis labels ([4748180](https://github.com/SAP/cloud-sdk-ios-fiori/commit/4748180b55be68624be1647328281d1d9c057e38))
* 🎸 add validation for numeric properties in chart models ([0cebe97](https://github.com/SAP/cloud-sdk-ios-fiori/commit/0cebe974a8a71be7ab5506ace150b3ee43955799))
* 🎸 add xAxisLabelsPosition to init() ([76a3611](https://github.com/SAP/cloud-sdk-ios-fiori/commit/76a36118ef3a09331ca6a12d6c22175b56fa1bdd))
* 🎸 allow ChartView to pass a NoDataView to customize it ([13a1ae3](https://github.com/SAP/cloud-sdk-ios-fiori/commit/13a1ae3c1bdf7bcb630764ad1637d474b78bfbca))
* 🎸 allow more number of ChartSeriesAttributes than number ([e4176cc](https://github.com/SAP/cloud-sdk-ios-fiori/commit/e4176cc4cf00b9070b78c0d5ac2e15414be288d3))
* 🎸 improve color palette ([d6a8837](https://github.com/SAP/cloud-sdk-ios-fiori/commit/d6a883731f12fcd02ea936a0c3456e4218576328))
* 🎸 refactor line and point shapes ([42d7e7c](https://github.com/SAP/cloud-sdk-ios-fiori/commit/42d7e7c27fd03566690a70ed1fd9c575f8d70af3))
* 🎸 small improvements to test app ([df83ff0](https://github.com/SAP/cloud-sdk-ios-fiori/commit/df83ff06855e91fc20e3bf91f243993d42bc876e))
* 🎸 support .single and .all selection mode for donut chart ([2e2e0d4](https://github.com/SAP/cloud-sdk-ios-fiori/commit/2e2e0d43c7cd974a2659904ec856d552c4df1180))
* 🎸 support both y axes for column insdex of combo chart ([18d3ac7](https://github.com/SAP/cloud-sdk-ios-fiori/commit/18d3ac7eaa465f78511a5c3c41e46dc608c2778c))
* 🎸 support more variants of data format in chart model ([a99bd80](https://github.com/SAP/cloud-sdk-ios-fiori/commit/a99bd80b4eac0cb60c7d783615fcc61821e2c571))
* 🎸 support to display multiple selctions for line charts ([9095261](https://github.com/SAP/cloud-sdk-ios-fiori/commit/9095261d6350a2474f76aa716152356a3536025e))


### Bug Fixes

* 🐛 adjust spacing between axis's labels and baseline ([c0025f4](https://github.com/SAP/cloud-sdk-ios-fiori/commit/c0025f465649e8ae79de6f5b66530c428684e006))
* 🐛 color issue caused by order of series on analytical card ([a10b808](https://github.com/SAP/cloud-sdk-ios-fiori/commit/a10b808702f0ea2db18a63a89e654a9d2003616f))
* 🐛 color palette issues for integration ([994b619](https://github.com/SAP/cloud-sdk-ios-fiori/commit/994b619fbffb139d925786c2136338842131ec6f))
* 🐛 compiler error for selectionMode of ChartModel on Xcode 11 ([71ea4c8](https://github.com/SAP/cloud-sdk-ios-fiori/commit/71ea4c8f9ef5116858764d4c29fdaaaf9ae242cb))
* 🐛 fix ui update issue and refactor code ([711526f](https://github.com/SAP/cloud-sdk-ios-fiori/commit/711526f792e9a9f0b8d9f3f1f3652d2a90347276))
* 🐛 fix x axis ui update issue ([1ec70b0](https://github.com/SAP/cloud-sdk-ios-fiori/commit/1ec70b0ce90ed389d963f34de402a46923920db3))
* 🐛 fix xcode 11 compile bug ([793457b](https://github.com/SAP/cloud-sdk-ios-fiori/commit/793457b6d46ebd19c0e2bf4f1b80dbe0c243e0d1))
* 🐛 fix xcode 11 compile issue ([dd36c50](https://github.com/SAP/cloud-sdk-ios-fiori/commit/dd36c50f8e55b41ce89a28139b9920d73e2eda67))
* 🐛 fix xcode 11 compile issue ([b0ea42d](https://github.com/SAP/cloud-sdk-ios-fiori/commit/b0ea42d565322ea764c70a3a9fb04b0939cbf962))
* 🐛 improve hex color initialization ([30fbd90](https://github.com/SAP/cloud-sdk-ios-fiori/commit/30fbd90fce5bdfe43f8cd21d6b1da8c8c3602f28))
* 🐛 improve test app ([c189fc5](https://github.com/SAP/cloud-sdk-ios-fiori/commit/c189fc55991fce202001afa1020e3305d699f87f))
* 🐛 prevent chart frame size to be negative ([#155](https://github.com/SAP/cloud-sdk-ios-fiori/issues/155)) ([598052b](https://github.com/SAP/cloud-sdk-ios-fiori/commit/598052bb31d87815f0f98a496a95c96c4fda0ef6))
* 🐛 selection mode .all in bubble & scatter chart ([125bdb9](https://github.com/SAP/cloud-sdk-ios-fiori/commit/125bdb90b00d438677c1853d9e291d7f1ab3d78f))
* 🐛 show chart plot on top of axes and grid lines ([7f90c02](https://github.com/SAP/cloud-sdk-ios-fiori/commit/7f90c02353f2eed68b0eecfb9edfcf0ecd13e21c))
* 🐛 xcode 11 compile issue ([d70690a](https://github.com/SAP/cloud-sdk-ios-fiori/commit/d70690aa44abc743fc98963119b56e029240c146))


* ✏️ change micro charts from public to internal ([e129a97](https://github.com/SAP/cloud-sdk-ios-fiori/commit/e129a97e051ea6de4d4f0f8dd5742f07d845a5d4))

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

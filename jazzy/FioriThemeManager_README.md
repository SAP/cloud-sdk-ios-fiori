# FioriThemeManager

This module provides a [color palette](https://experience.sap.com/fiori-design-ios/article/colors/) and a new font family [SAP 72](https://experience.sap.com/72/) that conform to [Fiori Design Language](https://experience.sap.com/fiori-design-ios/). It is adopted by all the Fiori components in both this package and SAPFiori.

All Fiori Colors are dynamic colors, which means they will adjust based on iOS Appearance settings (Light/Dark). Accessing Fiori Color using `Color.preferredFioriColor(forStyle:)`.

72 is a SAP patent typeface that delivers great reading experience to our users. You can get these fonts using `Font.fiori(forTextStyle:)` or `Font.fioriCondensed(forTextStyle:)`. Note that these fonts support Dynamic Type out of the box. If you want the fonts with fixed size, use `Font.fiori(fixedSize:)` or `Font.fioriCondensed(fixedSize:)` instead.

> Custom fonts need to be loaded and registered during App's runtime. Make sure you call `Font.registerFioriFonts()` inside `application(_:didFinishLaunchingWithOptions:)` of your `AppDelegate`.

## Color Palette Customization

The cases of the `ColorStyle` enum correspond to the colors of the [Fiori for iOS Design Guidelines palette](https://experience.sap.com/fiori-design-ios/article/colors/).

Any `FioriSwiftUICore` or `FioriCharts` views will request a color for a given color style through calling an extension method

Example:

```swift
Color.preferredColor(.primaryLabel)
```

You can override the global constants used for the `ColorStyle` case
- programmatically
- through a style sheet

### Programmatically

Use one of the following methods:

- `ThemeManager.setColor(_:for:variant:)`
- `ThemeManager.setHexColor(_:for:variant:)`

Example:

```swift
ThemeManager.shared.setColor(.mint, for: .primaryLabel)
```

###  Style Sheet

Add global color definitions to the top of your style sheet file, using the following pattern: a leading `@` symbol, then the variable key followed by `:` and the variable value and finally end the line with `;` .

Example:

```swift
@tintColor: blue;                              /* equivalent to @tintColor_lightBackground */
@tintColor_darkBackground: "12171CFF";
@tintColorTapState_lightBackground: "F5F6F7FF";    /* equivalent to @tintColorTapState */
@tintColorTapState_darkBackground : purple;
```

The strings used as the variable name should match the string values of the `ColorStyle` enums, and optionally append `_lightBackground` or `_darkBackground`, to specialize the `background` parameter passed to the `static Color.preferredColor(_:background:interface:display:)` invocation.

Global color definitions in the style sheet file modify their corresponding attributes. All other color definitions for which an override is not provided retain their original values.  

As per the Fiori guidelines, when the background is not explicitly specified it defaults to the light background. For example, the global constants, `tintColor` and `tintColor_lightBackground` are equivalent.  Similarly, `primary1` and `primary1_lightBackground` are equivalent.

When overriding global constants in the style sheet file, if two equivalent constants are overridden, then the order of precedence is as shown below, where `Color.red` will be used for all invocations of `Color.preferredColor(.tintColor)` or `Color.preferredColor(.tintColor, background: .lightBackground)` :

```swift
@tintColor_lightBackground: red; /* This takes precedence over tintColor */
@tintColor: blue;
@tintColorDark: green;
```

> `tintColor` and `tintColor_lightBackground` also have another equivalent constant : `tintColorDark`. This has the last precedence. The dark background variant of it is `tintColorLight`, that is, `tintColorLight` and `tintColor_darkBackground` are equivalent.
> Similarly `tintColorTapStateDark` is equivalent to `tintColorTapState` and `tintColorTapState_lightBackground` whereas `tintColorTapStateLight` and `tintColorTapState_darkBackground` are equivalent.

```swift
try? StyleSheetSettings.loadStylesheetByString(content: "@tintColor: blue;")

// or load a style sheet from a local file with StyleSheetSettings.loadStylesheetByURL(url:)
```
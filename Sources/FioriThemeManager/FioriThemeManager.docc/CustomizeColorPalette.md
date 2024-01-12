# Customize the Color Palette

Override the global constants used for the ``ColorStyle`` cases

## Overview

You can choose one of the two options.

### Programmatically

Use one of the following methods:

- ``ThemeManager/setColor(_:for:variant:)``
- ``ThemeManager/setHexColor(_:for:variant:)``

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

The strings used as the variable name should match the string values of the ``ColorStyle`` enums, and optionally append `_lightBackground` or `_darkBackground`, to specialize the `background` parameter passed to the static ``SwiftUI/Color/preferredColor(_:background:interface:display:)`` invocation.

Global color definitions in the style sheet file modify their corresponding attributes. All other color definitions for which an override is not provided retain their original values.  

As per the Fiori guidelines, when the background is not explicitly specified it defaults to the light background. For example, the global constants, ``ColorStyle/tintColor`` and `tintColor_lightBackground` are equivalent.  Similarly, ``ColorStyle/primary1`` and `primary1_lightBackground` are equivalent.

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

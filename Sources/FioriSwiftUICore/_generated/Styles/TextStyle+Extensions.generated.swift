// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

// MARK: - Public 'View Modifier'-style interface

public extension TextStyle {
    func font(_ font: Font) -> TextStyle {
        var new = self
        new._font = font
        return new
    }

    func fontWeight(_ fontWeight: Font.Weight) -> TextStyle {
        var new = self
        new._fontWeight = fontWeight
        return new
    }

    func foregroundColor(_ foregroundColor: Color) -> TextStyle {
        var new = self
        new._foregroundColor = foregroundColor
        return new
    }

    func bold() -> TextStyle {
        var new = self
        new._bold = true
        return new
    }

    func italic() -> TextStyle {
        var new = self
        new._italic = true
        return new
    }

    func truncationMode(_ truncationMode: Text.TruncationMode) -> TextStyle {
        var new = self
        new._truncationMode = truncationMode
        return new
    }

    func lineLimit(_ lineLimit: Int) -> TextStyle {
        var new = self
        new._lineLimit = lineLimit
        return new
    }

    func lineSpacing(_ lineSpacing: CGFloat) -> TextStyle {
        var new = self
        new._lineSpacing = lineSpacing
        return new
    }

    func multilineTextAlignment(_ multilineTextAlignment: TextAlignment) -> TextStyle {
        var new = self
        new._multilineTextAlignment = multilineTextAlignment
        return new
    }
}

public extension Text {
    @ViewBuilder
    func applying(_ style: TextStyle) -> some View {
        self
            ._applyFontWeight(style._fontWeight)
            ._applyBold(style._bold)
            ._applyItalic(style._italic)
            ._applyFont(style._font)
            ._applyForegroundColor(style._foregroundColor)
            ._applyTruncationMode(style._truncationMode)
            ._applyLineLimit(style._lineLimit)
            ._applyLineSpacing(style._lineSpacing)
            ._applyMultilineTextAlignment(style._multilineTextAlignment)
    }
}

private extension Text {
    func _applyFontWeight(_ value: Font.Weight?) -> Text {
        guard value != nil else { return self }
        return self.fontWeight(value!)
    }

    func _applyBold(_ value: Bool?) -> Text {
        guard value != nil else { return self }
        return self.bold()
    }

    func _applyItalic(_ value: Bool?) -> Text {
        guard value != nil else { return self }
        return self.italic()
    }
}

private extension View {
    @ViewBuilder
    func _applyFont(_ value: Font?) -> some View {
        if value != nil {
            self.font(value!)
        } else {
            self
        }
    }

    @ViewBuilder
    func _applyForegroundColor(_ value: Color?) -> some View {
        if value != nil {
            self.foregroundColor(value!)
        } else {
            self
        }
    }

    @ViewBuilder
    func _applyTruncationMode(_ value: Text.TruncationMode?) -> some View {
        if value != nil {
            self.truncationMode(value!)
        } else {
            self
        }
    }

    @ViewBuilder
    func _applyLineLimit(_ value: Int?) -> some View {
        if value != nil {
            self.lineLimit(value!)
        } else {
            self
        }
    }

    @ViewBuilder
    func _applyLineSpacing(_ value: CGFloat?) -> some View {
        if value != nil {
            self.lineSpacing(value!)
        } else {
            self
        }
    }

    @ViewBuilder
    func _applyMultilineTextAlignment(_ value: TextAlignment?) -> some View {
        if value != nil {
            self.multilineTextAlignment(value!)
        } else {
            self
        }
    }
}

public extension TextStyle {
    func merging(_ style: TextStyle) -> TextStyle {
        var new = self
        if let value = style._font {
            new._font = value
        }
        if let value = style._fontWeight {
            new._fontWeight = value
        }
        if let value = style._foregroundColor {
            new._foregroundColor = value
        }
        if let value = style._bold {
            new._bold = value
        }
        if let value = style._italic {
            new._italic = value
        }
        if let value = style._truncationMode {
            new._truncationMode = value
        }
        if let value = style._lineLimit {
            new._lineLimit = value
        }
        if let value = style._lineSpacing {
            new._lineSpacing = value
        }
        if let value = style._multilineTextAlignment {
            new._multilineTextAlignment = value
        }
        return new
    }
}

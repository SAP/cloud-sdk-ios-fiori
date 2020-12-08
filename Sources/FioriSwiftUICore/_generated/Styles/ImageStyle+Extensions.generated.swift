// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

// MARK: - Public 'View Modifier'-style interface 
public extension ImageStyle {
    func renderingMode(_ renderingMode: Image.TemplateRenderingMode) -> ImageStyle {
        var new = self
        new._renderingMode = renderingMode
        return new
    } 
    func interpolation(_ interpolation: Image.Interpolation) -> ImageStyle {
        var new = self
        new._interpolation = interpolation
        return new
    } 
    func antialiased(_ isAntialiased: Bool) -> ImageStyle {
        var new = self
        new._antialiased = isAntialiased
        return new
    } 
    func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> ImageStyle {
        var new = self
        new._resizable = (capInsets: capInsets, resizingMode: resizingMode)
        return new
    } 
}

public extension Image {
    @ViewBuilder
    func applying(_ style: ImageStyle) -> some View {
        self
            ._applyRenderingMode(style._renderingMode)
            ._applyInterpolation(style._interpolation)
            ._applyAntialiased(style._antialiased)
            ._applyResizable(style._resizable)
    }
}


fileprivate extension Image {

    func _applyRenderingMode(_ value: Image.TemplateRenderingMode?) -> Image {
        guard value != nil else { return self }
        return self.renderingMode(value!)
    }

    func _applyInterpolation(_ value: Image.Interpolation?) -> Image {
        guard value != nil else { return self }
        return self.interpolation(value!)
    }

    func _applyAntialiased(_ value: Bool?) -> Image {
        guard value != nil else { return self }
        return self.antialiased(value!)
    }

    func _applyResizable(_ value: (capInsets: EdgeInsets, resizingMode: Image.ResizingMode)?) -> Image {
        guard value != nil else { return self }
        return self.resizable(capInsets: value!.capInsets, resizingMode: value!.resizingMode)
    }
}

fileprivate extension View {
}

public extension ImageStyle {
    func merging(_ style: ImageStyle) -> ImageStyle {
        var new = self
        if let value = style._renderingMode { 
            new._renderingMode = value 
        }
        if let value = style._interpolation { 
            new._interpolation = value 
        }
        if let value = style._antialiased { 
            new._antialiased = value 
        }
        if let value = style._resizable { 
            new._resizable = value 
        }
        return new
    }
}

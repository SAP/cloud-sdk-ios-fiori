
import Foundation
import SwiftUI

public protocol NSSCovert {
    func apply(value: Any, to view: any View) -> any View
}

public enum NSSBaseStyleType: String {
    case fontStyle = "font-style"
    case fontSize = "font-size"
    case fontWeight = "font-weight"
    case fontWidth = "font-width"
    case fontDesign = "font-design"
    case fontColor = "font-color"
    
    case tintColor = "tint-color"
    case borderColor = "border-color"
    case cornerRadius = "corner-radius"
    case backgroundColor = "background-color"
    case foregroundColor = "foreground-color"
    case controlSize = "control-size"
}

extension NSSBaseStyleType: NSSCovert {
    public func apply(value: Any, to view: any View) -> any View {
        switch self {
        case .fontStyle:
            if let name = value as? String {
                return view.font(self.getFontByName(name))
            }
        case .fontSize:
            if let value = value as? String, let size = Float(value) {
                return view.font(.system(size: CGFloat(size)))
            }
        case .fontWeight:
            if let weight = value as? String {
                if #available(watchOS 9.0, *) {
                    return view.fontWeight(getFontWeightByName(weight))
                } else {
                    // Fallback on earlier versions
                }
            }
        case .fontWidth:
            if let width = value as? CGFloat {
                if #available(watchOS 9.0, *) {
                    return view.fontWidth(.init(width))
                } else {
                    // Fallback on earlier versions
                }
            }
            if let width = value as? String {
                if #available(watchOS 9.0, *) {
                    return view.fontWidth(getFontWidthByName(width))
                } else {
                    // Fallback on earlier versions
                }
            }
        case .fontDesign:
            if let design = value as? String {
                if #available(watchOS 9.1, *) {
                    return view.fontDesign(getFontDesignByName(design))
                } else {
                    // Fallback on earlier versions
                }
            }
        case .fontColor:
            if let colorName = value as? String {
                return view.foregroundColor(self.getColorByName(colorName))
            }
        case .cornerRadius:
            if let radius = value as? CGFloat {
                return view.cornerRadius(radius)
            }
        case .backgroundColor:
            if let colorName = value as? String {
                return view.background(self.getColorByName(colorName))
            }
        case .tintColor:
            if let colorName = value as? String {
                if #available(watchOS 9.0, *) {
                    return view.tint(getColorByName(colorName))
                } else {
                    // Fallback on earlier versions
                }
            }
        case .controlSize:
            if let controlSize = value as? String {
                if #available(watchOS 9.0, *) {
                    return view.controlSize(getControlSize(controlSize))
                } else {
                    // Fallback on earlier versions
                }
            }
        case .foregroundColor:
            if let colorName = value as? String {
                if #available(watchOS 8.0, *) {
                    return view.foregroundStyle(self.getColorByName(colorName))
                } else {
                    // Fallback on earlier versions
                }
            }
        case .borderColor:
            if let colorName = value as? String {
                if #available(watchOS 8.0, *) {
                    return view.border(self.getColorByName(colorName))
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        return view
    }

    private func getFontWeightByName(_ name: String) -> Font.Weight {
        switch name {
        case "ultraLight":
            return .ultraLight
        case "thin":
            return .thin
        case "light":
            return .light
        case "regular":
            return .regular
        case "medium":
            return .medium
        case "semibold":
            return .semibold
        case "bold":
            return .bold
        case "heavy":
            return .heavy
        case "black":
            return .black
        default:
            return .regular
        }
    }
    
    @available(watchOS 9.0, *)
    private func getFontWidthByName(_ name: String) -> Font.Width {
        switch name {
        case "compressed":
            return .compressed
        case "condensed":
            return .condensed
        case "standard":
            return .standard
        case "expanded":
            return .expanded
        default:
            return .standard
        }
    }
    
    private func getFontDesignByName(_ name: String) -> Font.Design {
        switch name {
        case "default":
            return .default
        case "serif":
            return .serif
        case "rounded":
            return .rounded
        case "monospaced":
            return .monospaced
        default:
            return .default
        }
    }
    
    private func getFontByName(_ name: String) -> Font {
        switch name {
        case "largeTitle":
            return .largeTitle
        case "title":
            return .title
        case "title2":
            return .title2
        case "title3":
            return .title3
        case "headline":
            return .headline
        case "subheadline":
            return .subheadline
        case "body":
            return .body
        case "callout":
            return .callout
        case "footnote":
            return .footnote
        case "caption":
            return .caption
        case "caption2":
            return .caption2
        default:
            return .system(.body)
        }
    }

    private func getColorByName(_ name: String) -> Color {
        StyleSheetConverter.toColor(value: name) ?? .black
    }
    
    @available(watchOS 9.0, *)
    private func getControlSize(_ name: String) -> ControlSize {
        switch name {
        case "large":
            return .large
        case "regular":
            return .regular
        case "extraLarge":
            if #available(iOS 17.0, *) {
                if #available(watchOS 10.0, *) {
                    return .extraLarge
                } else {
                    // Fallback on earlier versions
                    return .regular
                }
            } else {
                // Fallback on earlier versions
                return .large
            }
        case "small":
            return .small
        case "mini":
            return .mini
        default:
            return .regular
        }
    }
}

import SwiftUI

protocol _StyleGenerating {
    associatedtype Concrete: View
}

internal extension TextStyle {
    func _viewModifierFont() -> Font? {
        guard _font != nil else { return nil }
        var f = _font!
        if let fontWeight = _fontWeight {
            f = f.weight(fontWeight)
        }
        if let bold = _bold, bold {
            f = f.bold()
        }
        if let italic = _italic, italic {
            f = f.italic()
        }
        return f
    }
}

public struct TextStyle: IStyle, Decodable, _StyleGenerating {
    public init(font: Font? = nil) {
        if font != nil {
            self._font = font
        }
    }
        
    public init() {}
    public typealias Concrete = Text
    // sourcery: return_some_view
    var _font: Font? = nil
    // sourcery: return_concrete
    var _fontWeight: Font.Weight?
    // sourcery: return_some_view
    var _foregroundColor: Color? = nil
    // sourcery: swiftui_view_mod_param_true
    // sourcery: return_concrete
    var _bold: Bool? = nil
    // sourcery: swiftui_view_mod_param_true
    // sourcery: return_concrete
    var _italic: Bool? = nil
    // sourcery: return_some_view
    var _truncationMode: Text.TruncationMode? = nil
    // sourcery: return_some_view
    var _lineLimit: Int? = nil
    // sourcery: return_some_view
    var _lineSpacing: CGFloat? = nil
    // sourcery: return_some_view
    var _multilineTextAlignment: TextAlignment? = nil
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let fontColor = try container.decodeIfPresent(String.self, forKey: .fontColor) {
            self._foregroundColor = try Color(hexCode: fontColor)
        }
        
        let fontSize = try container.decodeIfPresent(Int.self, forKey: .fontSize) ?? 17
        
        if let fontName = try container.decodeIfPresent(String.self, forKey: .fontName) {
            self._font = SwiftUI.Font.custom(fontName, size: CGFloat(fontSize))
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case fontColor = "font-color"
        case fontName = "font-name"
        case fontSize = "font-size"
        case fontWight = "font-weight"
    }
    
    func toViewModifier() -> AnyViewModifier {
        AnyViewModifier { $0 /* .modifier(TextStyleViewModifier(style: self)) */ }
    }
}

public protocol IStyle {
//    associatedtype Body: View
    func merging(_ style: Self) -> Self
}

public class AnyIStyle {
    public let value: Any
    let _merging: (Any) -> Any

    public init<T: IStyle>(_ value: T) {
        self.value = value
        self._merging = { any in
            value.merging(any as! T)
        }
    }
}

public enum Style: Decodable {
    case text(TextStyle)
    case none
    
    public init(from decoder: Decoder) throws {
        if let value = try? TextStyle(from: decoder) {
            self = .text(value)
        } else {
            self = .none
        }
    }
    
    public func toViewModifier() -> AnyViewModifier {
        switch self {
        case .text(let style):
            return style.toViewModifier()
        case .none:
            return AnyViewModifier { $0.modifier(EmptyModifier()) }
        }
    }
}

struct DUMMY {
    var styles: [String: AnyIStyle]
    init() {
        let titleStyle = TextStyle().bold()
        let imageStyle = ImageStyle().resizable()
        
        self.styles = ["title": AnyIStyle(titleStyle), "image": AnyIStyle(imageStyle)]
    }
}

public extension Color {
    init(hexCode: String) throws {
        if hexCode.hasPrefix("#") {
            let start = hexCode.index(hexCode.startIndex, offsetBy: 1)
            let hexColor = String(hexCode[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                let r, g, b, a: Double
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = Double((hexNumber & 0xff000000) >> 24) / 255
                    g = Double((hexNumber & 0x00ff0000) >> 16) / 255
                    b = Double((hexNumber & 0x0000ff00) >> 8) / 255
                    a = Double(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, opacity: a)
                    return
                }
            } else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                let r, g, b: Double
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = Double((hexNumber & 0xff0000) >> 16) / 255
                    g = Double((hexNumber & 0x00ff00) >> 8) / 255
                    b = Double(hexNumber & 0x0000ff) / 255
                    self.init(red: r, green: g, blue: b, opacity: 1.0)
                    return
                }
            }
        }
        throw HexConversion.failed(hexCode)
    }
    
    enum HexConversion: Swift.Error {
        case failed(String)
        case invalidLength(String)
        
        var description: String {
            switch self {
            case .failed(let message):
                return message
            case .invalidLength(let message):
                return message
            }
        }
    }
}

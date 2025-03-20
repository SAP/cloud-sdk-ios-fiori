import SwiftUI

struct IconHorizontalAlignment: EnvironmentKey {
    // The default is `.leading`. `.center` and `.trailing` means `.trailing`.
    public static let defaultValue: HorizontalAlignment = .leading
}

public extension EnvironmentValues {
    // Determine the relative positioning of an icon within the `TextOrIcon` when both a text and an icon are present. . The default is `.leading`. `.center` and `.trailing` means `.trailing`.
    var iconHorizontalAlignment: HorizontalAlignment {
        get {
            self[IconHorizontalAlignment.self]
        } set {
            self[IconHorizontalAlignment.self] = newValue
        }
    }
}

/// TextOrIconView to display TextOrIcon
public struct TextOrIconView: View {
    @Environment(\.iconHorizontalAlignment) var iconHorizontalAlignment
    var content: TextOrIcon?
    
    /// init with TextOrIcon
    public init(_ content: TextOrIcon?) {
        self.content = content
    }
    
    init(status: TextOrIcon?) {
        self.content = status
    }
    
    init(substatus: TextOrIcon?) {
        self.content = substatus
    }
    
    init(node: TextOrIcon) {
        self.content = node
    }
    
    @ViewBuilder
    public var body: some View {
        if self.content != nil {
            switch self.content! {
            case .text(let txt):
                Text(txt)
                
            case .icon(let icon):
                icon
            
            case .both(let text, let icon):
                HStack(alignment: .center, spacing: 2) {
                    if self.iconHorizontalAlignment == .leading {
                        icon
                        Text(text)
                    } else {
                        Text(text)
                        icon
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
}

extension TextOrIconView: _ViewEmptyChecking {
    public var isEmpty: Bool {
        self.content == nil
    }
}

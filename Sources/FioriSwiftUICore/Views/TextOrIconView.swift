import SwiftUI

/// TextOrIconView to display TextOrIcon
public struct TextOrIconView: View {
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
        if content != nil {
            switch content! {
            case .text(let txt):
                Text(txt)
                
            case .icon(let icon):
                icon
            }
        } else {
            EmptyView()
        }
    }
}

extension TextOrIconView: _ViewEmptyChecking {
    var isEmpty: Bool {
        self.content == nil
    }
}

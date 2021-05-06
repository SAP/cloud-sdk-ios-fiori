import SwiftUI

extension VerticalAlignment {
    struct IconStackAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }
    
    static let iconStackAlignmentGuide = VerticalAlignment(IconStackAlignment.self)
    
    struct IconStackAlignment2: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }
    
    static let iconStackAlignmentGuide2 = VerticalAlignment(IconStackAlignment2.self)
}

extension IconStack: ViewList {
    public var count: Int {
        let tmpIcons: [IconStackItem] = _icons == nil ? [] : _icons!
        
        return tmpIcons.count
    }
    
    public func view(at index: Int) -> some View {
        let tmpIcons: [IconStackItem] = _icons == nil ? [] : _icons!
        
        return Group {
            switch tmpIcons[index] {
            case .text(let txt):
                Text(txt)
            case .icon(let icon):
                icon
            }
        }
    }
    
    public func isFirstItemAText() -> Bool {
        let tmpIcons: [IconStackItem] = _icons == nil ? [] : _icons!
        if tmpIcons.isEmpty {
            return false
        }
        
        switch tmpIcons[0] {
        case .text:
            return true
        case .icon:
            return false
        }
    }
    
    // allow the number of icons to be shown in Icon Stack
    public func numberOfIconsToShow() -> Int {
        numberOfLines
    }
}

struct IconStack_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IconStack(icons: [IconStackItem.text("hello")])
            IconStack(icons: [IconStackItem.text("1"), IconStackItem.icon(Image(systemName: "paperclip"))])
        }.previewLayout(.fixed(width: 200, height: 100))
    }
}

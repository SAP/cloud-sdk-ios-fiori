import SwiftUI

extension VerticalAlignment {
    struct IconStackAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }
    
    static let iconStackAlignmentGuide = VerticalAlignment(IconStackAlignment.self)
}

extension IconStack: ViewList {
    public var count: Int {
        let tmpIcons: [TextOrIcon] = _icons == nil ? [] : _icons!
        
        return tmpIcons.count
    }
    
    public func view(at index: Int) -> some View {
        let tmpIcons: [TextOrIcon] = _icons == nil ? [] : _icons!
        
        return Group {
            switch tmpIcons[index] {
            case .text(let txt):
                Text(txt)
            case .icon(let icon):
                icon
            case .both(let txt, let icon):
                Text(txt)
            }
        }
    }
    
    public func isFirstItemAText() -> Bool {
        let tmpIcons: [TextOrIcon] = _icons == nil ? [] : _icons!
        if tmpIcons.isEmpty {
            return false
        }
        
        switch tmpIcons[0] {
        case .text:
            return true
        case .icon:
            return false
        case .both:
            return true
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
            IconStack(icons: [TextOrIcon.text("hello")])
            IconStack(icons: [TextOrIcon.text("1"), TextOrIcon.icon(Image(systemName: "paperclip"))])
        }.previewLayout(.fixed(width: 200, height: 100))
    }
}

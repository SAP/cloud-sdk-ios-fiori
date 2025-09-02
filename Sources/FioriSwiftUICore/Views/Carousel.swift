import SwiftUI

private struct CarouselLayout: Layout {
    struct CacheData {
        var width: CGFloat
        var height: CGFloat
        var columns: [CGRect]
        
        mutating func clear() {
            self.width = 0
            self.height = 0
            self.columns.removeAll()
        }
    }

    /// Width of each item
    let itemWidth: CGFloat
    
    /// Horizontal spacing between views
    let spacing: CGFloat
    
    /// Vertical alignment in each column
    let alignment: VerticalAlignment
    
    /// Whether all subviews have same height which is the maximum height of all subviews
    let isSameHeight: Bool
    
    init(itemWidth: CGFloat, spacing: CGFloat = 8, alignment: VerticalAlignment = .top, isSameHeight: Bool = false) {
        self.itemWidth = itemWidth
        self.spacing = spacing
        self.alignment = alignment
        self.isSameHeight = isSameHeight
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        self.calculateLayout(for: subviews, cache: &cache)
        return CGSize(width: cache.columns.last?.maxX ?? 1, height: cache.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        self.calculateLayout(for: subviews, cache: &cache)
    
        for (i, column) in cache.columns.enumerated() {
            let y: CGFloat
            
            if self.isSameHeight {
                y = 0
            } else {
                switch self.alignment {
                case .top:
                    y = 0
                case .bottom:
                    y = cache.height - column.size.height
                default:
                    y = (cache.height - column.size.height) / 2
                }
            }
            
            let pt = CGPoint(x: column.origin.x + bounds.origin.x, y: y + bounds.origin.y)
            
            subviews[i].place(at: pt, proposal: ProposedViewSize(width: column.size.width, height: self.isSameHeight ? cache.height : nil))
        }
    }
    
    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(width: 0, height: 0, columns: [])
    }
    
    func calculateLayout(for subviews: Subviews, cache: inout CacheData) {
        if cache.width == self.itemWidth, subviews.count == cache.columns.count {
            return
        }
        cache.clear()
        cache.width = self.itemWidth

        let sizes = subviews.map {
            $0.sizeThatFits(ProposedViewSize(width: self.itemWidth, height: nil))
        }.map {
            if $0.width > self.itemWidth {
                return CGSize(width: self.itemWidth, height: $0.width)
            }
            return $0
        }
        
        for (i, size) in sizes.enumerated() {
            let x = CGFloat(i) * (itemWidth + self.spacing)
            let pt = CGPoint(x: x, y: 0)
            cache.height = max(cache.height, size.height)
            cache.columns.append(CGRect(origin: pt, size: size))
        }
    }
}

/**
 Carousel is a container view that arranges its child views  horizontally, one after the other, with a portion of the next child view visible in the container. It allows users to swipe or scroll through the child views to see different piece of content.
 
 ## Carousel with numberOfColumns:
 ```swift
 Carousel(numberOfColumns: 2, spacing: 8, alignment: .top, isSnapping: true) {
     ForEach(0..<16, id: \.self) { i in
         Text("Long long long Text \(i)")
             .font(.title)
             .padding()
             .background(Color.gray)
     }
 }
 .padding(8)
 .border(Color.gray)
 ```
 
 ## Carousel with fixed item width:
 ```swift
 Carousel(itemWidth: 320, spacing: 8, alignment: .top, isSnapping: true) {
     ForEach(0..<16, id: \.self) { i in
        Text("Long long long long Text \(i)")
             .font(.title)
             .padding()
             .background(Color.gray)
     }
 }
 .padding(8)
 .border(Color.gray)
 ```
 
 ## To display a specific view as the initial visible item in the Carousel, use ScrollViewReader to programmatically scroll to the view identified by a unique id.
 ```swift
 ScrollViewReader { proxy in
     Carousel(numberOfColumns: 2, spacing: 8, alignment: .top, isSnapping: true) {
         ForEach(0..<16, id: \.self) { i in
             Text("Long long long Text \(i)")
                 .font(.title)
                 .padding()
                 .frame(height: 100)
                 .background(Color.gray)
                 .id(i) // set id for each view
         }
     }
     .onAppear {
         DispatchQueue.main.async {
             proxy.scrollTo(0, anchor: layoutDirection == .rightToLeft ? .trailing : .leading) // scroll to the view with your desisred id
         }
     }
 }
 .padding(8)
 .border(Color.gray)
 ```

 */
public struct Carousel<Content>: View where Content: View {
    /// Number of columns
    let numberOfColumns: Int?
    
    /// Width of each item
    let itemWidth: CGFloat?
    
    /// Horizontal spacing between views
    let spacing: CGFloat
    
    /// Vertical alignment in the carousel
    let alignment: VerticalAlignment
    
    /// Whether it stops at a right position that the first visible subview can be displayed fully after scrolling.
    let isSnapping: Bool
    
    /// Whether all subviews have same height which is the maximum height of all subviews
    let isSameHeight: Bool
    
    /// Padding inside of the Carousel View
    let contentInsets: EdgeInsets
    
    /// The views representing the content of the Carousel
    var content: () -> Content
    
    /// Carousel content size
    @State private var contentSize = CGSize.zero
    
    @State private var containerWidth: CGFloat = 128
    
    var finalItemWidth: CGFloat {
        if let itemWidth = self.itemWidth {
            return itemWidth
        } else {
            let numberOfColumns = self.numberOfColumns ?? 1
            
            return max(1.0, (self.containerWidth - self.contentInsets.leading - CGFloat(numberOfColumns + 2) * self.spacing) / CGFloat(numberOfColumns))
        }
    }
    
    // Scroll target behavior for snapping
    private struct SnapScrollTargetBehavior: ScrollTargetBehavior {
        let isSnapping: Bool
        let itemWidth: CGFloat
        let contentInsets: EdgeInsets
        let spacing: CGFloat
        
        init(isSnapping: Bool = true, itemWidth: CGFloat, contentInsets: EdgeInsets, spacing: CGFloat) {
            self.isSnapping = isSnapping
            self.itemWidth = itemWidth
            self.contentInsets = contentInsets
            self.spacing = spacing
        }
        
        func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
            let maxX = max(0, context.contentSize.width - context.containerSize.width)
            var finalX = min(maxX, target.rect.origin.x)
            
            if self.isSnapping {
                let index = ((target.rect.origin.x - self.contentInsets.leading) / (self.itemWidth + self.spacing)).rounded()
                let idealX = index * self.itemWidth + max(0, index - 1) * self.spacing + (index == 0 ? 0 : self.contentInsets.leading)
                finalX = max(0, min(maxX, idealX))
            }
            target.rect.origin.x = finalX
        }
    }
        
    /// Create a Carousel View with number of columns
    /// - Parameters:
    ///   - numberOfColumns: Number of columns. The default is 1.
    ///   - contentInsets: Padding inside of the Carousel View
    ///   - spacing: Horizontal spacing between views. The default is 8.
    ///   - alignment: Vertical alignment in the carousel. The default is `.top`.
    ///   - isSnapping: Whether it stops at a right position that the first visible subview can be displayed fully after scrolling. The default is `true`.
    ///   - isSameHeight: Whether all subviews have same height which is the maximum height of all subviews
    ///   - content: The views representing the content of the Carousel
    public init(numberOfColumns: Int = 1, contentInsets: EdgeInsets = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16), spacing: CGFloat = 8, alignment: VerticalAlignment = .top, isSnapping: Bool = true, isSameHeight: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.numberOfColumns = numberOfColumns
        self.itemWidth = nil
        self.contentInsets = contentInsets
        self.spacing = spacing
        self.alignment = alignment
        self.isSnapping = isSnapping
        self.isSameHeight = isSameHeight
        self.content = content
    }
    
    /// Create a Carousel View with fixed item width
    /// - Parameters:
    ///   - itemWidth: Width of each item
    ///   - contentInsets: Padding inside of the Carousel View
    ///   - spacing: Horizontal spacing between views. The default is 8.
    ///   - alignment: Vertical alignment in the carousel. The default is `.top`.
    ///   - isSnapping: Whether it stops at a right position that the first visible subview can be displayed fully after scrolling. The default is `true`.
    ///   - isSameHeight: Whether all subviews have same height which is the maximum height of all subviews
    ///   - content: The views representing the content of the Carousel
    public init(itemWidth: CGFloat, contentInsets: EdgeInsets = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16), spacing: CGFloat = 8, alignment: VerticalAlignment = .top, isSnapping: Bool = true, isSameHeight: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.numberOfColumns = nil
        self.itemWidth = min(10000, max(1, itemWidth))
        self.contentInsets = contentInsets
        self.spacing = spacing
        self.alignment = alignment
        self.isSnapping = isSnapping
        self.isSameHeight = isSameHeight
        self.content = content
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            CarouselLayout(itemWidth: self.finalItemWidth, spacing: self.spacing, alignment: self.alignment, isSameHeight: self.isSameHeight) {
                self.content()
            }
            .padding(self.contentInsets)
            .onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: { newValue in
                self.contentSize = newValue
            }
            .scrollTargetLayout()
        }.onGeometryChange(for: CGFloat.self, of: { proxy in
            proxy.size.width
        }, action: { newValue in
            self.containerWidth = newValue
        })
        .scrollTargetBehavior(SnapScrollTargetBehavior(isSnapping: self.isSnapping, itemWidth: self.finalItemWidth, contentInsets: self.contentInsets, spacing: self.spacing))
        .frame(height: self.contentSize.height)
    }
}

#Preview("RTL") {
    ScrollViewReader { proxy in
        Carousel(numberOfColumns: 2, spacing: 8, alignment: .top, isSnapping: true) {
            ForEach(0 ..< 16, id: \.self) { i in
                Text("Long long long Text \(i)")
                    .font(.title)
                    .padding()
                    .background(Color.gray)
                    .id(i) // set id for each view
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                proxy.scrollTo(3, anchor: .trailing) // scroll to the view with your desired id
            }
        }
    }
    .padding(8)
    .border(Color.gray)
    .environment(\.layoutDirection, .rightToLeft)
}

#Preview("LTR") {
    ScrollViewReader { proxy in
        Carousel(itemWidth: 320, contentInsets: EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16), spacing: 8, alignment: .top, isSnapping: true) {
            ForEach(0 ..< 16, id: \.self) { i in
                Text("Long long long long Text \(i)")
                    .font(.title)
                    .padding()
                    .background(Color.gray)
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                proxy.scrollTo(3, anchor: .leading) // scroll to the view with your desisred id
            }
        }
    }
    .padding(8)
    .border(Color.gray)
}

import SwiftUI

/// Internal use only
struct CarouselLayout: Layout {
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
    
    /// Number of columns
    let numberOfColumns: Int
    
    /// Horizontal spacing between views
    let spacing: CGFloat
    
    /// Vertical alignment in each column
    let alignment: VerticalAlignment
    
    /// The point at which the origin of the content view is offset from the origin of the container view.
    let contentOffset: CGPoint
    
    let isSizeOnly: Bool
    
    init(numberOfColumns: Int = 1, spacing: CGFloat = 8, alignment: VerticalAlignment = .top, contentOffset: CGPoint = .zero, isSizeOnly: Bool = false) {
        self.numberOfColumns = max(1, numberOfColumns)
        self.spacing = spacing
        self.alignment = alignment
        self.contentOffset = contentOffset
        self.isSizeOnly = isSizeOnly
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        guard let containerWidth = proposal.width else {
            return .zero
        }
        
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        
        if self.isSizeOnly {
            return CGSize(width: cache.columns.last?.maxX ?? containerWidth, height: cache.height)
        } else {
            return CGSize(width: containerWidth, height: cache.height)
        }
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard let containerWidth = proposal.width else {
            return
        }
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        
        for (i, column) in cache.columns.enumerated() {
            let y: CGFloat
            switch self.alignment {
            case .top:
                y = 0
            case .bottom:
                y = cache.height - column.size.height
            default:
                y = (cache.height - column.size.height) / 2
            }
            
            let pt = CGPoint(x: column.origin.x + bounds.origin.x - self.contentOffset.x, y: y + bounds.origin.y)
            
            subviews[i].place(at: pt, proposal: ProposedViewSize(width: column.size.width, height: nil))
        }
    }
    
    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(width: 0, height: 0, columns: [])
    }
    
    func calculateLayout(for subviews: Subviews, containerWidth: CGFloat, cache: inout CacheData) {
        guard cache.width != containerWidth, !subviews.isEmpty, containerWidth > 0 else {
            return
        }
        cache.clear()
        cache.width = containerWidth

        let itemWidth: CGFloat = (containerWidth - CGFloat(self.numberOfColumns + 2) * self.spacing) / CGFloat(self.numberOfColumns)
        
        let sizes = subviews.map {
            $0.sizeThatFits(ProposedViewSize(width: itemWidth, height: nil))
        }.map {
            if $0.width > itemWidth {
                return CGSize(width: itemWidth, height: $0.width)
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
 Carousel
 A container view that arranges its child views  horizontally, one after the other, with a protion of the next child view visible in the container. It allows users to swipe or scroll through the child views to view fiffeernt piece of content.
 
 ## Example Initialization and Configuration
 ```swift
 Carousel(numberOfColumns: 3, spacing: 8, alignment: .top, isSnapping: true) {
     ForEach(0..<16, id: \.self) { i in
         Text("Text \(i)")
             .font(.title)
             .padding()
             .frame(height: 100)
             .background(Color.gray)
     }
 }
 .padding(8)
 .border(Color.gray)
 ```
 */
public struct Carousel<Content>: View where Content: View {
    /// Number of columns
    let numberOfColumns: Int
    
    /// Horizontal spacing between views
    let spacing: CGFloat
    
    /// Vertical alignment in the carousel
    let alignment: VerticalAlignment
    
    /// Whether it stops at a right position that the first visible subview can be displayed fully after scrolling.
    let isSnapping: Bool
    
    /// The views representing the content of the Carousel
    var content: () -> Content
    
    @Environment(\.layoutDirection) var layoutDirection
    
    /// Carousel content offset
    @State private var contentOffset = CGPoint.zero
    
    /// Carousel previous content offset
    @State private var preContentOffset = CGPoint.zero
    
    /// Carousel content size
    @State private var contentSize = CGSize.zero
    
    /// Carousel view size
    @State private var viewSize = CGSize.zero
    
    /// Create a Carousel View
    /// - Parameters:
    ///   - numberOfColumns: Number of columns. The default is 1.
    ///   - spacing: Horizontal spacing between views. The default is 8.
    ///   - alignment: Vertical alignment in the carousel. The default is `.top`.
    ///   - isSnapping: Whether it stops at a right position that the first visible subview can be displayed fully after scrolling. The default is `true`.
    ///   - content: The views representing the content of the Carousel
    public init(numberOfColumns: Int = 1, spacing: CGFloat = 8, alignment: VerticalAlignment = .top, isSnapping: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self.numberOfColumns = numberOfColumns
        self.spacing = spacing
        self.alignment = alignment
        self.isSnapping = isSnapping
        self.content = content
    }

    public var body: some View {
        CarouselLayout(numberOfColumns: self.numberOfColumns, spacing: self.spacing, alignment: self.alignment, contentOffset: self.contentOffset, isSizeOnly: false) {
            self.content()
        }
        .modifier(SizeModifier())
        .onPreferenceChange(SizePreferenceKey.self) { size in
            DispatchQueue.main.async {
                self.viewSize = size
            }
        }
        .background {
            CarouselLayout(numberOfColumns: self.numberOfColumns, spacing: self.spacing, alignment: self.alignment, isSizeOnly: true) {
                self.content()
            }
            .opacity(0.0)
            .modifier(SizeModifier())
            .onPreferenceChange(SizePreferenceKey.self) { size in
                DispatchQueue.main.async {
                    self.contentSize = size
                }
            }
        }
        .clipped()
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.contentOffset.x = self.preContentOffset.x + (self.layoutDirection == .leftToRight ? -1 : 1) * value.translation.width
                }
                .onEnded { value in
                    withAnimation(.easeOut(duration: 0.5)) {
                        let maxX = max(0, contentSize.width - self.viewSize.width)
                        let expectedX = max(0, preContentOffset.x + (self.layoutDirection == .leftToRight ? -1 : 1) * value.predictedEndTranslation.width)
                        var finalX = min(maxX, expectedX)
                        if self.isSnapping {
                            let itemWidth: CGFloat = (viewSize.width - CGFloat(self.numberOfColumns + 2) * self.spacing) / CGFloat(self.numberOfColumns)
                            let index = (expectedX / (itemWidth + self.spacing)).rounded()
                            finalX = max(0, min(maxX, index * (itemWidth + self.spacing) - self.spacing))
                        }
                        
                        self.contentOffset.x = finalX
                        self.preContentOffset = self.contentOffset
                    }
                }
        )
    }
}

#Preview {
    Carousel(numberOfColumns: 3, spacing: 8, alignment: .top, isSnapping: true) {
        ForEach(0 ..< 16, id: \.self) { i in
            Text("Text \(i)")
                .font(.title)
                .padding()
                .frame(height: 100)
                .background(Color.gray)
        }
    }
    .padding(8)
    .border(Color.gray)
    .environment(\.layoutDirection, .rightToLeft)
}

#Preview {
    Carousel(numberOfColumns: 2, spacing: 16, alignment: .bottom) {
        ForEach(0 ..< CardTests.cardSamples.count, id: \.self) { i in
            CardTests.cardSamples[i].border(Color.green)
        }
    }
    .padding()
    .border(Color.black)
    .cardStyle(.card)
}

#Preview {
    ScrollView(.horizontal) {
        LazyHStack {
            ForEach(0 ..< CardTests.cardSamples.count, id: \.self) { i in
                CardTests.cardSamples[i]
                    .frame(width: 200)
            }
        }
        .cardStyle(.card)
    }.padding()
}

import SwiftUI

/// It only works properly for one subview
private struct CarouselViewLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let containerWidth = proposal.width else {
            return .zero
        }
           
        let size: CGSize = subviews.map {
            $0.sizeThatFits(ProposedViewSize(width: containerWidth, height: nil))
        }.reduce(.zero) { partial, size in
            CGSize(width: max(partial.width, size.width), height: max(partial.height, size.height))
        }

        return CGSize(width: containerWidth, height: size.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard let containerWidth = proposal.width else {
            return
        }
        
        let _: CGSize = subviews.map {
            $0.sizeThatFits(ProposedViewSize(width: containerWidth, height: nil))
        }.reduce(.zero) { partial, size in
            CGSize(width: max(partial.width, size.width), height: max(partial.height, size.height))
        }
        
        for view in subviews {
            view.place(at: bounds.origin, proposal: ProposedViewSize(width: containerWidth, height: nil))
        }
    }
}

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
    
    /// Number of columns
    let numberOfColumns: Int
    
    /// Horizontal spacing between views
    let spacing: CGFloat
    
    /// Vertical alignment in each column
    let alignment: VerticalAlignment
    
    /// Whether all subviews have same height which is the maximum height of all subviews
    let isSameHeight: Bool
    
    init(numberOfColumns: Int = 1, spacing: CGFloat = 8, alignment: VerticalAlignment = .top, isSameHeight: Bool = false) {
        self.numberOfColumns = max(1, numberOfColumns)
        self.spacing = spacing
        self.alignment = alignment
        self.isSameHeight = isSameHeight
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        guard let containerWidth = proposal.width else {
            return .zero
        }
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        return CGSize(width: cache.columns.last?.maxX ?? containerWidth, height: cache.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard let containerWidth = proposal.width else {
            return
        }
        self.calculateLayout(for: subviews, containerWidth: containerWidth, cache: &cache)
        
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
    
    func calculateLayout(for subviews: Subviews, containerWidth: CGFloat, cache: inout CacheData) {
        guard cache.width != containerWidth, !subviews.isEmpty, containerWidth > 0 else {
            return
        }
        cache.clear()
        cache.width = containerWidth

        let itemWidth: CGFloat
        if subviews.count > self.numberOfColumns {
            itemWidth = (containerWidth - CGFloat(self.numberOfColumns + 2) * self.spacing) / CGFloat(self.numberOfColumns)
        } else {
            itemWidth = (containerWidth - CGFloat(self.numberOfColumns) * self.spacing + self.spacing) / CGFloat(self.numberOfColumns)
        }
        
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

private struct CarouselSizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = CGSize(width: max(value.width, nextValue().width),
                       height: max(value.height, nextValue().height))
    }
}

private struct CarouselSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.background(GeometryReader { proxy in
            Color.clear.preference(key: CarouselSizePreferenceKey.self, value: proxy.size)
        })
    }
}

private struct CarouselContentSizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = CGSize(width: max(value.width, nextValue().width),
                       height: max(value.height, nextValue().height))
    }
}

private struct CarouselContentSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.background(GeometryReader { proxy in
            Color.clear.preference(key: CarouselContentSizePreferenceKey.self, value: proxy.size)
        })
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
    
    /// Whether all subviews have same height which is the maximum height of all subviews
    let isSameHeight: Bool
    
    /// Padding inside of the Carousel View
    let contentInsets: EdgeInsets
    
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
    ///   - contentInsets: Padding inside of the Carousel View
    ///   - spacing: Horizontal spacing between views. The default is 8.
    ///   - alignment: Vertical alignment in the carousel. The default is `.top`.
    ///   - isSnapping: Whether it stops at a right position that the first visible subview can be displayed fully after scrolling. The default is `true`.
    ///   - isSameHeight: Whether all subviews have same height which is the maximum height of all subviews
    ///   - content: The views representing the content of the Carousel
    public init(numberOfColumns: Int = 1, contentInsets: EdgeInsets = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16), spacing: CGFloat = 8, alignment: VerticalAlignment = .top, isSnapping: Bool = true, isSameHeight: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.numberOfColumns = numberOfColumns
        self.contentInsets = contentInsets
        self.spacing = spacing
        self.alignment = alignment
        self.isSnapping = isSnapping
        self.isSameHeight = isSameHeight
        self.content = content
    }
    
    public var body: some View {
        CarouselViewLayout {
            HStack {
                CarouselLayout(numberOfColumns: self.numberOfColumns, spacing: self.spacing, alignment: self.alignment, isSameHeight: self.isSameHeight) {
                    self.content()
                }
            }
            .padding(self.contentInsets)
            .offset(x: -self.contentOffset.x)
            .modifier(CarouselContentSizeModifier())
            .onPreferenceChange(CarouselContentSizePreferenceKey.self) { size in
                DispatchQueue.main.async {
                    self.contentSize = size
                    let finalX = self.calculateContentOffsetX(from: self.contentOffset.x)
                    if abs(finalX.distance(to: self.contentOffset.x)) > 0.1 {
                        self.contentOffset.x = finalX
                        self.preContentOffset = self.contentOffset
                    }
                }
            }
            .contentShape(Rectangle())
            .highPriorityGesture(
                DragGesture(minimumDistance: 20)
                    .onChanged { value in
                        self.contentOffset.x = self.preContentOffset.x + (self.layoutDirection == .leftToRight ? -1 : 1) * value.translation.width
                    }
                    .onEnded { value in
                        withAnimation(.easeOut(duration: 0.5)) {
                            let expectedX = max(0, preContentOffset.x + (self.layoutDirection == .leftToRight ? -1 : 1) * value.predictedEndTranslation.width)
                            let finalX = self.calculateContentOffsetX(from: expectedX)
                            self.contentOffset.x = finalX
                            self.preContentOffset = self.contentOffset
                        }
                    }
            )
        }
        .modifier(CarouselSizeModifier())
        .onPreferenceChange(CarouselSizePreferenceKey.self) { size in
            DispatchQueue.main.async {
                self.viewSize = size
                let finalX = self.calculateContentOffsetX(from: self.contentOffset.x)
                if abs(finalX.distance(to: self.contentOffset.x)) > 0.1 {
                    self.contentOffset.x = finalX
                    self.preContentOffset = self.contentOffset
                }
            }
        }
    }
    
    func calculateContentOffsetX(from x: CGFloat) -> CGFloat {
        let maxX = max(0, contentSize.width - self.viewSize.width)
        var finalX = min(maxX, x)
        
        if self.isSnapping {
            let itemWidth: CGFloat = (viewSize.width - self.contentInsets.horizontal - CGFloat(self.numberOfColumns + 2) * self.spacing) / CGFloat(self.numberOfColumns)
            let index = ((x - self.contentInsets.leading) / (itemWidth + self.spacing)).rounded()
            let idealX = index * itemWidth + max(0, index - 1) * self.spacing + (index == 0 ? 0 : self.contentInsets.leading)
            finalX = max(0, min(maxX, idealX))
        }
        
        return finalX
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

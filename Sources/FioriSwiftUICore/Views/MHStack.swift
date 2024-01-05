import SwiftUI

/// A view that arranges its children in a multiple horizontal lines.
///
/// The following example shows a simple horizontal stack of five text views:
///
///     MHStack(spacing: 10, lineSpacing: 8) {
///         Tag("Started")
///
///         Tag("PM01")
///
///         Tag("103-Repair")
///     }
public struct MHStack<T: TagViewList>: View {
    let tags: T
    let spacing: CGFloat
    let lineSpacing: CGFloat
    
    @Environment(\.tagLimit) var tagLimit
    @State var mainViewSize = CGSize(width: -1, height: -1)
    
    init(tags: T, spacing: CGFloat? = 10, lineSpacing: CGFloat? = 10) {
        self.tags = tags
        self.spacing = spacing!
        self.lineSpacing = lineSpacing!
    }
    
    /// Creates a multiple line horizontal stack with the given spacing and line spacing
    ///
    /// - Parameters:
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - lineSpacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    public init(spacing: CGFloat? = 10, lineSpacing: CGFloat? = 10, @TagBuilder content: () -> T) {
        self.tags = content()
        self.spacing = spacing!
        self.lineSpacing = lineSpacing!
    }
    
    public var body: some View {
        if tagLimit == 0 || tags.count == 0 {
            EmptyView()
        } else {
            GeometryReader { geometry in
                self.makeBody(in: geometry)
            }
            .frame(height: mainViewSize.height < 0 ? nil : mainViewSize.height)
        }
    }

    func makeBody(in g: GeometryProxy) -> some View {
        var tagCount: Int = self.tags.count
        if let tmpTagLimit = tagLimit {
            tagCount = min(tmpTagLimit, self.tags.count)
        }
        
        var width = CGFloat.zero
        var height = CGFloat.zero
        var tmpMainViewSize: CGSize = .zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(0 ..< tagCount, id: \.self) { index in
                tags.view(at: index)
                    .padding(EdgeInsets(top: 0, leading: 1, bottom: 0, trailing: spacing))
                    .alignmentGuide(.leading, computeValue: { d in
                        if index == 0 {
                            tmpMainViewSize = .zero
                        }
                        
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height = -(tmpMainViewSize.height + lineSpacing)
                        }
                        let result = width
                        if index + 1 == tagCount {
                            width = 0 // last item
                        } else {
                            width -= d.width
                        }
                        
                        if abs(width) > tmpMainViewSize.width {
                            tmpMainViewSize.width = abs(width)
                        }
                        
                        if d.height + abs(height) > tmpMainViewSize.height {
                            tmpMainViewSize.height = d.height + abs(height)
                        }
                    
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if index + 1 == tagCount {
                            height = 0 // last item
                            
                            DispatchQueue.main.async {
                                mainViewSize = tmpMainViewSize
                            }
                        }
                        
                        return result
                    })
            }
        }
    }
}

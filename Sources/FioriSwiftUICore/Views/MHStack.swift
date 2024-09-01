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
    public init(spacing: CGFloat? = 8, lineSpacing: CGFloat? = 10, @TagBuilder content: () -> T) {
        self.tags = content()
        self.spacing = spacing!
        self.lineSpacing = lineSpacing!
    }
    
    public var body: some View {
        if self.tagCount == 0 {
            EmptyView()
        } else {
            GeometryReader { geometry in
                self.makeBody(in: geometry)
            }
            .frame(height: self.mainViewSize.height < 0 ? nil : self.mainViewSize.height)
        }
    }
    
    private var tagCount: Int {
        guard let limit = self.tagLimit else {
            return self.tags.count
        }
        
        if limit <= 1 {
            return min(1, self.tags.count)
        }
        
        return min(limit, self.tags.count)
    }

    func makeBody(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var tmpMainViewSize: CGSize = .zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(0 ..< self.tagCount, id: \.self) { index in
                self.tags.view(at: index)
                    .padding(EdgeInsets(top: 0, leading: 1, bottom: 0, trailing: self.spacing))
                    .alignmentGuide(.leading, computeValue: { d in
                        if index == 0 {
                            tmpMainViewSize = .zero
                        }
                        
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height = -(tmpMainViewSize.height + self.lineSpacing)
                        }
                        let result = width
                        if index + 1 == self.tagCount {
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
                        if index + 1 == self.tagCount {
                            height = 0 // last item
                            
                            DispatchQueue.main.async {
                                self.mainViewSize = tmpMainViewSize
                            }
                        }
                        
                        return result
                    })
            }
        }
    }
}

extension MHStack: _ViewEmptyChecking {
    public var isEmpty: Bool {
        self.tagCount == 0
    }
}

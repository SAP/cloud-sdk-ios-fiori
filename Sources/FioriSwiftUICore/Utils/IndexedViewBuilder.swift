import SwiftUI

/// A view container that allows access to view at a specific index.
public protocol IndexedViewContainer {
    associatedtype V: View
    
    /// number of View in the container
    var count: Int { get }
    
    /// the View at Index in the container
    func view(at index: Int) -> V
}

extension IndexedViewContainer {
    var isEmpty: Bool {
        count == 0
    }
}

/// SingleView
public struct SingleView<Content: View>: IndexedViewContainer {
    let view: Content
    
    public let count = 1
    
    /// the View at Index in the container
    public func view(at index: Int) -> some View {
        self.view
    }
}

/// Conditional single view
public struct ConditionalSingleView<TrueContent: View, FalseContent: View>: IndexedViewContainer {
    let first: TrueContent?
    let second: FalseContent?
    
    public let count = 1
    
    /// the View at Index in the PageView
    public func view(at index: Int) -> some View {
        Group {
            if self.first == nil {
                self.second
            } else {
                self.first
            }
        }
    }
}

/// Pair view
public struct PairView<First: View, Second: IndexedViewContainer>: IndexedViewContainer {
    let first: First
    let remainder: Second
    
    public var count: Int {
        self.remainder.count + 1
    }
    
    /// the View at Index in the TagViewList
    public func view(at index: Int) -> some View {
        Group {
            if index == 0 {
                self.first
            } else {
                self.remainder.view(at: index - 1)
            }
        }
    }
}

/// A custom view builder that return instance of type `IndexedViewContainer`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum IndexedViewBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> some IndexedViewContainer {
        SingleView(view: EmptyView())
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock(_ content: some View) -> some IndexedViewContainer {
        SingleView(view: content)
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: SingleView(view: c1))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: SingleView(view: c2)))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: SingleView(view: c3))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: SingleView(view: c4)))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: SingleView(view: c5))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: SingleView(view: c6)))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: PairView(first: c6, remainder: SingleView(view: c7))))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: PairView(first: c6, remainder: PairView(first: c7, remainder: SingleView(view: c8)))))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View, _ c9: some View) -> some IndexedViewContainer {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: PairView(first: c6, remainder: PairView(first: c7, remainder: PairView(first: c8, remainder: SingleView(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf(_ content: (some View)?) -> some IndexedViewContainer {
        SingleView(view: content == nil ? AnyView(EmptyView()) : AnyView(content!))
    }
    
    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalSingleView<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleView(first: first, second: nil)
    }
    
    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalSingleView<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleView(first: nil, second: second)
    }
}

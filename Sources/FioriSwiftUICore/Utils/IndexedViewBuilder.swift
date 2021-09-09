import SwiftUI

/// A view container that allows access to view at a specific index.
public protocol IndexedViewContainer {
    associatedtype V: View
    
    /// number of View in the PageView
    var count: Int { get }
    
    /// the View at Index in the PageView
    func view(at index: Int) -> V
}

/// SingleTag
public struct SingleView<Content: View>: IndexedViewContainer {
    let view: Content
    
    public let count = 1
    
    /// the View at Index in the PageView
    public func view(at index: Int) -> some View {
        self.view
    }
}

public struct ConditionalSingleView<TrueContent: View, FalseContent: View>: IndexedViewContainer {
    let first: TrueContent?
    let second: FalseContent?
    
    public let count = 1
    
    /// the View at Index in the PageView
    public func view(at index: Int) -> some View {
        Group {
            if first == nil {
                second
            } else {
                first
            }
        }
    }
}

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
                first
            } else {
                remainder.view(at: index - 1)
            }
        }
    }
}

/// A custom view builder that return instance of type `IndexedViewContainer`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder
public enum IndexedViewBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> some IndexedViewContainer {
        SingleView(view: EmptyView())
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock<Content>(_ content: Content) -> some IndexedViewContainer where Content: View {
        SingleView(view: content)
    }
    
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some IndexedViewContainer where C0: View, C1: View {
        PairView(first: c0, remainder: SingleView(view: c1))
    }
    
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some IndexedViewContainer where C0: View, C1: View, C2: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: SingleView(view: c2)))
    }
    
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some IndexedViewContainer where C0: View, C1: View, C2: View, C3: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: SingleView(view: c3))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some IndexedViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: SingleView(view: c4)))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some IndexedViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: SingleView(view: c5))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some IndexedViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: SingleView(view: c6)))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some IndexedViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: PairView(first: c6, remainder: SingleView(view: c7))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some IndexedViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: PairView(first: c6, remainder: PairView(first: c7, remainder: SingleView(view: c8)))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some IndexedViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        PairView(first: c0, remainder: PairView(first: c1, remainder: PairView(first: c2, remainder: PairView(first: c3, remainder: PairView(first: c4, remainder: PairView(first: c5, remainder: PairView(first: c6, remainder: PairView(first: c7, remainder: PairView(first: c8, remainder: SingleView(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf<Content>(_ content: Content?) -> some IndexedViewContainer where Content: View {
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

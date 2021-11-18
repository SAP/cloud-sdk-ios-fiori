import SwiftUI

/// protocol for TagViewList
public protocol TagViewList: View {
    associatedtype V: View
    
    /// number of View in the TagViewList
    var count: Int { get }
    
    /// the View at Index in the TagViewList
    func view(at index: Int) -> V
}

/// conform View protocol for IconStack
public extension TagViewList {
    var body: some View {
        MHStack(tags: self)
    }
}

/// SingleTag
public struct SingleTag<Content: View>: TagViewList {
    let view: Content
    
    public let count = 1
    
    /// the View at Index in the TagViewList
    public func view(at index: Int) -> some View {
        self.view
    }
}

public struct ConditionalSingleTag<TrueContent: View, FalseContent: View>: TagViewList {
    let first: TrueContent?
    let second: FalseContent?
    
    public let count = 1
    
    /// the View at Index in the TagViewList
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

public struct PairTag<First: View, Second: TagViewList>: TagViewList {
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

/// A custom parameter attribute that constructs views from closures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum TagBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock<Content>(_ content: Content) -> some TagViewList where Content: View {
        SingleTag(view: content)
    }
    
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some TagViewList where C0: View, C1: View {
        PairTag(first: c0, remainder: SingleTag(view: c1))
    }
    
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some TagViewList where C0: View, C1: View, C2: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: SingleTag(view: c2)))
    }
    
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some TagViewList where C0: View, C1: View, C2: View, C3: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: SingleTag(view: c3))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some TagViewList where C0: View, C1: View, C2: View, C3: View, C4: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: SingleTag(view: c4)))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some TagViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: SingleTag(view: c5))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some TagViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: SingleTag(view: c6)))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some TagViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: PairTag(first: c6, remainder: SingleTag(view: c7))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some TagViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: PairTag(first: c6, remainder: PairTag(first: c7, remainder: SingleTag(view: c8)))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some TagViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: PairTag(first: c6, remainder: PairTag(first: c7, remainder: PairTag(first: c8, remainder: SingleTag(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf<Content>(_ content: Content?) -> some TagViewList where Content: View {
        SingleTag(view: content == nil ? AnyView(EmptyView()) : AnyView(content!))
    }
    
    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalSingleTag<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleTag(first: first, second: nil)
    }
    
    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalSingleTag<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleTag(first: nil, second: second)
    }
}

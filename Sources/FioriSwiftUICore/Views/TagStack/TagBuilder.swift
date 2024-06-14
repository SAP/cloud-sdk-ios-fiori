import SwiftUI

/// protocol for TagViewList
public protocol TagViewList: View, _ViewEmptyChecking {
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

public extension TagViewList {
    var isEmpty: Bool {
        count == 0
    }
}

/// SingleTag
public struct SingleTag<Content: View>: TagViewList {
    let view: Content
    
    public var count: Int {
        self.view.isEmpty ? 0 : 1
    }
    
    /// the View at Index in the TagViewList
    public func view(at index: Int) -> some View {
        self.view
    }
}

public struct ConditionalSingleTag<TrueContent: View, FalseContent: View>: TagViewList {
    let first: TrueContent?
    let second: FalseContent?
    
    public var count: Int {
        if let first, !first.isEmpty {
            return 1
        }
        
        if let second, !second.isEmpty {
            return 1
        }
        
        return 0
    }
    
    /// the View at Index in the TagViewList
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

public struct PairTag<First: View, Second: TagViewList>: TagViewList {
    let first: First
    let remainder: Second
    
    public var count: Int {
        let firstCount = self.first.isEmpty ? 0 : 1
        return self.remainder.count + firstCount
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
    public static func buildBlock(_ content: some View) -> some TagViewList {
        SingleTag(view: content)
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View) -> some TagViewList {
        PairTag(first: c0, remainder: SingleTag(view: c1))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: SingleTag(view: c2)))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: SingleTag(view: c3))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: SingleTag(view: c4)))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: SingleTag(view: c5))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: SingleTag(view: c6)))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: PairTag(first: c6, remainder: SingleTag(view: c7))))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: PairTag(first: c6, remainder: PairTag(first: c7, remainder: SingleTag(view: c8)))))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View, _ c9: some View) -> some TagViewList {
        PairTag(first: c0, remainder: PairTag(first: c1, remainder: PairTag(first: c2, remainder: PairTag(first: c3, remainder: PairTag(first: c4, remainder: PairTag(first: c5, remainder: PairTag(first: c6, remainder: PairTag(first: c7, remainder: PairTag(first: c8, remainder: SingleTag(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf(_ content: (some View)?) -> some TagViewList {
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

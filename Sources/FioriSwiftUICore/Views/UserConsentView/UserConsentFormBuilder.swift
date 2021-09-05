import SwiftUI

/// protocol for PageView
public protocol PageViewContainer {
    associatedtype V: View
    
    /// number of View in the PageView
    var count: Int { get }
    
    /// the View at Index in the PageView
    func view(at index: Int) -> V
}

/// SingleTag
public struct SinglePage<Content: View>: PageViewContainer {
    let view: Content
    
    public let count = 1
    
    /// the View at Index in the PageView
    public func view(at index: Int) -> some View {
        self.view
    }
}

public struct ConditionalSinglePage<TrueContent: View, FalseContent: View>: PageViewContainer {
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

public struct PairPage<First: View, Second: PageViewContainer>: PageViewContainer {
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
@_functionBuilder
public enum UserConsentFormBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> some PageViewContainer {
        SinglePage(view: EmptyView())
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock<Content>(_ content: Content) -> some PageViewContainer where Content: View {
        SinglePage(view: content)
    }
    
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some PageViewContainer where C0: View, C1: View {
        PairPage(first: c0, remainder: SinglePage(view: c1))
    }
    
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some PageViewContainer where C0: View, C1: View, C2: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: SinglePage(view: c2)))
    }
    
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some PageViewContainer where C0: View, C1: View, C2: View, C3: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: PairPage(first: c2, remainder: SinglePage(view: c3))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some PageViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: PairPage(first: c2, remainder: PairPage(first: c3, remainder: SinglePage(view: c4)))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some PageViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: PairPage(first: c2, remainder: PairPage(first: c3, remainder: PairPage(first: c4, remainder: SinglePage(view: c5))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some PageViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: PairPage(first: c2, remainder: PairPage(first: c3, remainder: PairPage(first: c4, remainder: PairPage(first: c5, remainder: SinglePage(view: c6)))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some PageViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: PairPage(first: c2, remainder: PairPage(first: c3, remainder: PairPage(first: c4, remainder: PairPage(first: c5, remainder: PairPage(first: c6, remainder: SinglePage(view: c7))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some PageViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: PairPage(first: c2, remainder: PairPage(first: c3, remainder: PairPage(first: c4, remainder: PairPage(first: c5, remainder: PairPage(first: c6, remainder: PairPage(first: c7, remainder: SinglePage(view: c8)))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some PageViewContainer where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        PairPage(first: c0, remainder: PairPage(first: c1, remainder: PairPage(first: c2, remainder: PairPage(first: c3, remainder: PairPage(first: c4, remainder: PairPage(first: c5, remainder: PairPage(first: c6, remainder: PairPage(first: c7, remainder: PairPage(first: c8, remainder: SinglePage(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf<Content>(_ content: Content?) -> some PageViewContainer where Content: View {
        SinglePage(view: content == nil ? AnyView(EmptyView()) : AnyView(content!))
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

import SwiftUI

/// protocol for ViewList
public protocol ViewList: View {
    associatedtype V: View
    
    /// number of View in the ViewList
    var count: Int { get }
    
    /// the View at Index in the ViewList
    func view(at index: Int) -> V
    
    /// is first item a text in the ViewList
    func isFirstItemAText() -> Bool
    
    /// allow the number of icons to be shown in Icon Stack
    func numberOfIconsToShow() -> Int
}

/// conform View protocol for IconStack
public extension ViewList {
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            ForEach(0 ..< min(numberOfIconsToShow(), count)) { index in
                view(at: index)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }
        }
        .frame(width: 16)
        .clipped()
    }
}

/// Single
public struct Single<Content: View>: ViewList {
    @Environment(\.numberOfLines) var numberOfLines
    
    let view: Content
    public let count = 1
    
    /// the View at Index in the ViewList
    public func view(at index: Int) -> some View {
        self.view
    }
    
    /// is first item a text in the ViewList
    public func isFirstItemAText() -> Bool {
        if type(of: self.view) == Text.self {
            return true
        }
        
        return false
    }
    
    // allow the number of icons to be shown in Icon Stack
    public func numberOfIconsToShow() -> Int {
        self.numberOfLines
    }
}

public struct ConditionalSingle<TrueContent: View, FalseContent: View>: ViewList {
    @Environment(\.numberOfLines) var numberOfLines
    
    let first: TrueContent?
    let second: FalseContent?
    
    public let count = 1
    
    /// the View at Index in the ViewList
    public func view(at index: Int) -> some View {
        Group {
            if self.first == nil {
                self.second
            } else {
                self.first
            }
        }
    }
    
    /// is first item a text in the ViewList
    public func isFirstItemAText() -> Bool {
        if let item = first, type(of: item) == Text.self {
            return true
        } else if let item = second, type(of: item) == Text.self {
            return true
        }
        
        return false
    }
    
    // allow the number of icons to be shown in Icon Stack
    public func numberOfIconsToShow() -> Int {
        self.numberOfLines
    }
}

public struct Pair<First: View, Second: ViewList>: ViewList {
    @Environment(\.numberOfLines) var numberOfLines
    
    let first: First
    let remainder: Second
    
    public var count: Int {
        self.remainder.count + 1
    }
    
    /// the View at Index in the ViewList
    public func view(at index: Int) -> some View {
        Group {
            if index == 0 {
                self.first
            } else {
                self.remainder.view(at: index - 1)
            }
        }
    }
    
    /// is first item a text in the ViewList
    public func isFirstItemAText() -> Bool {
        if type(of: self.first) == Text.self {
            return true
        }
        
        return false
    }
    
    // allow the number of icons to be shown in Icon Stack
    public func numberOfIconsToShow() -> Int {
        self.numberOfLines
    }
}

/// A custom parameter attribute that constructs views from closures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder
public enum IconBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock<Content>(_ content: Content) -> some ViewList where Content: View {
        Single(view: content)
    }
    
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some ViewList where C0: View, C1: View {
        Pair(first: c0, remainder: Single(view: c1))
    }
    
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some ViewList where C0: View, C1: View, C2: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Single(view: c2)))
    }
    
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some ViewList where C0: View, C1: View, C2: View, C3: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Single(view: c3))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some ViewList where C0: View, C1: View, C2: View, C3: View, C4: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Single(view: c4)))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some ViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Single(view: c5))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some ViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Single(view: c6)))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some ViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Pair(first: c6, remainder: Single(view: c7))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some ViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Pair(first: c6, remainder: Pair(first: c7, remainder: Single(view: c8)))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some ViewList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Pair(first: c6, remainder: Pair(first: c7, remainder: Pair(first: c8, remainder: Single(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf<Content>(_ content: Content?) -> some ViewList where Content: View {
        Single(view: content == nil ? AnyView(EmptyView()) : AnyView(content!))
    }
    
    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalSingle<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingle(first: first, second: nil)
    }
    
    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalSingle<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingle(first: nil, second: second)
    }
}

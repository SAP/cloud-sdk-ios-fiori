import SwiftUI

/// A view that shows content in a VStack.
public protocol ViewList: View, _ViewEmptyChecking {
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
            ForEach(0 ..< min(numberOfIconsToShow(), count), id: \.self) { index in
                view(at: index)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .frame(width: 16)
            }
        }
        .clipped()
    }
}

public extension ViewList {
    var isEmpty: Bool {
        count == 0
    }
}

/// Single
public struct Single<Content: View>: ViewList {
    @Environment(\.numberOfLines) var numberOfLines
    
    let view: Content
    
    public var count: Int {
        self.view.isEmpty ? 0 : 1
    }
    
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
    
    public var count: Int {
        if let first, !first.isEmpty {
            return 1
        }
        
        if let second, !second.isEmpty {
            return 1
        }
        
        return 0
    }
    
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
        let firstCount = self.first.isEmpty ? 0 : 1
        return self.remainder.count + firstCount
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
@resultBuilder
public enum IconBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock(_ content: some View) -> some ViewList {
        Single(view: content)
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View) -> some ViewList {
        Pair(first: c0, remainder: Single(view: c1))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Single(view: c2)))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Single(view: c3))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Single(view: c4)))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Single(view: c5))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Single(view: c6)))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Pair(first: c6, remainder: Single(view: c7))))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Pair(first: c6, remainder: Pair(first: c7, remainder: Single(view: c8)))))))))
    }
    
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View, _ c9: some View) -> some ViewList {
        Pair(first: c0, remainder: Pair(first: c1, remainder: Pair(first: c2, remainder: Pair(first: c3, remainder: Pair(first: c4, remainder: Pair(first: c5, remainder: Pair(first: c6, remainder: Pair(first: c7, remainder: Pair(first: c8, remainder: Single(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf(_ content: (some View)?) -> some ViewList {
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

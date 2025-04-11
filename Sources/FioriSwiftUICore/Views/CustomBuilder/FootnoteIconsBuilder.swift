import FioriThemeManager
import SwiftUI

public protocol FootnoteIconList: View, _ViewEmptyChecking {
    associatedtype V: View
    var count: Int { get }
    func view(at index: Int) -> V
    
    var maxCount: Int { get }
    var size: CGSize { get }
    var isCircular: Bool { get }
    var spacing: CGFloat { get }
}

public extension FootnoteIconList {
    /// :nodoc:
    var body: some View {
        FootnoteIconsListView(icons: self)
    }
}

public extension FootnoteIconList {
    var isEmpty: Bool {
        count == 0
    }
}

public struct SingleFootnoteIcon<Content: View>: FootnoteIconList {
    let view: Content
    
    public var count: Int {
        self.view.isEmpty ? 0 : 1
    }
    
    public func view(at index: Int) -> some View {
        self.view
    }
    
    @Environment(\.footnoteIconsMaxCount) var footnoteIconsMaxCount
    @Environment(\.isFootnoteIconsCircular) var isFootnoteIconsCircular
    @Environment(\.footnoteIconsSpacing) var footnoteIconsSpacing
    @Environment(\.footnoteIconsSize) var footnoteIconsSize
    public var maxCount: Int {
        self.footnoteIconsMaxCount
    }

    public var size: CGSize {
        self.footnoteIconsSize
    }

    public var isCircular: Bool {
        self.isFootnoteIconsCircular
    }

    public var spacing: CGFloat {
        self.footnoteIconsSpacing
    }
}

public struct ConditionalSingleFootnoteIcon<TrueContent: View, FalseContent: View>: FootnoteIconList {
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
    
    public func view(at index: Int) -> some View {
        Group {
            if self.first == nil {
                self.second
            } else {
                self.first
            }
        }
    }
    
    @Environment(\.footnoteIconsMaxCount) var footnoteIconsMaxCount
    @Environment(\.isFootnoteIconsCircular) var isFootnoteIconsCircular
    @Environment(\.footnoteIconsSpacing) var footnoteIconsSpacing
    @Environment(\.footnoteIconsSize) var footnoteIconsSize
    public var maxCount: Int {
        self.footnoteIconsMaxCount
    }

    public var size: CGSize {
        self.footnoteIconsSize
    }

    public var isCircular: Bool {
        self.isFootnoteIconsCircular
    }

    public var spacing: CGFloat {
        self.footnoteIconsSpacing
    }
}

public struct PairFootnoteIcon<First: View, Second: FootnoteIconList>: FootnoteIconList {
    let first: First
    let remainder: Second
    
    public var count: Int {
        let firstCount = self.first.isEmpty ? 0 : 1
        return self.remainder.count + firstCount
    }
    
    public func view(at index: Int) -> some View {
        Group {
            if index == 0 {
                self.first
            } else {
                self.remainder.view(at: index - 1)
            }
        }
    }
    
    @Environment(\.footnoteIconsMaxCount) var footnoteIconsMaxCount
    @Environment(\.isFootnoteIconsCircular) var isFootnoteIconsCircular
    @Environment(\.footnoteIconsSpacing) var footnoteIconsSpacing
    @Environment(\.footnoteIconsSize) var footnoteIconsSize
    
    public var maxCount: Int {
        self.footnoteIconsMaxCount
    }

    public var size: CGSize {
        self.footnoteIconsSize
    }

    public var isCircular: Bool {
        self.isFootnoteIconsCircular
    }

    public var spacing: CGFloat {
        self.footnoteIconsSpacing
    }
}

/// A custom parameter attribute that constructs views from closures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum FootnoteIconsBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock(_ content: some View) -> some FootnoteIconList {
        SingleFootnoteIcon(view: content)
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: SingleFootnoteIcon(view: c1))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: SingleFootnoteIcon(view: c2)))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: SingleFootnoteIcon(view: c3))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: SingleFootnoteIcon(view: c4)))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: SingleFootnoteIcon(view: c5))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: SingleFootnoteIcon(view: c6)))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: PairFootnoteIcon(first: c6, remainder: SingleFootnoteIcon(view: c7))))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: PairFootnoteIcon(first: c6, remainder: PairFootnoteIcon(first: c7, remainder: SingleFootnoteIcon(view: c8)))))))))
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View, _ c2: some View, _ c3: some View, _ c4: some View, _ c5: some View, _ c6: some View, _ c7: some View, _ c8: some View, _ c9: some View) -> some FootnoteIconList {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: PairFootnoteIcon(first: c6, remainder: PairFootnoteIcon(first: c7, remainder: PairFootnoteIcon(first: c8, remainder: SingleFootnoteIcon(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf(_ content: (some View)?) -> some FootnoteIconList {
        SingleFootnoteIcon(view: content == nil ? AnyView(EmptyView()) : AnyView(content!))
    }
    
    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalSingleFootnoteIcon<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleFootnoteIcon(first: first, second: nil)
    }
    
    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalSingleFootnoteIcon<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleFootnoteIcon(first: nil, second: second)
    }
}

extension FootnoteIconStack: FootnoteIconList {
    public var count: Int {
        let tmpIcons: [TextOrIcon] = _footnoteIcons == nil ? [] : _footnoteIcons!
        return tmpIcons.count
    }
    
    public func view(at index: Int) -> some View {
        let tmpIcons: [TextOrIcon] = _footnoteIcons == nil ? [] : _footnoteIcons!
        
        return Group {
            switch tmpIcons[index] {
            case .text(let txt):
                Text(txt)
            case .icon(let icon):
                icon
            case .both(let txt, let icon):
                Text(txt)
            }
        }
    }
    
    public var maxCount: Int {
        footnoteIconsMaxCount
    }

    public var size: CGSize {
        footnoteIconsSize
    }

    public var isCircular: Bool {
        isFootnoteIconsCircular
    }

    public var spacing: CGFloat {
        footnoteIconsSpacing
    }
}

struct FootnoteIconsMaxCount: EnvironmentKey {
    public static let defaultValue: Int = 0
}

public extension EnvironmentValues {
    /// Maximum number of the footnote icons. Default value is 0. When the count is less or equal to 0, means the number is unlimited.
    var footnoteIconsMaxCount: Int {
        get { self[FootnoteIconsMaxCount.self] }
        set { self[FootnoteIconsMaxCount.self] = newValue }
    }
}

struct IsFootnoteIconsCircular: EnvironmentKey {
    public static let defaultValue: Bool = true
}

public extension EnvironmentValues {
    /// Specifies whether the `footnoteIcons` are drawn as circular. Default value is `true`.
    var isFootnoteIconsCircular: Bool {
        get { self[IsFootnoteIconsCircular.self] }
        set { self[IsFootnoteIconsCircular.self] = newValue }
    }
}

struct FootnoteIconsSpacing: EnvironmentKey {
    public static let defaultValue: CGFloat = -2
}

public extension EnvironmentValues {
    /// Dimensions of the footnote icons spacing. Default value is -2.
    var footnoteIconsSpacing: CGFloat {
        get { self[FootnoteIconsSpacing.self] }
        set { self[FootnoteIconsSpacing.self] = newValue }
    }
}

struct FootnoteIconsSize: EnvironmentKey {
    public static let defaultValue = CGSize(width: 16, height: 16)
}

public extension EnvironmentValues {
    /// Dimensions of footnote icons. Default value is `16x16`.
    var footnoteIconsSize: CGSize {
        get { self[FootnoteIconsSize.self] }
        set { self[FootnoteIconsSize.self] = newValue }
    }
}

struct FootnoteIconsTextPosition: EnvironmentKey {
    static let defaultValue: AvatarStack.TextPosition = .trailing
}

public extension EnvironmentValues {
    /// Text position for footnote icons.
    var footnoteIconsTextPosition: AvatarStack.TextPosition {
        get { self[FootnoteIconsTextPosition.self] }
        set { self[FootnoteIconsTextPosition.self] = newValue }
    }
}

public extension View {
    /// Specific the position of the text that drawn for footnote icons. Default value is `.trailing`.
    /// - Parameter position: Text position.
    /// - Returns: A view that footnote icons text with specific position.
    func footnoteIconsTextPosition(_ position: AvatarStack.TextPosition) -> some View {
        environment(\.footnoteIconsTextPosition, position)
    }

    /// Maximum number of the footnote icons. Default value is 0. When the count is less or equal to 0, means the number is unlimited.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             footnoteIcons: {
    ///                 Image(systemName: "circle.fill")
    ///                 Image(systemName: "person.fill")
    ///             })
    ///             .footnoteIconsMaxCount(1)
    /// ```
    /// - Parameter count: The number of icons.
    /// - Returns: A view that limits the count of footnote icons.
    func footnoteIconsMaxCount(_ count: Int) -> some View {
        environment(\.footnoteIconsMaxCount, count)
    }
    
    /// Specifies whether the `footnoteIcons` are drawn as circular. Default value is `true`.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             footnoteIcons: {
    ///                 Image(systemName: "circle.fill")
    ///                 Image(systemName: "person.fill")
    ///             })
    ///             .isFootnoteIconsCircular(false)
    /// ```
    /// - Parameter isCircular: Boolean denoting whether the footnote icons are circular.
    /// - Returns: A view that footnote icons are circular or not.
    func isFootnoteIconsCircular(_ isCircular: Bool) -> some View {
        environment(\.isFootnoteIconsCircular, isCircular)
    }
    
    /// Dimensions of the footnote icons spacing. Default value is -2.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             footnoteIcons: {
    ///                 Image(systemName: "circle.fill")
    ///                 Image(systemName: "person.fill")
    ///             })
    ///             .footnoteIconsSpacing(2)
    /// ```
    /// - Parameter borderWidth: Dimensions of the footnote icons spacing.
    /// - Returns: A view that footnote icons with specific spacing.
    func footnoteIconsSpacing(_ spacing: CGFloat) -> some View {
        environment(\.footnoteIconsSpacing, spacing)
    }
    
    /// Dimensions of footnote icons. Default value is `16x16`.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             footnoteIcons: {
    ///                 Image(systemName: "circle.fill")
    ///                 Image(systemName: "person.fill")
    ///             })
    ///             .footnoteIconsSize(CGSize(22, 22))
    /// ```
    /// - Parameter size: The size of the footnote icons.
    /// - Returns: A view that limits the size of footnote icons.
    func footnoteIconsSize(_ size: CGSize) -> some View {
        environment(\.footnoteIconsSize, size)
    }
}

@available(*, deprecated, message: "Use AvatarStack.TextPosition instead. And this will be removed in the future release.")
/// Text position for icons.
public enum TextPosition {
    /// Top position for text.
    case top
    /// Bottom position for text.
    case bottom
    /// Leading position for text.
    case leading
    /// Trailing position for text.
    case trailing
    
    var alignment: Alignment {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

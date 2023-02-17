import FioriThemeManager
import SwiftUI

public protocol FootnoteIconList: View {
    associatedtype V: View
    var count: Int { get }
    func view(at index: Int) -> V
    
    var maxCount: Int { get }
    var size: CGSize { get }
    var isCircular: Bool { get }
    var spacing: CGFloat { get }
}

public extension FootnoteIconList {
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< min(count, maxCount), id: \.self) { index in
                view(at: index)
                    .frame(width: size.width, height: size.height)
                    .ifApply(isCircular) {
                        $0.clipShape(Capsule())
                    }
                    .overlay {
                        Group {
                            if isCircular {
                                Capsule()
                                    .strokeBorder(Color.preferredColor(.separator), lineWidth: 0.33)
                            } else {
                                Rectangle()
                                    .strokeBorder(Color.preferredColor(.separator), lineWidth: 0.33)
                            }
                        }
                    }
            }
        }
        .frame(height: size.height)
        .clipped()
    }
}

public struct SingleFootnoteIcon<Content: View>: FootnoteIconList {
    let view: Content
    public let count = 1
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
    
    public let count = 1
    
    public func view(at index: Int) -> some View {
        Group {
            if first == nil {
                second
            } else {
                first
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
        self.remainder.count + 1
    }
    
    public func view(at index: Int) -> some View {
        Group {
            if index == 0 {
                first
            } else {
                remainder.view(at: index - 1)
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
    public static func buildBlock<Content>(_ content: Content) -> some FootnoteIconList where Content: View {
        SingleFootnoteIcon(view: content)
    }
    
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some FootnoteIconList where C0: View, C1: View {
        PairFootnoteIcon(first: c0, remainder: SingleFootnoteIcon(view: c1))
    }
    
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some FootnoteIconList where C0: View, C1: View, C2: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: SingleFootnoteIcon(view: c2)))
    }
    
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some FootnoteIconList where C0: View, C1: View, C2: View, C3: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: SingleFootnoteIcon(view: c3))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some FootnoteIconList where C0: View, C1: View, C2: View, C3: View, C4: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: SingleFootnoteIcon(view: c4)))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some FootnoteIconList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: SingleFootnoteIcon(view: c5))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some FootnoteIconList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: SingleFootnoteIcon(view: c6)))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some FootnoteIconList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: PairFootnoteIcon(first: c6, remainder: SingleFootnoteIcon(view: c7))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some FootnoteIconList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: PairFootnoteIcon(first: c6, remainder: PairFootnoteIcon(first: c7, remainder: SingleFootnoteIcon(view: c8)))))))))
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some FootnoteIconList where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        PairFootnoteIcon(first: c0, remainder: PairFootnoteIcon(first: c1, remainder: PairFootnoteIcon(first: c2, remainder: PairFootnoteIcon(first: c3, remainder: PairFootnoteIcon(first: c4, remainder: PairFootnoteIcon(first: c5, remainder: PairFootnoteIcon(first: c6, remainder: PairFootnoteIcon(first: c7, remainder: PairFootnoteIcon(first: c8, remainder: SingleFootnoteIcon(view: c9))))))))))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf<Content>(_ content: Content?) -> some FootnoteIconList where Content: View {
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
    public static let defaultValue = Int.max
}

public extension EnvironmentValues {
    var footnoteIconsMaxCount: Int {
        get { self[FootnoteIconsMaxCount.self] }
        set { self[FootnoteIconsMaxCount.self] = newValue }
    }
}

struct IsFootnoteIconsCircular: EnvironmentKey {
    public static let defaultValue: Bool = true
}

public extension EnvironmentValues {
    var isFootnoteIconsCircular: Bool {
        get { self[IsFootnoteIconsCircular.self] }
        set { self[IsFootnoteIconsCircular.self] = newValue }
    }
}

struct FootnoteIconsSpacing: EnvironmentKey {
    public static let defaultValue: CGFloat = -2
}

public extension EnvironmentValues {
    var footnoteIconsSpacing: CGFloat {
        get { self[FootnoteIconsSpacing.self] }
        set { self[FootnoteIconsSpacing.self] = newValue }
    }
}

struct FootnoteIconsSize: EnvironmentKey {
    public static let defaultValue = CGSize(width: 16, height: 16)
}

public extension EnvironmentValues {
    var footnoteIconsSize: CGSize {
        get { self[FootnoteIconsSize.self] }
        set { self[FootnoteIconsSize.self] = newValue }
    }
}

public extension View {
    func footnoteIconsMaxCount(_ count: Int) -> some View {
        environment(\.footnoteIconsMaxCount, count)
    }
    
    func isFootnoteIconsCircular(_ isCircular: Bool) -> some View {
        environment(\.isFootnoteIconsCircular, isCircular)
    }
    
    func footnoteIconsSpacing(_ spacing: CGFloat) -> some View {
        environment(\.footnoteIconsSpacing, spacing)
    }
    
    func footnoteIconsSize(_ size: CGSize) -> some View {
        environment(\.footnoteIconsSize, size)
    }
}

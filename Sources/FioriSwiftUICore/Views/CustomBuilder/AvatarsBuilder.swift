import SwiftUI

public protocol AvatarList: View, _ViewEmptyChecking {
    associatedtype V: View
    var count: Int { get }
    func view(at index: Int) -> V
    
    var borderColor: Color { get }
    var borderWidth: CGFloat { get }
    var isCircular: Bool { get }
    var size: CGSize { get }
}

public extension AvatarList {
    /// :nodoc:
    @ViewBuilder func buildAvatar(_ avatar: V) -> some View {
        Group {
            if isCircular {
                avatar
                    .frame(width: size.width, height: size.height)
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .inset(by: borderWidth / 2.0)
                            .stroke(borderColor, lineWidth: borderWidth)
                    }
            } else {
                avatar
                    .frame(width: size.width, height: size.height)
                    .border(borderColor, width: borderWidth)
            }
        }
    }
    
    /// :nodoc:
    var body: some View {
        Group {
            if count == 1 {
                self.buildAvatar(view(at: 0))
            } else if count >= 2 {
                ZStack(alignment: .topLeading) {
                    self.buildAvatar(view(at: 0))
                    self.buildAvatar(view(at: 1))
                        .position(x: size.width, y: size.height)
                }
                .frame(width: size.width * 1.5, height: size.height * 1.5)
            } else {
                EmptyView()
            }
        }
    }
}

public extension AvatarList {
    var isEmpty: Bool {
        count == 0
    }
}

public struct SingleAvatar<Content: View>: AvatarList {
    let view: Content
    
    public var count: Int {
        self.view.isEmpty ? 0 : 1
    }
    
    public func view(at index: Int) -> some View {
        self.view
    }
    
    @Environment(\.avatarBorderColor) var avatarBorderColor
    @Environment(\.avatarBorderWidth) var avatarBorderWidth
    @Environment(\.isAvatarCircular) var isAvatarCircular
    @Environment(\.avatarSize) var avatarSize
    
    public var borderColor: Color {
        self.avatarBorderColor
    }

    public var borderWidth: CGFloat {
        self.avatarBorderWidth
    }

    public var isCircular: Bool {
        self.isAvatarCircular
    }

    public var size: CGSize {
        self.avatarSize
    }
}

public struct ConditionalSingleAvatar<TrueContent: View, FalseContent: View>: AvatarList {
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
    
    @Environment(\.avatarBorderColor) var avatarBorderColor
    @Environment(\.avatarBorderWidth) var avatarBorderWidth
    @Environment(\.isAvatarCircular) var isAvatarCircular
    @Environment(\.avatarSize) var avatarSize
    
    public var borderColor: Color {
        self.avatarBorderColor
    }

    public var borderWidth: CGFloat {
        self.avatarBorderWidth
    }

    public var isCircular: Bool {
        self.isAvatarCircular
    }

    public var size: CGSize {
        self.avatarSize
    }
}

public struct PairAvatar<First: View, Second: AvatarList>: AvatarList {
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
    
    @Environment(\.avatarBorderColor) var avatarBorderColor
    @Environment(\.avatarBorderWidth) var avatarBorderWidth
    @Environment(\.isAvatarCircular) var isAvatarCircular
    @Environment(\.avatarSize) var avatarSize
    
    public var borderColor: Color {
        self.avatarBorderColor
    }

    public var borderWidth: CGFloat {
        self.avatarBorderWidth
    }

    public var isCircular: Bool {
        self.isAvatarCircular
    }

    public var size: CGSize {
        self.avatarSize
    }
}

/// A custom parameter attribute that constructs views from closures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum AvatarsBuilder {
    /// Builds an empty view from a block containing no statements.
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`
    public static func buildBlock(_ content: some View) -> some AvatarList {
        SingleAvatar(view: content)
    }
    
    /// :nodoc:
    public static func buildBlock(_ c0: some View, _ c1: some View) -> some AvatarList {
        PairAvatar(first: c0, remainder: SingleAvatar(view: c1))
    }
    
    /// Provides support for “if” statements in multi-statement closures,
    /// producing an optional view that is visible only when the condition
    /// evaluates to `true`.
    public static func buildIf(_ content: (some View)?) -> some AvatarList {
        SingleAvatar(view: content == nil ? AnyView(EmptyView()) : AnyView(content!))
    }
    
    /// Provides support for "if" statements in multi-statement closures,
    /// producing conditional content for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalSingleAvatar<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleAvatar(first: first, second: nil)
    }
    
    /// Provides support for "if-else" statements in multi-statement closures,
    /// producing conditional content for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalSingleAvatar<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        ConditionalSingleAvatar(first: nil, second: second)
    }
}

extension AvatarStack: AvatarList {
    public var count: Int {
        let tmpIcons: [TextOrIcon] = _avatars == nil ? [] : _avatars!
        
        return tmpIcons.count
    }
    
    public func view(at index: Int) -> some View {
        let tmpIcons: [TextOrIcon] = _avatars == nil ? [] : _avatars!
        return Group {
            switch tmpIcons[index] {
            case .text(let txt):
                Text(txt)
            case .icon(let icon):
                icon
            }
        }
    }
    
    public var borderColor: Color {
        avatarBorderColor
    }

    public var borderWidth: CGFloat {
        avatarBorderWidth
    }

    public var isCircular: Bool {
        isAvatarCircular
    }

    public var size: CGSize {
        avatarSize
    }
}

struct AvatarBorderColor: EnvironmentKey {
    public static let defaultValue = Color.clear
}

public extension EnvironmentValues {
    /// The avatars border color. Default value is `clear`.
    var avatarBorderColor: Color {
        get { self[AvatarBorderColor.self] }
        set { self[AvatarBorderColor.self] = newValue }
    }
}

struct AvatarBorderWidth: EnvironmentKey {
    public static let defaultValue: CGFloat = 0
}

public extension EnvironmentValues {
    /// Dimensions of the avatars border width. Default value is 0.
    var avatarBorderWidth: CGFloat {
        get { self[AvatarBorderWidth.self] }
        set { self[AvatarBorderWidth.self] = newValue }
    }
}

struct IsAvatarCircular: EnvironmentKey {
    public static let defaultValue: Bool = true
}

public extension EnvironmentValues {
    /// Specifies whether the `avatars` are drawn as circular. Default value is `true`.
    var isAvatarCircular: Bool {
        get { self[IsAvatarCircular.self] }
        set { self[IsAvatarCircular.self] = newValue }
    }
}

struct AvatarSize: EnvironmentKey {
    public static let defaultValue = CGSize(width: 45, height: 45)
}

public extension EnvironmentValues {
    /// Dimensions of avatars size. Default value is `45x45`.
    var avatarSize: CGSize {
        get { self[AvatarSize.self] }
        set { self[AvatarSize.self] = newValue }
    }
}

public extension View {
    /// Set the avatars border color. Default value is `clear`.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             avatars: {
    ///                 Image(systemName: "circle.fill")
    ///             })
    ///             .avatarBorderColor(Color.red)
    /// ```
    /// - Parameter color: Border color.
    /// - Returns: A view with specific border color of avatars.
    func avatarBorderColor(_ color: Color) -> some View {
        environment(\.avatarBorderColor, color)
    }
    
    /// Dimensions of avatars. Default value is `45x45`.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             avatars: {
    ///                 Image(systemName: "circle.fill")
    ///             })
    ///             .avatarSize(CGSize(30, 30))
    /// ```
    /// - Parameter size: The size of the avatars.
    /// - Returns: A view that limits the size of avatars.
    func avatarSize(_ size: CGSize) -> some View {
        environment(\.avatarSize, size)
    }
    
    /// Specifies whether the `avatars` are drawn as circular. Default value is `true`.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             avatars: {
    ///                 Image(systemName: "circle.fill")
    ///             })
    ///             .isAvatarCircular(true)
    /// ```
    /// - Parameter isCircular: Boolean denoting whether the avatars are circular.
    /// - Returns: A view that avatars are cirlcular or not.
    func isAvatarCircular(_ isCircular: Bool) -> some View {
        environment(\.isAvatarCircular, isCircular)
    }
    
    /// Dimensions of the avatars border width. Default value is 0.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             avatars: {
    ///                 Image(systemName: "circle.fill")
    ///             })
    ///             .avatarBorderWidth(2)
    /// ```
    /// - Parameter borderWidth: Dimensions of the avatars border width.
    /// - Returns: A view that avatars with specific boreder width.
    func avatarBorderWidth(_ borderWidth: CGFloat) -> some View {
        environment(\.avatarBorderWidth, borderWidth)
    }
}

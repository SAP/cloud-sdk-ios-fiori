import SwiftUI

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
    public static let defaultValue: CGSize? = nil
}

public extension EnvironmentValues {
    /// Dimensions of avatars size. Default value is `45x45` for `group`, and `16x16` for horizontal avatars.
    var avatarSize: CGSize? {
        get { self[AvatarSize.self] }
        set { self[AvatarSize.self] = newValue }
    }
}

struct AvatarsTitlePosition: EnvironmentKey {
    public static let defaultValue: AvatarStack.TextPosition = .trailing
}

public extension EnvironmentValues {
    /// Title position of avatar stack. Default value is `trailing`.
    var avatarsTitlePosition: AvatarStack.TextPosition {
        get { self[AvatarsTitlePosition.self] }
        set { self[AvatarsTitlePosition.self] = newValue }
    }
}

struct AvatarsLayout: EnvironmentKey {
    public static let defaultValue: AvatarStack.Layout = .grouped
}

public extension EnvironmentValues {
    /// Layout for avatars in the stack. Default value is `.grouped`.
    var avatarsLayout: AvatarStack.Layout {
        get { self[AvatarsLayout.self] }
        set { self[AvatarsLayout.self] = newValue }
    }
}

struct AvatarsMaxCount: EnvironmentKey {
    public static let defaultValue: Int? = nil
}

public extension EnvironmentValues {
    /// Max count for avatars in the stack. Default value is nil.
    var avatarsMaxCount: Int? {
        get { self[AvatarsMaxCount.self] }
        set { self[AvatarsMaxCount.self] = newValue }
    }
}

struct AvatarsSpacing: EnvironmentKey {
    public static let defaultValue: CGFloat = -1
}

public extension EnvironmentValues {
    /// Spacing for avatars in horizontal stack. Default value is -1.
    var avatarsSpacing: CGFloat {
        get { self[AvatarsSpacing.self] }
        set { self[AvatarsSpacing.self] = newValue }
    }
}

public extension View {
    /// Set the avatars border. Default value is `clear`.
    /// ```swift
    ///  _ObjectItem(title: "Object Item",
    ///             avatars: {
    ///                 Image(systemName: "circle.fill")
    ///             })
    ///             .avatarsBorder(Color.red, width: 2)
    /// ```
    /// - Parameter color: Border color.
    /// - Parameter width: Border width.
    /// - Returns: A view with specific border of avatars.
    func avatarsBorder(_ color: Color, width: CGFloat = 1) -> some View {
        environment(\.avatarBorderColor, color)
            .environment(\.avatarBorderWidth, width)
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
    func avatarSize(_ size: CGSize?) -> some View {
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
    /// - Returns: A view that avatars are circular or not.
    func isAvatarCircular(_ isCircular: Bool) -> some View {
        environment(\.isAvatarCircular, isCircular)
    }
    
    /// :nodoc:
    @available(*, deprecated, message: "Use `func avatarsBorder(_ color: Color, width: CGFloat = 1) -> some View` instead. And this will be removed in the future release.")
    func avatarBorderColor(_ color: Color) -> some View {
        environment(\.avatarBorderColor, color)
    }
    
    /// :nodoc:
    @available(*, deprecated, message: "Use `func avatarsBorder(_ color: Color, width: CGFloat = 1) -> some View` instead. And this will be removed in the future release.")
    func avatarBorderWidth(_ borderWidth: CGFloat) -> some View {
        environment(\.avatarBorderWidth, borderWidth)
    }
    
    /// Text position for avatar stack. Default value is `.trailing`.
    /// - Parameter position: Position for text in avatar stack.
    /// - Returns: A view that avatar stack text with specific position.
    func avatarsTitlePosition(_ position: AvatarStack.TextPosition) -> some View {
        environment(\.avatarsTitlePosition, position)
    }
    
    /// Layout for avatars in the stack. Default value is `.grouped`.
    /// - Parameter layout: Layout for avatars in the stack.
    /// - Returns: A view that avatar stack with specific layout.
    func avatarsLayout(_ layout: AvatarStack.Layout) -> some View {
        environment(\.avatarsLayout, layout)
    }
    
    /// Max count for avatars in the stack.
    /// - Parameter count: Max count for avatars in the stack.
    /// - Returns: A view that avatar stack with specific max count.
    func avatarsMaxCount(_ count: Int?) -> some View {
        environment(\.avatarsMaxCount, count)
    }
    
    /// Spacing for avatars in horizontal stack.
    /// - Parameter spacing: Spacing for avatars in horizontal stack.
    /// - Returns: A view that avatar stack with specific spacing.
    func avatarsSpacing(_ spacing: CGFloat) -> some View {
        environment(\.avatarsSpacing, spacing)
    }
}

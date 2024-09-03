import SwiftUI

/// :nodoc:
public protocol AvatarList: View, _ViewEmptyChecking {
    associatedtype V: View
    var count: Int { get }
    func view(at index: Int) -> V
}

/// :nodoc:
public extension AvatarList {
    /// :nodoc:
    var body: some View {
        AvatarListView(avatars: self)
    }

    /// :nodoc:
    var isEmpty: Bool {
        count == 0
    }
}

struct AvatarsListStack: AvatarList {
    let avatars: [any View]
    
    init(_ avatars: [TextOrIcon]) {
        self.avatars = avatars.map {
            TextOrIconView($0)
        }
    }
    
    init(avatars: [any View]) {
        self.avatars = avatars
    }
    
    public var count: Int {
        self.avatars.count
    }
    
    public func view(at index: Int) -> some View {
        self.avatars[index].typeErased
    }
    
    var body: some View {
        AvatarListView(avatars: self)
    }
}

/// A custom parameter attribute that constructs views from closures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@resultBuilder
public enum AvatarsBuilder {
    /// :nodoc:
    public static func buildBlock(_ components: any View...) -> some AvatarList {
        let flatAvatars = components.flatMap { component -> [any View] in
            if let c = component as? AvatarsListStack {
                return c.avatars
            } else {
                return [component]
            }
        }
        return AvatarsListStack(avatars: flatAvatars)
    }
    
    /// :nodoc:
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }
    
    /// :nodoc:
    public static func buildExpression(_ expression: some View) -> some View {
        expression
    }
    
    /// :nodoc:
    public static func buildExpression<Data: RandomAccessCollection>(
        _ expression: ForEach<Data, Data.Element, some View>
    ) -> some AvatarList {
        AvatarsListStack(avatars: expression.data.map { item in
            expression.content(item)
        })
    }
    
    /// :nodoc:
    public static func buildEither(first: any View) -> some AvatarList {
        AvatarsListStack(avatars: [first])
    }
    
    /// :nodoc:
    public static func buildEither(second: any View) -> some AvatarList {
        AvatarsListStack(avatars: [second])
    }
    
    /// :nodoc:
    public static func buildOptional(_ component: (any View)?) -> some AvatarList {
        AvatarsListStack(avatars: component.map { [$0] } ?? [])
    }
    
    /// :nodoc:
    public static func buildArray(_ components: [any View]) -> some AvatarList {
        AvatarsListStack(avatars: components)
    }
}

import Foundation
import SwiftUI

/// The key for storing max number of items value in the environment.
public struct MaxNumberOfItemsKey: EnvironmentKey {
    public static var defaultValue = 0
}

public extension EnvironmentValues {
    /// Set max number of items that can be displayed in a component.
    ///
    /// Supported components:
    /// - MenuSelection
    var maxNumberOfItems: Int {
        get {
            self[MaxNumberOfItemsKey.self]
        }
        set {
            self[MaxNumberOfItemsKey.self] = newValue
        }
    }
}

private struct IsCustomizedBorderKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

/// The key to indicate whether a customized border is applied to a component.
public extension EnvironmentValues {
    var isCustomizedBorder: Bool {
        get { self[IsCustomizedBorderKey.self] }
        set { self[IsCustomizedBorderKey.self] = newValue }
    }
}

/// The key for storing whether the component is in a `Menu` in the environment. Default value is false.
public struct IsInMenuKey: EnvironmentKey {
    public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    /// get / set `isInMenu` value in the environment. Can be used to determine if the component such as a `FioriButton` is put inside a `Menu`.
    var isInMenu: Bool {
        get { self[IsInMenuKey.self] }
        set { self[IsInMenuKey.self] = newValue }
    }
}

struct ObjectItemNumberOfLines: EnvironmentKey {
    static let defaultValue: Int = 3
}

extension EnvironmentValues {
    var numberOfLines: Int {
        get { self[ObjectItemNumberOfLines.self] }
        set { self[ObjectItemNumberOfLines.self] = newValue }
    }
}

struct BannerMessageIsPersistentKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    /// A Boolean value that indicates whether the banner message remains visible after the user taps the link to view the details sheet.
    ///
    /// When `true`, the banner stays on screen after the user taps the link.
    /// When `false` (the default), the banner is dismissed automatically.
    ///
    /// - Note: This property only has an effect on iOS. On others, it is ignored.
    var isBannerMessagePersistent: Bool {
        get { self[BannerMessageIsPersistentKey.self] }
        set { self[BannerMessageIsPersistentKey.self] = newValue }
    }
}

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

/// The key for storing whether the component is in a `Menu` in the environment.
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

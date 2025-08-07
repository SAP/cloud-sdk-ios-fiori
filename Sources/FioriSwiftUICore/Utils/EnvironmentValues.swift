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

/// The key for storing whether the component is in a menu in the environment.
public struct IsInMenuKey: EnvironmentKey {
    public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var isInMenu: Bool {
        get { self[IsInMenuKey.self] }
        set { self[IsInMenuKey.self] = newValue }
    }
}

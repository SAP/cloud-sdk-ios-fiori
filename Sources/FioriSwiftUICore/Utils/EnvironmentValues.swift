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

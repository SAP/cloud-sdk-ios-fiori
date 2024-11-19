import SwiftUI

struct SortFilterOnModelUpdateAppCallbackKey: EnvironmentKey {
    static let defaultValue: () -> Void = { print("default empty callback") }
}

struct FilterFeedbarResetHiddenKey: EnvironmentKey {
    static let defaultValue = false
}

struct FilterFeedbarResetButtonTypeKey: EnvironmentKey {
    static let defaultValue = FilterFeedbackBarResetButtonType.default
}

extension EnvironmentValues {
    var onModelUpdateAppCallback: () -> Void {
        get {
            self[SortFilterOnModelUpdateAppCallbackKey.self]
        }
        
        set {
            self[SortFilterOnModelUpdateAppCallbackKey.self] = newValue
        }
    }
    
    var isResetHidden: Bool {
        get {
            self[FilterFeedbarResetHiddenKey.self]
        }
        
        set {
            self[FilterFeedbarResetHiddenKey.self] = newValue
        }
    }
    
    var resetButtonType: FilterFeedbackBarResetButtonType {
        get {
            self[FilterFeedbarResetButtonTypeKey.self]
        }
        
        set {
            self[FilterFeedbarResetButtonTypeKey.self] = newValue
        }
    }
}

public extension View {
    internal func onModelUpdateAppCallback(_ closure: @escaping () -> Void) -> some View {
        self.environment(\.onModelUpdateAppCallback, closure)
    }
    
    func resetHidden(_ value: Bool) -> some View {
        self.environment(\.isResetHidden, value)
    }
    
    func resetButtonType(_ type: FilterFeedbackBarResetButtonType) -> some View {
        self.environment(\.resetButtonType, type)
    }
}

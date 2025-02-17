import SwiftUI

struct SortFilterOnModelUpdateAppCallbackKey: EnvironmentKey {
    static let defaultValue: () -> Void = { print("default empty callback") }
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
}

extension View {
    func onModelUpdateAppCallback(_ closure: @escaping () -> Void) -> some View {
        self.environment(\.onModelUpdateAppCallback, closure)
    }
}

struct SortFilterBarItemFrameKey: EnvironmentKey {
    static let defaultValue: CGRect = .zero
}

extension EnvironmentValues {
    var sortFilterBarItemFrame: CGRect {
        get { self[SortFilterBarItemFrameKey.self] }
        set { self[SortFilterBarItemFrameKey.self] = newValue }
    }
}

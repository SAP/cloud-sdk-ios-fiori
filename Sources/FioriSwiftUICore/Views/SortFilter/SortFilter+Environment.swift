import SwiftUI

struct SortFilterOnModelUpdateAppCallbackKey: EnvironmentKey {
    static let defaultValue: () -> Void = { print("default empty callback") }
}

struct SortFilterMenuCancelActionKey: EnvironmentKey {
    static var defaultValue: any View = Button("TO BE REPLACED") {}
}

struct SortFilterMenuResetActionKey: EnvironmentKey {
    static var defaultValue: any View = Button("TO BE REPLACED") {}
}

struct SortFilterMenuApplyActionKey: EnvironmentKey {
    static var defaultValue: any View = Button("TO BE REPLACED") {}
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
    
    var cancelActionView: any View {
        get {
            self[SortFilterMenuCancelActionKey.self]
        }
        
        set {
            self[SortFilterMenuCancelActionKey.self] = newValue
        }
    }
    
    var resetActionView: any View {
        get {
            self[SortFilterMenuResetActionKey.self]
        }
        
        set {
            self[SortFilterMenuResetActionKey.self] = newValue
        }
    }
    
    var applyActionView: any View {
        get {
            self[SortFilterMenuApplyActionKey.self]
        }
        
        set {
            self[SortFilterMenuApplyActionKey.self] = newValue
        }
    }
}

extension View {
    func onModelUpdateAppCallback(_ closure: @escaping () -> Void) -> some View {
        self.environment(\.onModelUpdateAppCallback, closure)
    }
    
    func cancelActionView(_ view: any View) -> some View {
        self.environment(\.cancelActionView, view)
    }
    
    func resetActionView(_ view: any View) -> some View {
        self.environment(\.resetActionView, view)
    }
    
    func applyActionView(_ view: any View) -> some View {
        self.environment(\.applyActionView, view)
    }
}

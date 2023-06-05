/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum Action {
        typealias ActionLabel = EmptyModifier
        static let actionLabel = ActionLabel()
    }
}

extension Action: View {
    public var body: some View {
        if _actionText != nil {
            Button {
                self.sharedAction?()
                self._didSelectAction?()
            } label: {
                Text(self._actionText ?? "")
            }
        } else {
            EmptyView()
        }
    }
}

struct SharedActionKey: EnvironmentKey {
    static let defaultValue: (() -> Void)? = nil
}

extension EnvironmentValues {
    var sharedAction: (() -> Void)? {
        get { self[SharedActionKey.self] }
        set { self[SharedActionKey.self] = newValue }
    }
}

extension View {
    func setSharedAction(_ action: (() -> Void)?) -> some View {
        self.environment(\.sharedAction, action)
    }
}

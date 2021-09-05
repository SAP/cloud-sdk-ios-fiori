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
            Button(action: self._didSelectAction ?? {}) {
                Text(self._actionText ?? "")
            }
        } else {
            EmptyView()
        }
    }
}

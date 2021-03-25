/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum SecondaryAction {
        typealias SecondaryActionLabel = EmptyModifier
        static let secondaryActionLabel = SecondaryActionLabel()
    }
}

extension SecondaryAction: View {
    var _defaultAction: () -> Void {
        {
            // default handler
        }
    }
    
    public var body: some View {
        Button(action: self._didSelectSecondaryActionClosure ?? self._defaultAction) {
            Text(self._secondaryActionText ?? "Try Demo")
                .frame(width: 170.0, height: 6.0)
        }
    }
}

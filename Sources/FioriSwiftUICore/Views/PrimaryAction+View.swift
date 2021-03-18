/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum PrimaryAction {
        typealias PrimaryActionLabel = EmptyModifier
        static let primaryActionLabel = PrimaryActionLabel()
    }
}

extension PrimaryAction: View {
    public var body: some View {
        Button(action: self._didSelectPrimaryActionClosure ?? onSelect) {
            Text(self._primaryActionLabel ?? "Start")
                .frame(width: 170.0, height: 6.0)
        }.buttonStyle(FioriButtonStyle())
    }
    
    func onSelect() {}
}

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions
extension Fiori {
    enum WelcomeScreenButton {
        typealias PrimaryButton = EmptyModifier
        static let primaryButton = PrimaryButton()
    }
}
        
// FIXME: - Implement WelcomeScreenButton View body

extension WelcomeScreenButton: View {
    public var body: some View {
        Button(action: self._clickActionClosure ?? onStart) {
            Text(self._primaryButton ?? "Start")
                .frame(width: 169.0, height: 20.0)
        }.buttonStyle(FioriButtonStyle())
    }
    
    func onStart() {}
}

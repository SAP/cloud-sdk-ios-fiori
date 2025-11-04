import SwiftUI

/// A closure that creates and configures the underlying standard `Button<EmptyView>` used by `FioriButton`.
/// - Parameter action: The Fiori-specific action to inject into the button.
/// - Returns: A fully configured `Button<EmptyView>` (e.g., with init params like `role`).
public typealias ButtonCreator = (@escaping () -> Void) -> Button<EmptyView>

/// Environment key for storing the `ButtonCreator` closure, enabling customization of the standard `Button` in `FioriButton`.
private struct StandardButtonCreatorKey: EnvironmentKey {
    /// Default creator: Returns a plain `Button` with the provided action and `EmptyView` label.
    static let defaultValue: ButtonCreator = { action in
        Button(action: action) {
            EmptyView()
        }
    }
}

public extension EnvironmentValues {
    /// The closure used to create and configure the underlying standard `Button<EmptyView>` in `FioriButton`.
    ///
    /// Use this to apply Apple's `Button` features (e.g., `role: .destructive`).
    var standardButtonCreator: ButtonCreator {
        get { self[StandardButtonCreatorKey.self] }
        set { self[StandardButtonCreatorKey.self] = newValue }
    }
}

/// View Modifier for Customizing Standard Button
public extension View {
    /// Customizes the underlying standard `Button` used by `FioriButton` within this view hierarchy.
    ///
    /// - Parameter creator: A closure that receives the Fiori action and returns a configured `Button<EmptyView>`.
    ///   - Inject Apple's init params (e.g., `role: .destructive`) or modifiers here.
    ///   - Always pass the provided `action` parameter to the `Button` to chain Fiori's state-aware handling.
    /// - Returns: A modified view with the custom `ButtonCreator` propagated via the environment.
    ///
    /// **Example**:
    /// ```swift
    /// FioriButton(isSelectionPersistent: self._isSelectionPersistent,
    ///             action: { state in
    ///     print("Button tapped with state: \(state)")
    /// },
    ///             label: { _ in Text("Delete") }
    /// )
    /// .configureStandardButton { fioriAction in
    ///     Button(role: .destructive, action: fioriAction) { EmptyView() }
    /// }
    /// ```
    ///
    /// This enables future-proof support for new Apple `Button` features without framework updates.
    func configureStandardButton(_ creator: @escaping ButtonCreator) -> some View {
        self.environment(\.standardButtonCreator, creator)
    }
}

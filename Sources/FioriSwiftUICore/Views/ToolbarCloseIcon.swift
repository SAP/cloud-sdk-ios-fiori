import FioriThemeManager
import SwiftUI

/// A close button for a toolbar or navigation bar.
///
/// Renders a plain button and lets the system provide the bar-item background and
/// press behavior (including Liquid Glass on iOS 26+), matching a hand-written
/// `Button { … } label: { Image(systemName: "xmark") }`.
///
/// Pass `nil` for `text` to show an "xmark" icon, or a string to show a label.
///
/// ```swift
/// .navigationBarItems(leading: ToolbarCloseIcon(style: .tint) { dismiss() })
/// ```
public struct ToolbarCloseIcon: View {
    /// The foreground color treatment.
    public enum Style {
        case plain
        case tint
    }

    private let text: String?
    private let style: Style
    private let action: () -> Void

    /// Creates a close button.
    /// - Parameters:
    ///   - text: An optional label. Pass `nil` for an "xmark" icon.
    ///   - style: The foreground color treatment. Defaults to ``Style/plain``.
    ///   - action: The closure to run when tapped.
    public init(text: String? = nil, style: Style = .plain, action: @escaping () -> Void) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: self.action) {
            if let text = self.text {
                Text(text)
            } else {
                Image(systemName: "xmark")
            }
        }
        .modifier(CloseForegroundModifier(style: self.style))
        .accessibilityLabel(Text(self.text ?? NSLocalizedString("Close", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Close")))
    }
}

/// Applies the foreground color for the requested style.
private struct CloseForegroundModifier: ViewModifier {
    let style: ToolbarCloseIcon.Style

    func body(content: Content) -> some View {
        switch self.style {
        case .plain:
            content.foregroundStyle(Color.preferredColor(.primaryLabel))
        case .tint:
            content.foregroundStyle(.tint)
        }
    }
}

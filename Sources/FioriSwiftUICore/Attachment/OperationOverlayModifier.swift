import SwiftUI

/// View modifier to apply menu items as an overlay to an anchor view
public struct OperationOverlayModifier<V: View>: ViewModifier where V: View {
    @State private var showSubViews: Bool = false

    private let menuItemContents: V

    public init(@ViewBuilder menuItemContents: @escaping () -> V) {
        self.menuItemContents = menuItemContents()
    }

    public func body(content: Content) -> some View {
        content
            .defaultOperations()
            .accessibilityElement(children: .ignore)
            .accessibilityIdentifier("Attachment:AddAttachmentButton")
            .accessibilityAddTraits(.isButton)
            .accessibilityLabel(NSLocalizedString("Add attachment", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Add attachment"))
            .accessibilityHint(NSLocalizedString("Double tap to add attachment", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Double tap to add attachment"))
            .onTapGesture {
                self.showSubViews.toggle()
            }
            .overlay(
                VStack {
                    if self.showSubViews {
                        self.menuItemContents
                    } else {
                        EmptyView()
                    }
                }
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            self.showSubViews.toggle()
                        }
                )
            )
    }
}

public extension View {
    /// Applies items overlay to an anchor view.
    func operationsOverlay(@ViewBuilder content: @escaping () -> some View) -> some View {
        modifier(OperationOverlayModifier(menuItemContents: content))
    }
}

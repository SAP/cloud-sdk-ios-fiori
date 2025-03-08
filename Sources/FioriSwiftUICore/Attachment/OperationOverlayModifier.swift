import SwiftUI

public struct OperationOverlayModifier<V: View>: ViewModifier where V: View {
    @State private var showSubViews: Bool = false

    private let menuItemContents: V

    public init(@ViewBuilder menuItemContents: @escaping () -> V) {
        self.menuItemContents = menuItemContents()
    }

    public func body(content: Content) -> some View {
        content
            .defaultOperations()
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
    func operationsOverlay(@ViewBuilder content: @escaping () -> some View) -> some View {
        modifier(OperationOverlayModifier(menuItemContents: content))
    }
}

import SwiftUI

struct PopoverModifier<PopView: View>: ViewModifier {
    @Binding var isPresented: Bool
    @State var sourceFrame: CGRect = .zero

    var popView: () -> PopView
    @State var popover: Popover?

    func body(content: Content) -> some View {
        WindowReader { window in
            content
                .frameReader(rect: { rect in
                    sourceFrame = rect
                })
                .onChange(of: isPresented) { newValue in
                    if newValue {
                        let popover = Popover(popView: AnyView(popView()), isPresented: $isPresented)
                        popover.context.sourceFrame = sourceFrame
                        popover.context.windowFrame = window?.bounds ?? .zero
                        popover.present(in: window)
                        self.popover = popover
                    } else {
                        guard let popover = popover else { return }
                        popover.dismiss()
                    }
                }
            #if !os(visionOS)
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    guard let popover = popover else { return }
                    popover.dismiss()
                }
            #endif
        }
    }
}

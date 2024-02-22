import SwiftUI
import UIKit

public struct WindowReader<Content: View>: View {
    /// Your SwiftUI view.
    public let view: (UIWindow?) -> Content

    /// The read window.
    @StateObject var windowViewModel = WindowViewModel()

    /// Reads the `UIWindow` that hosts some SwiftUI content.
    public init(@ViewBuilder view: @escaping (UIWindow?) -> Content) {
        self.view = view
    }

    public var body: some View {
        let keyWindow = UIApplication.shared.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
        if let keyWindow = keyWindow {
            self.view(keyWindow)
        } else {
            EmptyView()
        }
    }

    /// A wrapper view to read the parent window.
    private struct WindowHandlerRepresentable: UIViewRepresentable {
        @ObservedObject var windowViewModel: WindowViewModel

        func makeUIView(context _: Context) -> WindowHandler {
            WindowHandler(windowViewModel: self.windowViewModel)
        }

        func updateUIView(_: WindowHandler, context _: Context) {}
    }

    private class WindowHandler: UIView {
        var windowViewModel: WindowViewModel

        init(windowViewModel: WindowViewModel) {
            self.windowViewModel = windowViewModel
            super.init(frame: .zero)
            backgroundColor = .clear
        }

        @available(*, unavailable)
        required init?(coder _: NSCoder) {
            fatalError("Create this view programmatically.")
        }

        override func didMoveToWindow() {
            super.didMoveToWindow()

            DispatchQueue.main.async {
                /// Set the window.
                self.windowViewModel.window = self.window
            }
        }
    }
}

class WindowViewModel: ObservableObject {
    @Published var window: UIWindow?
}

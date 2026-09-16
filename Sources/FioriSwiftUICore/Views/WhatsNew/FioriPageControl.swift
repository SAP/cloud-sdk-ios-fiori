import FioriThemeManager
import SwiftUI
import UIKit

/// A SwiftUI wrapper around the native `UIPageControl`.
struct FioriPageControl: UIViewRepresentable {
    let numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(currentPage: self.$currentPage)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = self.numberOfPages
        control.currentPage = self.currentPage
        control.currentPageIndicatorTintColor = UIColor(Color.preferredColor(.primaryLabel))
        control.pageIndicatorTintColor = UIColor(Color.preferredColor(.quaternaryLabel))
        control.addTarget(context.coordinator,
                          action: #selector(Coordinator.pageChanged(_:)),
                          for: .valueChanged)
        control.setContentCompressionResistancePriority(.required, for: .horizontal)
        control.setContentHuggingPriority(.required, for: .vertical)
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = self.numberOfPages
        if uiView.currentPage != self.currentPage {
            uiView.currentPage = self.currentPage
        }
    }

    final class Coordinator: NSObject {
        @Binding var currentPage: Int

        init(currentPage: Binding<Int>) {
            self._currentPage = currentPage
        }

        @objc func pageChanged(_ sender: UIPageControl) {
            self.currentPage = sender.currentPage
        }
    }
}

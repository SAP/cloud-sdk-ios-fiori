/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension ProgressIndicator: View {
    public var body: some View {
        if #available(iOS 14.0, *) {
            ProgressView(self._progressIndicatorText ?? "")
        } else {
            VStack {
                ActivityIndicator(style: .medium)
                if self._progressIndicatorText?.isEmpty == false {
                    Text(self._progressIndicatorText ?? "")
                        .font(.fiori(fixedSize: 11).weight(.regular))
                        .foregroundColor(.preferredColor(.tertiaryLabel))
                }
            }
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: self.style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

@available(iOS 14.0, *)
struct ProgressIndicatorLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(ProgressIndicator(progressIndicatorText: "Loading..."))
    }
}

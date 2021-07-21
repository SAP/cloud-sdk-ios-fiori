/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI
import WebKit

extension Fiori {
    enum HTMLView {
        typealias HtmlContent = EmptyModifier
        typealias HtmlContentCumulative = EmptyModifier
        static let htmlContent = HtmlContent()
        static let htmlContentCumulative = HtmlContentCumulative()
    }
}

extension HTMLView: View {
    public var body: some View {
        GeometryReader { geometry in
            AttributedText(attributedText: self._htmlContent ?? NSAttributedString(string: ""), width: geometry.size.width, height: $contentHeight)
                .frame(height: max(geometry.size.height, contentHeight))
                .overlay(GetDynamicHeight())
        }
    }
}

struct AttributedText: UIViewRepresentable {
    var attributedText: NSAttributedString
    @State var width: CGFloat
    @Binding var height: CGFloat
    
    func makeUIView(context: Context) -> MyTextView {
        let view = MyTextView()
        
        view.dataDetectorTypes = .link
        view.isEditable = false
        view.isSelectable = true
        view.delegate = view
        view.clipsToBounds = true
        view.isScrollEnabled = false
        
        view.preservesSuperviewLayoutMargins = true
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return view
    }
    
    class MyTextView: UITextView, UITextViewDelegate {
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            print(URL)
            UIApplication.shared.open(URL)
            return false
        }
    }
    
    func updateUIView(_ uiView: MyTextView, context: Context) {
        uiView.attributedText = self.attributedText
        uiView.layoutSubviews()
        if #available(iOS 14.0, *) {
            uiView.textColor = UIColor(.preferredColor(.primary3))
        } else {
            // Fallback on earlier versions
        }
        
        let newSize = uiView.sizeThatFits(CGSize(width: self.width, height: CGFloat.greatestFiniteMagnitude))
        DispatchQueue.main.async {
            self.height = newSize.height
        }
    }
}

struct MaxHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct GetDynamicHeight: View {
    typealias Key = MaxHeightPreferenceKey
    var body: some View {
        GeometryReader {
            proxy in
            Color.clear
                .anchorPreference(key: Key.self, value: .bounds) {
                    anchor in proxy[anchor].size.height
                }
        }
    }
}

@available(iOS 14.0, *)
struct HTMLViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(HTMLView(),
                    category: .control)
    }
}

///// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
///// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
///// to declare a wrapped property
///// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`
//
// import SwiftUI
// import WebKit
//
// extension Fiori {
//    enum HTMLView {
//        typealias HtmlContent = EmptyModifier
//        typealias HtmlContentCumulative = EmptyModifier
//        static let htmlContent = HtmlContent()
//        static let htmlContentCumulative = HtmlContentCumulative()
//    }
// }
//
// extension HTMLView: View {
//    public var body: some View {
//        AttributedText(attributedText: _htmlContent)
////        GeometryReader { geometry in
////            AttributedText(attributedText: self._htmlContent ?? NSAttributedString(string: ""), width: geometry.size.width, height: $contentHeight)
////                .frame(height: max(geometry.size.height, contentHeight))
////                .overlay(GetDynamicHeight())
////        }
//    }
// }
//
////public struct AttributedText: UIViewRepresentable {
////
////    let attributedText: NSAttributedString?
////    let configuration: ((UITextView) -> Void)?
////
//////    @State var width: CGFloat
//////    @Binding var height: CGFloat
////
////    public init(attributedText: NSAttributedString?, configuration: ((UITextView) -> Void)? = nil) {
////        self.attributedText = attributedText
////        self.configuration = configuration
////    }
////
////    public func makeUIView(context: Context) -> UITextView {
////        let textView = UITextView()
////
////        textView.attributedText = attributedText
////        textView.textColor = Color.preferredColor(.primary3).uiColor()
////        textView.dataDetectorTypes = .link
////        textView.isEditable = false
////        textView.isSelectable = true
//////        view.delegate = view
////        textView.clipsToBounds = true
////        textView.isScrollEnabled = false
////
////        textView.preservesSuperviewLayoutMargins = true
////        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
////
////        configuration?(textView)
////
////        return textView
////    }
////
//////    class MyTextView: UITextView, UITextViewDelegate {
//////        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//////            print(URL)
//////            UIApplication.shared.open(URL)
//////            return false
//////        }
//////    }
////
////    public func updateUIView(_ uiView: UITextView, context: Context) {
//////        uiView.attributedText = self.attributedText
//////        uiView.layoutIfNeeded()
//////        uiView.textColor = Color.preferredColor(.primary3).uiColor()
//////
//////        let newSize = uiView.sizeThatFits(CGSize(width: self.width, height: CGFloat.greatestFiniteMagnitude))
//////        DispatchQueue.main.async {
//////            self.height = newSize.height
//////        }
////    }
////}
//
// struct MaxHeightPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = max(value, nextValue())
//    }
// }
//
// struct GetDynamicHeight: View {
//    typealias Key = MaxHeightPreferenceKey
//    var body: some View {
//        GeometryReader {
//            proxy in
//            Color.clear
//                .anchorPreference(key: Key.self, value: .bounds) {
//                    anchor in proxy[anchor].size.height
//                }
//        }
//    }
// }
//
// @available(iOS 14.0, *)
// struct HTMLViewLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(HTMLView(),
//                    category: .control)
//    }
// }

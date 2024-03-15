import SwiftUI

public struct AttributedText: View {
    @State private var height: CGFloat = 0
    
    let attributedText: NSAttributedString?
    let configuration: ((UITextView) -> Void)?
    
    public init(attributedText: NSAttributedString?, configuration: ((UITextView) -> Void)? = nil) {
        self.attributedText = attributedText
        self.configuration = configuration
    }

    public var body: some View {
        UITextViewContainer(attributedText: Binding.constant(self.attributedText), height: self.$height, configuration: self.configuration)
            .frame(height: self.height)
    }
}

extension AttributedText {
    init(bodyAttributedText: NSAttributedString?, configuration: ((UITextView) -> Void)? = nil) {
        self.init(attributedText: bodyAttributedText, configuration: configuration)
    }
}

struct UITextViewContainer: UIViewRepresentable {
    @Binding var attributedText: NSAttributedString?
    @Binding var height: CGFloat
    let configuration: ((UITextView) -> Void)?
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.textColor = Color.preferredColor(.tertiaryLabel).uiColor()
        textView.dataDetectorTypes = .link
        textView.isEditable = false
        textView.isSelectable = true
        textView.clipsToBounds = true
        textView.showsVerticalScrollIndicator = false
        textView.delegate = context.coordinator
        
        self.configuration?(textView)
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        textView.attributedText = self.attributedText

        DispatchQueue.main.async {
            let height = textView.contentSize.height
            self.height = height
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(attributedText: _attributedText)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var attributedText: NSAttributedString?
        
        init(attributedText: Binding<NSAttributedString?>) {
            self._attributedText = attributedText
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.attributedText = textView.attributedText
        }
    }
}

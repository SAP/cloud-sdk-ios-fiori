import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .extraLight
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: self.style)
    }
}

struct ProcessingIndicatorExample: View {
    @State var labelText: String = "Processing"
    @State var showModalIndicator: Bool = false
    @State var showInContainer: Bool = false
            
    var body: some View {
        VStack {
            Spacer()
            Button("Show modal indicator", action: {
                self.showModalIndicator.toggle()
            })
            Button("Show/hide in container", action: {
                self.showInContainer.toggle()
            })
            TextFieldFormView(title: "Set label", text: self.$labelText).padding()
            ProcessingIndicator(optionalTitle: AttributedString(self.labelText))
            Spacer()
            if self.showInContainer {
                Image("rw")
                    .overlay(ProcessingIndicator()
                        .frame(maxWidth: 130, maxHeight: 130)
                        .background(Color.white.opacity(0.7))
                    )
            } else {
                Image("rw")
            }
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: self.$showModalIndicator, content: {
            VStack {
                ProcessingIndicator(optionalTitle: AttributedString(self.labelText))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.clear)
                Button("Dismiss", action: {
                    self.showModalIndicator.toggle()
                })
            }
            .background(Blur())
        })
    }
}

struct ProcessingIndicatorExample_Previews: PreviewProvider {
    static var previews: some View {
        ProcessingIndicatorExample()
    }
}

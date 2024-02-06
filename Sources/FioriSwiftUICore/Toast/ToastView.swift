import SwiftUI

struct Toast: Equatable {
    /// The toast message
    var message: String
    
    /// Icon image in front of the text. The default is a checkmark icon.
    var image: Image?
    
    /// The duration in seconds for which the toast message is shown. The default is `1`.
    var duration: Double = 1
}

///  `ToastView` shows an overlay toast message centered within current view.
struct ToastView: View {
    /// The toast message
    let message: String
    
    /// Icon image in front of the text. The default is a checkmark icon.
    var image: Image? = nil

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    makeBody(reader.size)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func makeBody(_ size: CGSize) -> some View {
        HStack(alignment: .center, spacing: 8) {
            if let image = image {
                image
            } else {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color.preferredColor(.primaryLabel))
            }
            
            Text(message)
                .font(Font.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.primaryLabel))
        }
        .padding(20)
        .frame(width: size.width * (self.horizontalSizeClass == .compact ? 0.8 : 0.6))
        .background(Color.preferredColor(.header, interface: .elevatedConstant))
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .inset(by: 0.33)
                .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
        )
        .shadow(color: Color.preferredColor(.sectionShadow), radius: 2)
        .shadow(color: Color.preferredColor(.cardShadow), radius: 16, x: 0, y: 8)
        .shadow(color: Color.preferredColor(.cardShadow), radius: 32, x: 0, y: 16)
    }
}

struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    if let toast = toast {
                        ToastView(message: toast.message,
                                  image: toast.image)
                            .animation(.easeInOut, value: toast)
                    }
                }
            )
            .onChange(of: self.toast) { _ in
                showToast()
            }
    }
    
    private func showToast() {
        guard let toast = toast else { return }
        
        if toast.duration > 0 {
            self.workItem?.cancel()
            
            let task = DispatchWorkItem {
                dismissToast()
            }
         
            if UIAccessibility.isVoiceOverRunning && !toast.message.isEmpty {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    UIAccessibility.post(notification: .announcement, argument: toast.message)
                }
            }
            
            self.workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
    
    private func dismissToast() {
        withAnimation(.easeInOut) {
            toast = nil
        }
        
        self.workItem?.cancel()
        self.workItem = nil
    }
}

extension View {
    /// Shows an overlay toast message centered within current view
    func toast(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}

#Preview {
    ToastView(message: "Tapped cell is read-only.")
}

#Preview {
    HStack {}
        .background(Color.green)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .toast(toast: .constant(Toast(message: "Tapped cell is read-only.")))
        .previewDevice(PreviewDevice(rawValue: "iPhone 15"))
}

#Preview {
    HStack {}
        .background(Color.green)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .toast(toast: .constant(Toast(message: "Tapped cell is read-only. Tapped cell is read-only. Tapped cell is read-only.", image: Image(systemName: "info.circle.fill"))))
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4th generation)"))
}

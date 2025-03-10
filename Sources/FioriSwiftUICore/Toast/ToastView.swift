import SwiftUI

@available(*, deprecated, message: "Use ToastMessage instead of ToastView")
public struct Toast: Equatable {
    /// The toast message
    public var message: String
    
    /// Icon image in front of the text. The default is a checkmark icon.
    public var image: Image?
    
    /// The duration in seconds for which the toast message is shown. The default is `1`.
    public var duration: Double
    
    public init(message: String, image: Image? = nil, duration: Double = 1) {
        self.message = message
        self.image = image
        self.duration = duration
    }
}

@available(*, deprecated, message: "Use ToastMessage instead")
///  `ToastView` shows an overlay toast message centered within current view.
/// `ToastView` has been replaced by `ToastMessage` but `ToastView` is still being used internally
public struct ToastView: View {
    /// The toast message
    let message: String
    
    /// Icon image in front of the text. The default is a checkmark icon.
    var image: Image? = nil

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    public var body: some View {
        GeometryReader { reader in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    self.makeBody(reader.size)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func makeBody(_ size: CGSize) -> some View {
        HStack(alignment: .center, spacing: 8) {
            if let image {
                image
            } else {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color.preferredColor(.primaryLabel))
            }
            
            Text(self.message)
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

@available(*, deprecated, message: "Use ToastMessageModifier instead")
/// `ToastModifier` has been replaced by `ToastMessageModifier` but `ToastModifier` is still being used internally
public struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?
    @State private var workItem: DispatchWorkItem?
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    if let toast {
                        ToastView(message: toast.message,
                                  image: toast.image)
                            .animation(.easeInOut, value: toast)
                    }
                }
            )
            .setOnChange(of: self.toast) {
                self.showToast()
            }
    }
    
    private func showToast() {
        guard let toast else { return }
        
        if toast.duration > 0 {
            self.workItem?.cancel()
            
            let task = DispatchWorkItem {
                self.dismissToast()
            }
         
            if UIAccessibility.isVoiceOverRunning, !toast.message.isEmpty {
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
            self.toast = nil
        }
        
        self.workItem?.cancel()
        self.workItem = nil
    }
}

public extension View {
    @available(*, deprecated, message: "Use toastMessage(isPresented:icon:title:duration:) instead")
    /// Shows an overlay toast message centered within current view
    /// `toast(toast:)` has been replaced by `toastMessage(isPresented:icon:title:duration:)` but `toast(toast:)` is still being used internally
    func toast(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}

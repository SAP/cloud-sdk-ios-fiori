import PhotosUI
import SwiftUI

/// View modifier to add operation (confirmation) dialog.
struct OperationDialogModifier<V: View>: ViewModifier {
    private let menuItemContents: V
    
    @State private var isPresented: Bool = false
    
    public init(@ViewBuilder menuItemContents: @escaping () -> V) {
        self.menuItemContents = menuItemContents()
    }

    func body(content: Content) -> some View {
        content
            .defaultOperations()
            .accessibilityElement(children: .ignore)
            .accessibilityIdentifier("Attachment:AddAttachmentButton")
            .accessibilityAddTraits(.isButton)
            .accessibilityLabel(NSLocalizedString("Add attachment", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Add attachment"))
            .accessibilityHint(NSLocalizedString("Double tap to add attachment", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Double tap to add attachment"))
            .onTapGesture {
                self.isPresented.toggle()
            }
            .confirmationDialog("Choice a operation", isPresented: self.$isPresented) {
                self.menuItemContents
            }
    }
}

public extension View {
    /// Applies operation dialog to an anchor view.
    func operationsDialog(@ViewBuilder content: @escaping () -> some View) -> some View {
        modifier(OperationDialogModifier(menuItemContents: content))
    }
}

#Preview {
    Image(systemName: "plus")
        .foregroundColor(.blue)
        .font(.system(size: 24))
        .padding()
        .frame(width: 80, height: 80)
        .overlay(
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 4))
                .foregroundColor(.blue)
        )
        .operationsDialog {
            PhotosPickerMenuItem()
            FilesPickerMenuItem()
            CameraMenuItem()
            PhotosPickerMenuItem(title: "Pick Photos")
            PhotosPickerMenuItem(title: "Pick Photos", icon: "photo")
            FilesPickerMenuItem(title: "Pick Files")
            FilesPickerMenuItem(title: "Pick Files", icon: "folder")
            CameraMenuItem(title: "Take a Photo")
            CameraMenuItem(title: "Take a Photo", icon: "camera")
        }
}

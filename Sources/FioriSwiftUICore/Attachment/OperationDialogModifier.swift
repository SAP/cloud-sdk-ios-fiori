import PhotosUI
import SwiftUI

struct OperationDialogModifier<V: View>: ViewModifier {
    private let menuItemContents: V
    
    @State private var isPresented: Bool = false
    
    public init(@ViewBuilder menuItemContents: @escaping () -> V) {
        self.menuItemContents = menuItemContents()
    }

    func body(content: Content) -> some View {
        content
            .defaultOperations()
            .onTapGesture {
                self.isPresented.toggle()
            }
            .confirmationDialog("Choice a operation", isPresented: self.$isPresented) {
                self.menuItemContents
            }
    }
}

public extension View {
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
            AttachmentMenuItems.photos
            AttachmentMenuItems.files
            AttachmentMenuItems.camera
            PhotosPickerMenuItem(title: "Pick Photos")
            PhotosPickerMenuItem(title: "Pick Photos", icon: "photo")
            FilesPickerMenuItem(title: "Pick Files")
            FilesPickerMenuItem(title: "Pick Files", icon: "folder")
            CameraMenuItem(title: "Take a Photo")
            CameraMenuItem(title: "Take a Photo", icon: "camera")
        }
}

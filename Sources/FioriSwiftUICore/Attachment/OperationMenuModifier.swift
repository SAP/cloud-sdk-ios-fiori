import PhotosUI
import SwiftUI

public struct OperationMenuModifier<V: View>: ViewModifier where V: View {
    private let menuItemContents: V
    
    public init(@ViewBuilder menuItemContents: @escaping () -> V) {
        self.menuItemContents = menuItemContents()
    }

    public func body(content: Content) -> some View {
        Menu {
            self.menuItemContents
        } label: {
            content
                .defaultOperations()
        }
    }
}

public extension View {
    func operationsMenu(@ViewBuilder content: @escaping () -> some View) -> some View {
        modifier(OperationMenuModifier(menuItemContents: content))
    }
}

#Preview {
    VStack {
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
            .operationsMenu {
                AttachmentMenuItems.photos
                AttachmentMenuItems.files
                AttachmentMenuItems.camera
                PhotosPickerMenuItem(title: "Pick Photos")
                PhotosPickerMenuItem(title: "Pick Photos", icon: "photo")
                FilesPickerMenuItem(title: "Pick Files")
                FilesPickerMenuItem(title: "Pick Files", icon: "folder")
                CameraMenuItem(title: "Take a Photo")
                CameraMenuItem(title: "Take a Photo", icon: "camera")
                Button {} label: {
                    Label("Scan & Upload", image: "doc.viewfinder")
                }
                Button {} label: {
                    Label("Compose and Upload", image: "square.and.pencil")
                }
            }
        Spacer()
    }
}

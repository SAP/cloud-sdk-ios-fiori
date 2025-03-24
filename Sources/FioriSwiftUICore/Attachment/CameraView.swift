import Photos
import SwiftUI

public struct CameraView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var onSaveImage: (UIImage?) -> Void
    var onSaveVideo: ((URL?) -> Void)? = nil

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.mediaTypes = [UTType.image.identifier, UTType.movie.identifier]
        camera.allowsEditing = false
        camera.delegate = context.coordinator
        return camera
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if (info[.mediaType] as? String) == UTType.movie.identifier {
                self.parent.onSaveVideo?(info[.mediaURL] as? URL)
            } else {
                self.parent.onSaveImage(info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
            }
            self.parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

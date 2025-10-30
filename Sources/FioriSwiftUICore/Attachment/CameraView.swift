import Photos
import SwiftUI

/// A SwiftUI view that presents a camera interface for capturing photos and videos.
///
/// `CameraView` wraps `UIImagePickerController` to provide camera functionality within SwiftUI.
/// It allows users to capture photos and optionally videos from the device camera.
///
/// Example usage:
/// ```swift
/// CameraView(onSaveImage: { image in
///     // Handle the captured image
/// }, onSaveVideo: { videoURL in
///     // Handle the captured video
/// })
/// ```
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct CameraView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    
    /// Closure called when a photo is captured.
    ///
    /// This closure receives the captured `UIImage` or `nil` if the capture failed.
    /// - Parameter UIImage?: The captured image or `nil` if no image was captured
    var onSaveImage: (UIImage?) -> Void
    
    /// Closure called when a video is captured.
    ///
    /// This optional closure receives the URL where the captured video is stored or `nil` if the capture failed.
    /// - Parameter URL?: The URL to the captured video file or `nil` if no video was captured
    var onSaveVideo: ((URL?) -> Void)? = nil

    /// Creates and configures the `UIImagePickerController` used to capture media.
    ///
    /// - Parameter context: The context in which this view controller is created
    /// - Returns: A configured `UIImagePickerController` instance
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.mediaTypes = [UTType.image.identifier, UTType.movie.identifier]
        camera.allowsEditing = false
        camera.delegate = context.coordinator
        return camera
    }
    
    /// Updates the view controller with any changes to the SwiftUI view's state.
    ///
    /// This method is required by the `UIViewControllerRepresentable` protocol but is not used in this implementation.
    /// - Parameters:
    ///   - uiViewController: The view controller to update
    ///   - context: The context in which the view controller exists
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    /// Creates a coordinator to handle the delegate methods of `UIImagePickerController`.
    ///
    /// - Returns: A new coordinator instance
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    /// A coordinator class that acts as the delegate for the `UIImagePickerController`.
    ///
    /// This class handles the events triggered by the image picker, such as when the user
    /// captures a photo or video, or cancels the operation.
    public final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        /// Reference to the parent `CameraView` struct.
        var parent: CameraView
        
        /// Initializes a new coordinator with a reference to its parent view.
        ///
        /// - Parameter parent: The `CameraView` instance that created this coordinator
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        /// Called when the user finishes picking media with the image picker.
        ///
        /// This method processes the selected media (image or video) and calls the appropriate
        /// closure in the parent view before dismissing the picker.
        ///
        /// - Parameters:
        ///   - picker: The image picker controller that was presented
        ///   - info: A dictionary containing the selected media and related information
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

import PhotosUI
import SwiftUI

public struct PhotosPickerMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    let filter: [PHPickerFilter]
    
    public init(title: String? = nil, icon: String? = nil, filter: [PHPickerFilter] = []) {
        self.title = title
        self.icon = icon
        self.filter = filter
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Pick Photos") {
            self.context.photoSelectionFilter = self.filter
            self.context.showPhotosPicker.toggle()
        }
    }
}

public struct FilesPickerMenuItem: View {
    @Environment(AttachmentContext.self) var context

    let title: String?
    let icon: String?
    let filter: [UTType]
    
    public init(title: String? = nil, icon: String? = nil, filter: [UTType] = []) {
        self.title = title
        self.icon = icon
        self.filter = filter
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Pick Files") {
            self.context.fileSelectionFilter = self.filter
            self.context.showFilesPicker.toggle()
        }
    }
}

public struct CameraMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    
    public init(title: String? = nil, icon: String? = nil) {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Take a Photo") {
            self.context.showCamera.toggle()
        }
    }
}

extension View {
    @ViewBuilder
    func makeButton(title: String?, icon: String? = nil, defaultTitle: String, action: @escaping () -> Void) -> some View {
        if let icon {
            if let title {
                Button {
                    action()
                } label: {
                    Label(title, systemImage: icon)
                }

            } else {
                Button {
                    action()
                } label: {
                    Image(systemName: icon)
                }
            }
        } else {
            if let title {
                Button(title) {
                    action()
                }
            } else {
                Button(defaultTitle) {
                    action()
                }
            }
        }
    }
    
    func handleSelectedFile(url: URL) {}
}

public enum AttachmentMenuItems {
    public static let photos = PhotosPickerMenuItem(title: "Pick Photos", icon: "photo")
    public static let photosImageOnlyNoTitle = PhotosPickerMenuItem(icon: "photo")
    public static let files = FilesPickerMenuItem(title: "Pick Files", icon: "folder")
    public static let filesImageOnlyNoTitle = FilesPickerMenuItem(icon: "folder")
    public static let camera = CameraMenuItem(title: "Take a Photo", icon: "camera")
    public static let cameraImageOnlyNoTitle = CameraMenuItem(icon: "camera")
    
    public static func photos(title: String? = nil, icon: String? = nil, filter: [PHPickerFilter] = []) -> PhotosPickerMenuItem {
        PhotosPickerMenuItem(title: title ?? "Pick Photos", icon: icon ?? "photo", filter: filter)
    }
    
    public static func files(title: String? = nil, icon: String? = nil, filter: [UTType] = []) -> FilesPickerMenuItem {
        FilesPickerMenuItem(title: title ?? "Pick Files", icon: icon ?? "folder", filter: filter)
    }
}

#Preview {
    VStack {
        AttachmentMenuItems.photos
        PhotosPickerMenuItem(title: "Pick Photos")
        PhotosPickerMenuItem(title: "Pick Photos", icon: "photo")
        AttachmentMenuItems.photosImageOnlyNoTitle
        AttachmentMenuItems.files
        FilesPickerMenuItem(title: "Pick Files")
        FilesPickerMenuItem(title: "Pick Files", icon: "folder")
        AttachmentMenuItems.filesImageOnlyNoTitle
        AttachmentMenuItems.camera
        CameraMenuItem(title: "Take a Photo")
        CameraMenuItem(title: "Take a Photo", icon: "camera")
        AttachmentMenuItems.cameraImageOnlyNoTitle
    }
    .environment(AttachmentContext())
}

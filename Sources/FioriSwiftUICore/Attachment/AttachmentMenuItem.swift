import PhotosUI
import SwiftUI

/// PhotosPicker menu item
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

/// FilesPicker menu item
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

/// Camera menu item
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

/// Convenient operation menu items definitions, to be merged into PhotosPickerMenuItem, FilesPickerMenuItem, and CameraMenuItem together with localiztion
public enum AttachmentMenuItems {
    /// PhotosPicker menu item with title and icon
    public static let photos = PhotosPickerMenuItem(title: "Pick Photos", icon: "photo")
    
    /// PhotosPicker menu item with icon only
    public static let photosImageOnlyNoTitle = PhotosPickerMenuItem(icon: "photo")
    
    /// File importer menu item with title and icon
    public static let files = FilesPickerMenuItem(title: "Pick Files", icon: "folder")
    
    /// File importer menu item with icon only
    public static let filesImageOnlyNoTitle = FilesPickerMenuItem(icon: "folder")
    
    /// Camera menu item with title and icon
    public static let camera = CameraMenuItem(title: "Take a Photo", icon: "camera")
    
    /// Camera menu item with icon only
    public static let cameraImageOnlyNoTitle = CameraMenuItem(icon: "camera")
    
    /// PhotosPicker menu item with title, icon, and filter
    public static func photos(title: String? = nil, icon: String? = nil, filter: [PHPickerFilter] = []) -> PhotosPickerMenuItem {
        PhotosPickerMenuItem(title: title ?? "Pick Photos", icon: icon ?? "photo", filter: filter)
    }
    
    /// FileImporter menu item with title, icon, and filter
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

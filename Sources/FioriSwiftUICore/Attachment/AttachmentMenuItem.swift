import PhotosUI
import SwiftUI

/// PhotosPicker menu item
public struct PhotosPickerMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    let filter: [PHPickerFilter]
    
    public init(title: String? = "Photos", icon: String? = "image", filter: [PHPickerFilter] = []) {
        self.title = title
        self.icon = icon
        self.filter = filter
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Photos") {
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
    
    public init(title: String? = "Files", icon: String? = "doc.text", filter: [UTType] = []) {
        self.title = title
        self.icon = icon
        self.filter = filter
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Files") {
            self.context.fileSelectionFilter = self.filter
            self.context.showFilesPicker.toggle()
        }
    }
}

/// Camera menu item
public struct PdfScannerMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    
    public init(title: String? = "Scan", icon: String? = "scanner") {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Scan") {
            self.context.showPdfScanner.toggle()
        }
    }
}

/// Camera menu item
public struct CameraMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    
    public init(title: String? = "Camera", icon: String? = "camera") {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Camera") {
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
}

/// Convenient operation menu items definitions, to be merged into PhotosPickerMenuItem, FilesPickerMenuItem, and CameraMenuItem together with localiztion
public enum AttachmentMenuItems {
    /// PhotosPicker menu item with title and icon
    public static let photos = PhotosPickerMenuItem(title: "Photos", icon: "photo")
    
    /// PhotosPicker menu item with icon only
    public static let photosImageOnlyNoTitle = PhotosPickerMenuItem(icon: "photo")
    
    /// File importer menu item with title and icon
    public static let files = FilesPickerMenuItem(title: "Files", icon: "folder")
    
    /// File importer menu item with icon only
    public static let filesImageOnlyNoTitle = FilesPickerMenuItem(icon: "folder")
    
    /// Camera menu item with title and icon
    public static let camera = CameraMenuItem(title: "Camera", icon: "camera")
    
    /// Camera menu item with icon only
    public static let cameraImageOnlyNoTitle = CameraMenuItem(icon: "camera")
    
    /// PDF scanner menu item
    public static let pdfScanner = PdfScannerMenuItem()
    
    /// PhotosPicker menu item with title, icon, and filter
    public static func photos(title: String? = nil, icon: String? = nil, filter: [PHPickerFilter] = []) -> PhotosPickerMenuItem {
        PhotosPickerMenuItem(title: title ?? "Photos", icon: icon ?? "photo", filter: filter)
    }
    
    /// FileImporter menu item with title, icon, and filter
    public static func files(title: String? = nil, icon: String? = nil, filter: [UTType] = []) -> FilesPickerMenuItem {
        FilesPickerMenuItem(title: title ?? "Files", icon: icon ?? "folder", filter: filter)
    }
}

#Preview {
    VStack {
        AttachmentMenuItems.photos
        PhotosPickerMenuItem(title: "Photos", icon: nil)
        PhotosPickerMenuItem(title: "Photos", icon: "photo")
        AttachmentMenuItems.photosImageOnlyNoTitle
        AttachmentMenuItems.files
        FilesPickerMenuItem(title: "Files", icon: nil)
        FilesPickerMenuItem(title: "Files", icon: "folder")
        AttachmentMenuItems.filesImageOnlyNoTitle
        AttachmentMenuItems.camera
        CameraMenuItem(title: "Camera", icon: nil)
        CameraMenuItem(title: "Camera", icon: "camera")
        AttachmentMenuItems.cameraImageOnlyNoTitle
        AttachmentMenuItems.pdfScanner
    }
    .environment(AttachmentContext())
}

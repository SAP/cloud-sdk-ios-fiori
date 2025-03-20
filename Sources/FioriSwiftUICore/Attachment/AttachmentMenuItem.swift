import PhotosUI
import SwiftUI

/// PhotosPicker menu item
public struct PhotosPickerMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    let filter: [PHPickerFilter]
    
    public init(title: String? = "Pick Photo(s)", icon: String? = "image", filter: [PHPickerFilter] = []) {
        self.title = title
        self.icon = icon
        self.filter = filter
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Pick Photo(s)") {
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
    
    public init(title: String? = "Pick a File", icon: String? = "doc.text", filter: [UTType] = []) {
        self.title = title
        self.icon = icon
        self.filter = filter
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Pick a File") {
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
    
    public init(title: String? = "Scan as a PDF", icon: String? = "scanner") {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Scan as a PDF") {
            self.context.showPdfScanner.toggle()
        }
    }
}

/// Camera menu item
public struct CameraMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    
    public init(title: String? = "Take a Photo/Movie", icon: String? = "camera") {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        makeButton(title: self.title, icon: self.icon, defaultTitle: "Take a Photo/Movie") {
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
    public static let photos = PhotosPickerMenuItem(title: "Pick from Photos", icon: "photo")
    
    /// PhotosPicker menu item with icon only
    public static let photosImageOnlyNoTitle = PhotosPickerMenuItem(icon: "photo")
    
    /// File importer menu item with title and icon
    public static let files = FilesPickerMenuItem(title: "Pick from Files", icon: "folder")
    
    /// File importer menu item with icon only
    public static let filesImageOnlyNoTitle = FilesPickerMenuItem(icon: "folder")
    
    /// Camera menu item with title and icon
    public static let camera = CameraMenuItem(title: "Take a Photo/Movie", icon: "camera")
    
    /// Camera menu item with icon only
    public static let cameraImageOnlyNoTitle = CameraMenuItem(icon: "camera")
    
    /// PDF scanner menu item
    public static let pdfScanner = PdfScannerMenuItem()
    
    /// PhotosPicker menu item with title, icon, and filter
    public static func photos(title: String? = nil, icon: String? = nil, filter: [PHPickerFilter] = []) -> PhotosPickerMenuItem {
        PhotosPickerMenuItem(title: title ?? "Pick from Photos", icon: icon ?? "photo", filter: filter)
    }
    
    /// FileImporter menu item with title, icon, and filter
    public static func files(title: String? = nil, icon: String? = nil, filter: [UTType] = []) -> FilesPickerMenuItem {
        FilesPickerMenuItem(title: title ?? "Pick from Files", icon: icon ?? "folder", filter: filter)
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
        AttachmentMenuItems.pdfScanner
    }
    .environment(AttachmentContext())
}

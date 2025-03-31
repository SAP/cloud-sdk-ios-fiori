import PhotosUI
import SwiftUI

/// PhotosPicker menu item
public struct PhotosPickerMenuItem: View {
    @Environment(AttachmentContext.self) var context
    
    let title: String?
    let icon: String?
    let filter: [PHPickerFilter]
    
    public init(title: String? = NSLocalizedString("Photos", tableName: "FioriSwiftUICore", comment: "Photos"), icon: String? = "photo", filter: [PHPickerFilter] = []) {
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
    
    public init(title: String? = NSLocalizedString("Files", tableName: "FioriSwiftUICore", comment: "Files"), icon: String? = "doc.text", filter: [UTType] = []) {
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
    
    public init(title: String? = NSLocalizedString("Scan", tableName: "FioriSwiftUICore", comment: "Scan"), icon: String? = "scanner") {
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
    
    public init(title: String? = NSLocalizedString("Camera", tableName: "FioriSwiftUICore", comment: "Camera"), icon: String? = "camera") {
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

import PhotosUI
import SwiftUI

public struct DefaultOperationsModifier: ViewModifier {
    @Environment(AttachmentContext.self) var context

    @State private var images = [UIImage]()
    @State private var selectedPhotos = [PhotosPickerItem]()
        
    private var showFilesPicker: Binding<Bool> {
        Binding<Bool>(
            get: { self.context.showFilesPicker },
            set: { self.context.showFilesPicker = $0 }
        )
    }
    
    private var showPhotosPicker: Binding<Bool> {
        Binding<Bool>(
            get: { self.context.showPhotosPicker },
            set: { self.context.showPhotosPicker = $0 }
        )
    }
    
    private var showCamera: Binding<Bool> {
        Binding<Bool>(
            get: { self.context.showCamera },
            set: { self.context.showCamera = $0 }
        )
    }

    public func body(content: Content) -> some View {
        content
            .environment(self.context)
            .fileImporter(
                isPresented: self.showFilesPicker,
                allowedContentTypes: [.pdf, .text, .png, .plainText],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let files):
                    files.forEach { file in
                        let gotAccess = file.startAccessingSecurityScopedResource()
                        if !gotAccess { return }
//                            handleSelectedFile(url: file)
                        file.stopAccessingSecurityScopedResource()
                    }
                case .failure(let error):
                    print(error)
                }
            }
            .sheet(isPresented: self.showPhotosPicker) {
                PhotosPicker(
                    "Pick a photo",
                    selection: self.$selectedPhotos,
                    maxSelectionCount: 1, // make sure alwasy to use 1
                    selectionBehavior: .ordered,
                    matching: .images
                )
                .photosPickerStyle(.inline)
            }
            .onChange(of: self.selectedPhotos) { _, _ in
//                    convertDataToImage()
            }
    }
}

public extension View {
    func defaultOperations() -> some View {
        modifier(DefaultOperationsModifier())
    }
}

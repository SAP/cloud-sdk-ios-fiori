import Foundation
import PhotosUI
import SwiftUI

/// View modifier to apply attachment operations to operation button, i.e. + button
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
                allowedContentTypes: self.context.fileSelectionFilter.isEmpty ? AttachmentConstants.defaultFileImporterFilter : self.context.fileSelectionFilter,
                allowsMultipleSelection: false,
                onCompletion: self.onCompletion
            )
            .sheet(isPresented: self.showPhotosPicker) {
                let maxSelectionCount = self.context.configuration?.maxCount == nil ? nil : (self.context.configuration?.maxCount ?? 0) - (self.context.configuration?.attachments.count ?? 0)
                PhotosPicker(
                    "Pick a photo",
                    selection: self.$selectedPhotos,
                    maxSelectionCount: maxSelectionCount,
                    selectionBehavior: .ordered,
                    matching: self.context.photoSelectionFilter.isEmpty ? nil : .all(of: self.context.photoSelectionFilter)
                )
                .photosPickerStyle(.inline)
            }
            .onChange(of: self.selectedPhotos) { _, _ in
                self.context.upload(photoPickerItems: self.selectedPhotos)
                self.selectedPhotos.removeAll()
            }
    }
    
    func onCompletion(_ result: Result<[URL], any Error>) {
        switch result {
        case .success(let files):
            files.forEach { file in
                let gotAccess = file.startAccessingSecurityScopedResource()
                if !gotAccess { return }

                let itemProvider = NSItemProvider()
                itemProvider.registerFileRepresentation(for: .item, openInPlace: true) { completionHandler in
                    completionHandler(file, true, nil)
                    return Foundation.Progress()
                }
                self.context.upload(contentFrom: itemProvider)

                file.stopAccessingSecurityScopedResource()
            }
        case .failure(let error):
            print(error)
        }
    }
    
    func onCompletion(_ result: Result<URL, any Error>) {
        switch result {
        case .success(let file):
            let gotAccess = file.startAccessingSecurityScopedResource()
            if !gotAccess { return }
            
            let itemProvider = NSItemProvider()
            itemProvider.registerFileRepresentation(for: .item, openInPlace: true) { completionHandler in
                completionHandler(file, true, nil)
                return Foundation.Progress()
            }
            self.context.upload(contentFrom: itemProvider)
            
            file.stopAccessingSecurityScopedResource()
        case .failure(let error):
            print(error)
        }
    }
}

public extension View {
    /// Apply default operations, PhotosPicker, FilesPicker, and Camera operations to a view.
    func defaultOperations() -> some View {
        modifier(DefaultOperationsModifier())
    }
}

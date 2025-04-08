import Foundation
import OSLog
import PDFKit
import PhotosUI
import SwiftUI

/// View modifier to apply attachment operations to operation button, i.e. + button
public struct DefaultOperationsModifier: ViewModifier {
    @Environment(AttachmentContext.self) var context

    @State private var images = [UIImage]()
    @State private var selectedPhotos = [PhotosPickerItem]()
    
    @State private var scannedImages: [UIImage] = []
    @State private var pdfDocument: PDFDocument?

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
    
    private var showPdfScanner: Binding<Bool> {
        Binding<Bool>(
            get: { self.context.showPdfScanner },
            set: { self.context.showPdfScanner = $0 }
        )
    }
    
    private var showImageScanner: Binding<Bool> {
        Binding<Bool>(
            get: { self.context.showImageScanner },
            set: { self.context.showImageScanner = $0 }
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
                self.photoPicker
            }
            .onChange(of: self.selectedPhotos) { _, _ in
                self.context.upload(photoPickerItems: self.selectedPhotos)
                self.selectedPhotos.removeAll()
            }
            .sheet(isPresented: self.showCamera) {
                CameraView { uiImage in
                    self.context.upload(images: [uiImage])
                } onSaveVideo: { movieUrl in
                    self.context.upload(movieUrl: movieUrl)
                }
            }
            .sheet(isPresented: self.showPdfScanner) {
                self.pdfScanner
            }
            .onChange(of: self.pdfDocument) { _, _ in
                if let pdfDocument = self.pdfDocument {
                    self.context.upload(pdfDocument: pdfDocument)
                    self.pdfDocument = nil
                }
            }
            .sheet(isPresented: self.showImageScanner) {
                self.imageScanner
            }
            .onChange(of: self.scannedImages) { _, _ in
                self.context.upload(images: self.scannedImages)
                self.scannedImages.removeAll()
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
            os_log("Upload error: %@", log: OSLog.coreLogger, type: .error, "\(error)")
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
            os_log("Upload error: %@", log: OSLog.coreLogger, type: .error, "\(error)")
        }
    }
    
    var photoPicker: some View {
        let maxSelectionCount = self.context.configuration?.maxCount == nil ? nil : (self.context.configuration?.maxCount ?? 0) - (self.context.configuration?.attachments.count ?? 0)
        return PhotosPicker(
            "Pick a photo",
            selection: self.$selectedPhotos,
            maxSelectionCount: maxSelectionCount,
            selectionBehavior: .ordered,
            matching: self.context.photoSelectionFilter.isEmpty ? nil : .all(of: self.context.photoSelectionFilter)
        )
        .photosPickerStyle(.inline)
    }
    
    var pdfScanner: some View {
        DocumentScannerView(onCompletion: { result in
            switch result {
            case .success(.images(_)):
                break
            case .success(.pdf(let pdf)):
                self.pdfDocument = pdf
                os_log("Scanned PDF: %@", log: OSLog.coreLogger, type: .debug, "\(pdf)")
            case .failure(let error):
                os_log("Scan document error: %@", log: OSLog.coreLogger, type: .error, "\(error)")
            }
        }, outputFormat: .pdf)
            .edgesIgnoringSafeArea(.all)
    }
    
    var imageScanner: some View {
        DocumentScannerView(onCompletion: { result in
            switch result {
            case .success(.images(let images)):
                self.scannedImages = images
                os_log("Scanned Images: %d", log: OSLog.coreLogger, type: .error, images.count)
            case .success(.pdf(_)):
                break
            case .failure(let error):
                os_log("Scan image error: %@", log: OSLog.coreLogger, type: .error, "\(error)")
            }
        }, outputFormat: .images)
            .edgesIgnoringSafeArea(.all)
    }
}

public extension View {
    /// Apply default operations, PhotosPicker, FilesPicker, and Camera operations to a view.
    func defaultOperations() -> some View {
        modifier(DefaultOperationsModifier())
    }
}

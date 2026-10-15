import AVFoundation
import CoreLocation
import OSLog
import PDFKit
import PhotosUI
import SwiftUI
import UniformTypeIdentifiers

/// Attachment Context facilitates hierarchical components, i.e. AttachmentGroup and Attachment work together, for example
/// setting and displaying error message and showing and dismissing file picker.
@Observable
open class AttachmentContext {
    /// Controls the visibility of the system Photos picker for selecting images from the photo library.
    ///
    /// Setting this property to `true` presents the PhotosPicker UI component, allowing users to select
    /// photos from their device's photo library. After selection or dismissal, this property should be
    /// set back to `false` to hide the picker.
    public var showPhotosPicker: Bool = false
    
    /// Controls the visibility of the system Files picker for selecting documents.
    ///
    /// Setting this property to `true` presents the FileImporter UI component, allowing users to select
    /// documents from their device's file system or cloud storage. After selection or dismissal, this
    /// property should be set back to `false` to hide the picker.
    public var showFilesPicker: Bool = false
    
    /// Controls the visibility of the camera interface for capturing photos or videos.
    ///
    /// Setting this property to `true` presents the camera UI, allowing users to capture new photos
    /// or videos using the device camera. After capturing or dismissal, this property should be
    /// set back to `false` to hide the camera interface.
    public var showCamera: Bool = false
    
    /// Controls the visibility of the document scanner interface for capturing PDF documents.
    ///
    /// Setting this property to `true` presents the document scanning UI, allowing users to capture
    /// multi-page documents and convert them to PDF format. After scanning or dismissal, this property
    /// should be set back to `false` to hide the scanner.
    public var showPdfScanner: Bool = false

    /// Controls the visibility of the document scanner interface for capturing individual images.
    ///
    /// Setting this property to `true` presents the image scanning UI, allowing users to capture
    /// images with document-specific enhancements like perspective correction and edge detection.
    /// After scanning or dismissal, this property should be set back to `false` to hide the scanner.
    public var showImageScanner: Bool = false
    
    var photoSelectionFilter: [PHPickerFilter] = []
    var fileSelectionFilter: [UTType] = []
    
    /// The delegate that handles attachment operations like uploading, downloading, and deleting.
    ///
    /// This delegate is responsible for implementing the actual business logic for attachment operations.
    /// It's defined as weak to avoid reference cycles since the context might be held by the delegate.
    public weak var delegate: AttachmentDelegate?
    
    /// The configuration for the attachment group containing settings and state.
    ///
    /// This configuration contains the list of attachments and other settings that control the behavior
    /// and appearance of attachment-related UI components.
    public var configuration: AttachmentGroupConfiguration?
    
    /// A closure that provides default extra information for newly uploaded attachments.
    ///
    /// When an attachment is successfully uploaded, this closure is called to generate optional
    /// extra information that will be associated with the attachment in its `.uploaded` state.
    /// - Returns: An instance conforming to `AttachmentExtraInfo` to associate with uploaded attachments.
    public var onDefaultExtraInfo: (() -> any AttachmentExtraInfo)?
    
    /// Indicates whether an attachment is currently being uploaded.
    ///
    /// This property is derived from the active upload count. Use it to show loading indicators
    /// or disable UI interactions during active uploads.
    public var isUploading: Bool {
        self.activeUploadCount > 0
    }

    private var activeUploadCount = 0

    /// Controls the location capture behavior for attachments.
    /// Default is `.disabled`. When enabled, extracts location from asset metadata
    /// and captures device location for camera photos or videos.
    public var locationCaptureMode: LocationCaptureMode = .disabled {
        didSet {
            if oldValue != self.locationCaptureMode {
                self._locationService = nil
            }
        }
    }

    private var _locationService: AttachmentLocationService?

    private var locationService: AttachmentLocationService {
        if let service = _locationService {
            return service
        }
        let service = AttachmentLocationService(locationCaptureMode: self.locationCaptureMode)
        self._locationService = service
        return service
    }

    /// Initializes a new attachment context with default settings.
    ///
    /// This initializer creates a new instance of `AttachmentContext` with the following default state:
    public init() {}
    
    func upload(contentFrom provider: NSItemProvider) {
        self.activeUploadCount += 1
        self.upload(contentFrom: provider, location: nil)
    }
    
    func upload(photoPickerItems: [PhotosPickerItem]) {
        for item in photoPickerItems {
            os_log("Upload item identifier: %@", log: OSLog.coreLogger, type: .debug, "\(item.itemIdentifier ?? "N/A")")
            os_log("Item content types: %@", log: OSLog.coreLogger, type: .debug, "\(item.supportedContentTypes)")
            Task { [weak self] in
                guard let self else { return }

                self.activeUploadCount += 1

                var location: CLLocation?
                if case .enabled = self.locationCaptureMode {
                    location = await self.locationService.extractLocation(fromAssetIdentifier: item.itemIdentifier)
                }

                do {
                    if let data = try await item.loadTransferable(type: Data.self) {
                        let provider = NSItemProvider()
                        // first supported uttype identifier
                        provider.registerDataRepresentation(forTypeIdentifier: item.supportedContentTypes[0].identifier, visibility: .ownProcess) { completionHandler in
                            completionHandler(data, nil)
                            return Foundation.Progress()
                        }
                        self.upload(contentFrom: provider, location: location)
                    } else {
                        self.activeUploadCount -= 1
                    }
                } catch {
                    self.activeUploadCount -= 1
                    self.configuration?.errorMessage = AttributedString(error.localizedDescription)
                    os_log("Error loading item: %@", log: OSLog.coreLogger, type: .error, "\(error)")
                }
            }
        }
    }
    
    func upload(images: [UIImage?]) {
        for item in images {
            guard let item else {
                self.configuration?.errorMessage = AttributedString("No image data available.")
                continue
            }

            Task { @MainActor in
                self.activeUploadCount += 1

                var location: CLLocation?
                if case .enabled = self.locationCaptureMode {
                    location = await self.locationService.getCurrentLocation()
                }

                if let data = item.jpegData(compressionQuality: 1.0) {
                    let provider = NSItemProvider()
                    provider.registerDataRepresentation(forTypeIdentifier: UTType.jpeg.identifier, visibility: .ownProcess) { completionHandler in
                        completionHandler(data, nil)
                        return Foundation.Progress()
                    }
                    self.upload(contentFrom: provider, location: location)
                } else {
                    self.activeUploadCount -= 1
                }
            }
        }
    }
    
    func upload(pdfDocument: PDFDocument) {
        if let data = pdfDocument.dataRepresentation() {
            self.activeUploadCount += 1
            let provider = NSItemProvider()
            // first supported uttype identifier
            provider.registerDataRepresentation(forTypeIdentifier: UTType.pdf.identifier, visibility: .ownProcess) { completionHandler in
                completionHandler(data, nil)
                return Foundation.Progress()
            }
            self.upload(contentFrom: provider, location: nil)
        }
    }

    func upload(movieUrl: URL?) {
        guard let movieUrl else {
            self.configuration?.errorMessage = AttributedString("Video file not available.")
            return
        }
        Task { @MainActor in
            self.activeUploadCount += 1

            var location: CLLocation?
            if case .enabled = self.locationCaptureMode {
                location = await self.locationService.getCurrentLocation()
            }

            do {
                let data = try Data(contentsOf: movieUrl)
                let provider = NSItemProvider()
                provider.registerDataRepresentation(forTypeIdentifier: UTType.mpeg4Movie.identifier, visibility: .ownProcess) { completionHandler in
                    completionHandler(data, nil)
                    return Foundation.Progress()
                }
                self.upload(contentFrom: provider, location: location)
            } catch {
                self.activeUploadCount -= 1
                self.configuration?.errorMessage = AttributedString(error.localizedDescription)
            }
        }
    }
    
    /// Deletes an attachment based on its URL.
    ///
    /// This method handles attachment deletion with different behavior based on the attachment's state:
    /// - For `.uploaded` attachments: Delegates deletion to the `AttachmentDelegate` and removes from the list upon success
    /// - For `.uploading` or `.error` attachments: Immediately removes from the attachment list without delegate involvement
    ///
    /// Error handling is provided through the delegate callback, with appropriate error messages displayed
    /// for `AttachmentError` cases or standard errors.
    ///
    /// - Parameter attachment: The URL of the attachment to be deleted
    public func delete(attachment: URL) {
        guard let configuration else {
            os_log("AttachmentConfiguration is not initialized, yet. Please check code/usage.", log: OSLog.coreLogger, type: .debug)
            return
        }
        
        if case .uploaded = configuration.attachments.first(where: { $0.primaryURL == attachment }) {
            self.delegate?.delete(url: attachment) { url, error in
                if let error {
                    if let attachmentError = error as? AttachmentError {
                        switch attachmentError {
                        case .failedToDeleteAttachment(let errorMessage):
                            configuration.errorMessage = AttributedString(errorMessage)
                        default:
                            break
                        }
                    } else {
                        configuration.errorMessage = AttributedString(error.localizedDescription)
                        return
                    }
                }
                
                self.configuration?.attachments.removeAll(where: { $0.primaryURL == url })
            }
        } else if case .uploading = configuration.attachments.first(where: { $0.primaryURL == attachment }) {
            self.configuration?.attachments.removeAll(where: { $0.primaryURL == attachment })
        } else {
            self.configuration?.attachments.removeAll(where: { $0.primaryURL == attachment })
        }
    }
}

private extension AttachmentContext {
    func upload(contentFrom provider: NSItemProvider, location: CLLocation?) {
        guard let configuration else {
            os_log("AttachmentConfiguration is not initialized, yet. Please check code/usage.", log: OSLog.coreLogger, type: .debug)
            self.activeUploadCount -= 1
            return
        }
        guard let delegate else {
            os_log("AttachmentDelegate is not set. Please check code/usage.", log: OSLog.coreLogger, type: .debug)
            self.activeUploadCount -= 1
            return
        }
        var uploadingAttachmentInfo: AttachmentInfo?

        delegate.upload(contentFrom: provider, location: location, onStarting: { url in
            uploadingAttachmentInfo = .uploading(sourceURL: url)
            if let uploadingAttachmentInfo {
                configuration.attachments.append(uploadingAttachmentInfo)
            }
        }, onCompletion: { url, error in
            DispatchQueue.main.async {
                defer {
                    self.activeUploadCount -= 1
                }
                if let uploadingAttachmentInfo {
                    if let error {
                        if let attachmentError = error as? AttachmentError {
                            switch attachmentError {
                            case .failedToUploadAttachment(let errorMessage):
                                configuration.attachments = configuration.attachments.map { $0 == uploadingAttachmentInfo ? .error(sourceURL: $0.primaryURL, message: errorMessage) : $0 }
                            default:
                                break
                            }
                        } else {
                            configuration.attachments = configuration.attachments.map { $0 == uploadingAttachmentInfo ? .error(sourceURL: $0.primaryURL, message: error.localizedDescription) : $0 }
                        }
                    } else {
                        guard let url else { return }
                        configuration.errorMessage = nil
                        configuration.attachments = configuration.attachments.map { $0 == uploadingAttachmentInfo ? .uploaded(destinationURL: url, sourceURL: $0.primaryURL, extraInfo: self.onDefaultExtraInfo?()) : $0 }
                    }
                } else {
                    if let error {
                        if let attachmentError = error as? AttachmentError {
                            switch attachmentError {
                            case .failedToUploadAttachment(let errorMessage):
                                configuration.errorMessage = AttributedString(errorMessage)
                            default:
                                break
                            }
                        } else {
                            configuration.errorMessage = AttributedString(error.localizedDescription)
                        }
                    } else {
                        guard let url, let uploadingAttachmentInfo else { return }
                        configuration.errorMessage = nil
                        configuration.attachments = configuration.attachments.map { $0 == uploadingAttachmentInfo ? .uploaded(destinationURL: url, sourceURL: $0.primaryURL, extraInfo: self.onDefaultExtraInfo?()) : $0 }
                    }
                }
            }
        })
    }
}

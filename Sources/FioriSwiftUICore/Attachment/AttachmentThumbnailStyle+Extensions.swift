import FioriThemeManager
import OSLog
import QuickLook
import SwiftUI

extension AttachmentThumbnailStyle {
    static func getDefaultThumbnail(url: URL) -> Image {
        switch url.pathExtension.lowercased() {
        // sap-icon-attachment-audio (for audio files)
        case "aa", "aac", "aax", "act", "aiff", "amr", "ape", "au", "awb", "dct", "dss", "dvf", "flac", "gsm", "iklax", "ivs", "m4a", "m4b", "mmf", "mp3", "mpc", "msv", "nsf", "oga", "mogg", "opus", "ra", "raw", "sln", "tta", "vox", "wav", "wma", "wv", "8svx":
            FioriIcon.documents.attachmentAudio
        // sap-icon-attachment-html (for web files)
        case "htm", "html", "shtml", "xhtml", "xml", "xsl", "xsd", "xul", "xht":
            FioriIcon.documents.attachmentHtml
        // sap-icon-attachment-text (for text files)
        case "txt", "rtf":
            FioriIcon.documents.attachmentTextFile
        // sap-icon-attachment-video (for video files)
        case "webm", "mkv", "flv", "vob", "ogv", "ogg", "drc", "gifv", "mng", "avi", "mov", "qt", "wmv", "yuv", "rm", "rmvb", "asf", "amv", "mp4", "m4p", "m4v", "mpg", "mp2", "mpeg", "mpe", "mpv", "m2v", "svi", "3gp", "3g2", "mxf", "roq", "nsv", "f4v", "f4p", "f4a", "f4b":
            FioriIcon.documents.attachmentVideo
        // sap-icon-attachment-zip (for zip files)
        case "zip", "rar", "7z":
            FioriIcon.documents.attachmentZipFile
        // sap-icon-doc-attachment (for word files)
        case "doc", "docx":
            FioriIcon.documents.docAttachment2
        // sap-icon-document-csv (for csv files)
        case "csv":
            FioriIcon.documents.excelAttachment
        // sap-icon-picture (for images)
        case "jpg", "jpeg", "jfif", "jpeg 2000", "exif", "tiff", "gif", "bmp", "png", "ppm", "pgm", "pbm", "pnm", "webp", "hdr", "heif", "bat", "bpg":
            FioriIcon.documents.attachmentPhoto
        // sap-icon-pdf-attachment (for PDF files)
        case "pdf":
            FioriIcon.documents.pdfAttachment
        // sap-icon-ppt-attachment (for power point presentations)
        case "ppt", "pptx", "pptm", "key":
            FioriIcon.documents.pptAttachment
        // sap-icon-excel-attachment (for excel files)
        case "excel", "xls", "xlsx", "xlsm", "xltx", "xltm":
            FioriIcon.documents.excelAttachment
        // sap-icon-document (placeholder document icon if others don't fit)
        default:
            FioriIcon.documents.document
        }
    }
}

/// A SwiftUI style that provides a thumbnail view for attachments, attempting to generate and display a QuickLook preview for the given file URL.
///
/// ### Example Usage
/// ```swift
/// AttachmentThumbnail(configuration)
///     .attachmentThumbnailStyle(AttachmentThumbnailWithPreviewStyle())
/// ```
public struct AttachmentThumbnailWithPreviewStyle: AttachmentThumbnailStyle {
    @State var image: AnyView? = nil
    
    public init() {}
    
    public func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
        if let image {
            image
        } else {
            AnyView(
                AttachmentThumbnail(configuration)
                    .onAppear {
                        Task {
                            self.generateThumbnail(url: configuration.url)
                        }
                    }
            )
        }
    }
    
    func generateThumbnail(url: URL) {
        let size = CGSize(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
        #if os(visionOS)
            let scale = 1.0
        #else
            let scale = UIScreen.main.scale
        #endif
        let request = QLThumbnailGenerator.Request(
            fileAt: url,
            size: size,
            scale: scale,
            representationTypes: .thumbnail
        )
        
        let generator = QLThumbnailGenerator.shared
        generator.generateBestRepresentation(for: request) { thumbnail, error in
            DispatchQueue.main.async {
                if let error {
                    os_log("Error generating thumbnail: %@", log: OSLog.coreLogger, type: .debug, "\(error)")
                    return
                }
                if let thumbnailUiImage = thumbnail?.uiImage {
                    self.image = AnyView(
                        Image(uiImage: thumbnailUiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
                            .clipShape(
                                RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                            )
                    )
                }
            }
        }
    }
}

@testable import FioriSwiftUICore
@testable import FioriThemeManager
import SwiftUI
import XCTest

final class AttachmentStyleTests: XCTestCase {
    func testGetDefaultThumbnail_AudioExtensions() {
        let audioExtensions = ["mp3", "wav", "aac", "flac", "wma"]
        for ext in audioExtensions {
            let url = URL(fileURLWithPath: "/tmp/file.").appendingPathExtension(ext)
            let image = AttachmentThumbnailFioriStyle.getDefaultThumbnail(url: url)
            XCTAssertEqual(image, FioriIcon.documents.attachmentAudio, "Failed for extension: \(ext)")
        }
    }

    func testGetDefaultThumbnail_ImageExtensions() {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "bmp", "tiff"]
        for ext in imageExtensions {
            let url = URL(fileURLWithPath: "/tmp/file.").appendingPathExtension(ext)
            let image = AttachmentThumbnailFioriStyle.getDefaultThumbnail(url: url)
            XCTAssertEqual(image, FioriIcon.documents.attachmentPhoto, "Failed for extension: \(ext)")
        }
    }

    func testGetDefaultThumbnail_PdfExtension() {
        let url = URL(fileURLWithPath: "/tmp/file.pdf")
        let image = AttachmentThumbnailFioriStyle.getDefaultThumbnail(url: url)
        XCTAssertEqual(image, FioriIcon.documents.pdfAttachment)
    }

    func testGetDefaultThumbnail_UnknownExtension() {
        let url = URL(fileURLWithPath: "/tmp/file.unknown")
        let image = AttachmentThumbnailFioriStyle.getDefaultThumbnail(url: url)
        XCTAssertEqual(image, FioriIcon.documents.document)
    }

    func testGetDefaultThumbnail_EmptyExtension() {
        let url = URL(fileURLWithPath: "/tmp/file")
        let image = AttachmentThumbnailFioriStyle.getDefaultThumbnail(url: url)
        XCTAssertEqual(image, FioriIcon.documents.document)
    }
}

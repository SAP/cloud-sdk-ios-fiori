@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class AttachmentTests: XCTestCase {
    func testAttachmentInitAndActions() {
        let attachmentInfo = AttachmentInfo.uploading(sourceURL: URL(fileURLWithPath: "/tmp/testfile.txt"))
        
        var didPreview = false
        var didDelete = false

        let attachmentView = Attachment(
            attachmentTitle: AttributedString("Test Attachment"),
            attachmentSubtitle: AttributedString("Subtitle"),
            attachmentFootnote: AttributedString("Footnote"),
            attachmentInfo: attachmentInfo,
            controlState: .normal,
            onExtraInfoChange: nil,
            onPreview: { info in
                XCTAssertEqual(info, attachmentInfo)
                didPreview = true
            },
            onDelete: { info in
                XCTAssertEqual(info, attachmentInfo)
                didDelete = true
            }
        )
        
        attachmentView.onDelete?(attachmentInfo)
        attachmentView.onPreview?(attachmentInfo)
        
        XCTAssertTrue(didPreview, "Preview callback should be called")
        XCTAssertTrue(didDelete, "Delete callback should be called")
    }
}

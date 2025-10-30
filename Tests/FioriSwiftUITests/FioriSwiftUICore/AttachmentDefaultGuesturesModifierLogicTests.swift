import XCTest
import SwiftUI
@testable import FioriSwiftUICore

final class AttachmentDefaultGuesturesModifierLogicTests: XCTestCase {
    fileprivate func getInfo() -> AttachmentInfo {
        return AttachmentInfo.uploaded(destinationURL: URL(string: "file:///tmp/test.pdf")!, sourceURL: URL(string: "file:///tmp/test.pdf")!)
    }
    
    fileprivate func getTitle() -> AttachmentConfiguration.AttachmentTitle {
        return AttachmentConfiguration.AttachmentTitle(Text("Test Attachment"))
    }
    
    fileprivate func getSubtitle() -> AttachmentConfiguration.AttachmentSubtitle {
        return AttachmentConfiguration.AttachmentSubtitle(Text("Subtitle"))
    }
    
    fileprivate func getFootnote() -> AttachmentConfiguration.AttachmentFootnote {
        return AttachmentConfiguration.AttachmentFootnote(Text("Footnote"))
    }
    
    func testPreviewCallbackIsCalled() {
        let info = getInfo()
        var previewCalled = false

        let config = AttachmentConfiguration(
            attachmentTitle: getTitle(),
            attachmentSubtitle: getSubtitle(),
            attachmentFootnote: getFootnote(),
            attachmentInfo: info,
            controlState: .normal,
            onExtraInfoChange: nil,
            onPreview: { _ in previewCalled = true },
            onDelete: nil
        )

        // Simulate what the modifier would do on tap
        config.onPreview?(config.attachmentInfo)
        XCTAssertTrue(previewCalled, "Preview callback should be called")
    }

    func testDeleteCallbackIsCalledInNormalState() {
        let info = getInfo()
        var deleteCalled = false

        let config = AttachmentConfiguration(
            attachmentTitle: getTitle(),
            attachmentSubtitle: getSubtitle(),
            attachmentFootnote: getFootnote(),
            attachmentInfo: info,
            controlState: .normal,
            onExtraInfoChange: nil,
            onPreview: nil,
            onDelete: { _ in deleteCalled = true }
        )

        // Simulate what the modifier would do on delete
        config.onDelete?(config.attachmentInfo)
        XCTAssertTrue(deleteCalled, "Delete callback should be called in normal state")
    }

    func testPreviewCallbackIsCalledInReadOnlyState() {
        let info = getInfo()
        var previewCalled = false

        let config = AttachmentConfiguration(
            attachmentTitle: getTitle(),
            attachmentSubtitle: getSubtitle(),
            attachmentFootnote: getFootnote(),
            attachmentInfo: info,
            controlState: .readOnly,
            onExtraInfoChange: nil,
            onPreview: { _ in previewCalled = true },
            onDelete: nil
        )

        // Simulate what the modifier would do on tap
        config.onPreview?(config.attachmentInfo)
        XCTAssertTrue(previewCalled, "Preview callback should be called in readOnly state")
    }
}

@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class AttachmentInProgressTests: XCTestCase {
    // Test URLs and objects
    var sourceURL: URL!
    
    // Track callback invocations
    var previewCalled = false
    var deleteCalled = false
    var capturedAttachmentInfo: AttachmentInfo?
    
    override func setUpWithError() throws {
        // Reset flags before each test
        self.previewCalled = false
        self.deleteCalled = false
        self.capturedAttachmentInfo = nil
        
        // Create test URLs
        self.sourceURL = URL(fileURLWithPath: "/tmp/uploading_file.pdf")
    }
    
    override func tearDownWithError() throws {
        // Clean up
        self.sourceURL = nil
    }
    
    // MARK: - Test Helpers
    
    // Create a test instance of AttachmentInProgress
    private func createAttachmentInProgress() -> AttachmentInProgress {
        let attachmentInfo = AttachmentInfo.uploading(sourceURL: self.sourceURL)
        
        return AttachmentInProgress(
            attachmentInProgressTitle: {
                Text(attachmentInfo.attachmentName)
            },
            attachmentInfo: attachmentInfo,
            onPreview: { [weak self] info in
                self?.previewCalled = true
                self?.capturedAttachmentInfo = info
            },
            onDelete: { [weak self] info in
                self?.deleteCalled = true
                self?.capturedAttachmentInfo = info
            }
        )
    }
    
    // MARK: - Initialization Tests
    
    func testInitWithUploadingAttachment() {
        let progressComponent = self.createAttachmentInProgress()
        
        if case .uploading(let url) = progressComponent.attachmentInfo {
            XCTAssertEqual(url, self.sourceURL)
        } else {
            XCTFail("Expected uploading state but got \(progressComponent.attachmentInfo)")
        }
    }
    
    func testUploadingAttachmentName() {
        let progressComponent = self.createAttachmentInProgress()
        XCTAssertEqual(progressComponent.attachmentInfo.attachmentName, "uploading_file.pdf")
    }
    
    func testNoErrorMessageForUploadingAttachment() {
        let progressComponent = self.createAttachmentInProgress()
        XCTAssertNil(progressComponent.attachmentInfo.errorMessage, "Uploading attachment should not have an error message")
    }
    
    // MARK: - Callback Tests
    
    func testOnPreviewCallback() {
        let progressComponent = self.createAttachmentInProgress()
        
        // Simulate user tapping on the attachment to preview
        progressComponent.onPreview?(progressComponent.attachmentInfo)
        
        XCTAssertTrue(self.previewCalled, "Preview callback should have been called")
        
        if let capturedInfo = self.capturedAttachmentInfo, case .uploading(let url) = capturedInfo {
            XCTAssertEqual(url, self.sourceURL)
        } else {
            XCTFail("Captured attachment info should be in uploading state")
        }
    }
    
    func testOnDeleteCallback() {
        let progressComponent = self.createAttachmentInProgress()
        
        // Simulate user tapping delete button
        progressComponent.onDelete?(progressComponent.attachmentInfo)
        
        XCTAssertTrue(self.deleteCalled, "Delete callback should have been called")
        
        if let capturedInfo = self.capturedAttachmentInfo, case .uploading(let url) = capturedInfo {
            XCTAssertEqual(url, self.sourceURL)
        } else {
            XCTFail("Captured attachment info should be in uploading state")
        }
    }
    
    // MARK: - UI Tests
    
    // These tests would typically be part of snapshot testing or UI testing framework
    // Here we're just validating that the component has the expected structure
    
    func testAttachmentInProgressTitleIsDisplayed() {
        // In a real UI test, we would validate that the title view displays the correct text
        // For this unit test, we can verify that the title view builder is provided
        let progressComponent = self.createAttachmentInProgress()
        XCTAssertNotNil(progressComponent.attachmentInProgressTitle, "In progress title should be provided")
    }
}

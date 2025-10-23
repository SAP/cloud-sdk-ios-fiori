@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class AttachmentWithErrorTests: XCTestCase {
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
        self.sourceURL = URL(fileURLWithPath: "/tmp/source_file.pdf")
    }
    
    override func tearDownWithError() throws {
        // Clean up
        self.sourceURL = nil
    }
    
    // MARK: - Test Helpers
    
    // Create a test instance of AttachmentWithError
    private func createAttachmentWithError(errorMessage: String = "Test error message") -> AttachmentWithError {
        let attachmentInfo = AttachmentInfo.error(sourceURL: self.sourceURL, message: errorMessage)
        
        return AttachmentWithError(
            attachmentErrorTitle: {
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
    
    func testInitWithErrorAttachment() {
        let errorComponent = self.createAttachmentWithError()
        
        if case .error(let url, let message) = errorComponent.attachmentInfo {
            XCTAssertEqual(url, self.sourceURL)
            XCTAssertEqual(message, "Test error message")
        } else {
            XCTFail("Expected error state but got \(errorComponent.attachmentInfo)")
        }
    }
    
    func testErrorAttachmentName() {
        let errorComponent = self.createAttachmentWithError()
        XCTAssertEqual(errorComponent.attachmentInfo.attachmentName, "source_file.pdf")
    }
    
    func testErrorMessageIsAvailable() {
        let customErrorMessage = "Network connection failed"
        let errorComponent = self.createAttachmentWithError(errorMessage: customErrorMessage)
        XCTAssertEqual(errorComponent.attachmentInfo.errorMessage, customErrorMessage)
    }
    
    // MARK: - Callback Tests
    
    func testOnPreviewCallback() {
        let errorComponent = self.createAttachmentWithError()
        
        // Simulate user tapping on the attachment to preview
        errorComponent.onPreview?(errorComponent.attachmentInfo)
        
        XCTAssertTrue(self.previewCalled, "Preview callback should have been called")
        
        if let capturedInfo = self.capturedAttachmentInfo, case .error(let url, _) = capturedInfo {
            XCTAssertEqual(url, self.sourceURL)
        } else {
            XCTFail("Captured attachment info should be in error state")
        }
    }
    
    func testOnDeleteCallback() {
        let errorComponent = self.createAttachmentWithError()
        
        // Simulate user tapping delete button
        errorComponent.onDelete?(errorComponent.attachmentInfo)
        
        XCTAssertTrue(self.deleteCalled, "Delete callback should have been called")
        
        if let capturedInfo = self.capturedAttachmentInfo, case .error(let url, _) = capturedInfo {
            XCTAssertEqual(url, self.sourceURL)
        } else {
            XCTFail("Captured attachment info should be in error state")
        }
    }
    
    // MARK: - UI Tests
    
    // These tests would typically be part of snapshot testing or UI testing framework
    // Here we're just validating that the component has the expected structure
    
    func testAttachmentErrorTitleIsDisplayed() {
        // In a real UI test, we would validate that the title view displays the correct text
        // For this unit test, we can verify that the title view builder is provided
        let errorComponent = self.createAttachmentWithError()
        XCTAssertNotNil(errorComponent.attachmentErrorTitle, "Error title should be provided")
    }
}

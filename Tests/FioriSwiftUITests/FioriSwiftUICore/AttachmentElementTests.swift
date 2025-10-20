@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class AttachmentElementTests: XCTestCase {
    // Test URLs and objects
    var sourceURL: URL!
    var destinationURL: URL!
    
    // Track callback invocations
    var previewCalled = false
    var deleteCalled = false
    var extraInfoUpdateCalled = false
    var capturedAttachmentInfo: AttachmentInfo?
    var capturedExtraInfo: TestAttachmentExtraInfo?
    
    override func setUpWithError() throws {
        // Reset flags before each test
        self.previewCalled = false
        self.deleteCalled = false
        self.extraInfoUpdateCalled = false
        self.capturedAttachmentInfo = nil
        self.capturedExtraInfo = nil
        
        // Create test URLs
        self.sourceURL = URL(fileURLWithPath: "/tmp/source_file.pdf")
        self.destinationURL = URL(fileURLWithPath: "/tmp/destination_file.pdf")
    }
    
    override func tearDownWithError() throws {
        // Clean up
        self.sourceURL = nil
        self.destinationURL = nil
    }
    
    // MARK: - Test Helpers
    
    // Custom extra info type for testing
    struct TestAttachmentExtraInfo: AttachmentExtraInfo, Equatable {
        let id: Int
        let name: String
    }
    
    // Create test instance of AttachmentElement with specified state
    private func createAttachmentElement(
        state: AttachmentElementTestState,
        controlState: ControlState = .normal
    ) -> AttachmentElement {
        let attachmentInfo: AttachmentInfo
        
        switch state {
        case .uploading:
            attachmentInfo = .uploading(sourceURL: self.sourceURL)
        case .uploaded:
            attachmentInfo = .uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL)
        case .uploadedWithExtraInfo:
            let extraInfo = TestAttachmentExtraInfo(id: 123, name: "Test")
            attachmentInfo = .uploaded(
                destinationURL: self.destinationURL,
                sourceURL: self.sourceURL,
                extraInfo: extraInfo
            )
        case .error:
            attachmentInfo = .error(sourceURL: self.sourceURL, message: "Test error message")
        }
        
        return AttachmentElement(
            attachmentInfo: attachmentInfo,
            controlState: controlState,
            onExtraInfoChange: { [weak self] extraInfo in
                self?.extraInfoUpdateCalled = true
                self?.capturedExtraInfo = extraInfo as? TestAttachmentExtraInfo
            },
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
    
    // States for testing
    enum AttachmentElementTestState {
        case uploading
        case uploaded
        case uploadedWithExtraInfo
        case error
    }
    
    // MARK: - Initialization Tests
    
    func testInitWithUploadingAttachment() {
        let element = self.createAttachmentElement(state: .uploading)
        
        if case .uploading(let url) = element.attachmentInfo {
            XCTAssertEqual(url, self.sourceURL)
        } else {
            XCTFail("Expected uploading state but got \(element.attachmentInfo)")
        }
        
        XCTAssertEqual(element.controlState, .normal)
    }
    
    func testInitWithUploadedAttachment() {
        let element = self.createAttachmentElement(state: .uploaded)
        
        if case .uploaded(let destURL, let srcURL, let extraInfo) = element.attachmentInfo {
            XCTAssertEqual(destURL, self.destinationURL)
            XCTAssertEqual(srcURL, self.sourceURL)
            XCTAssertNil(extraInfo)
        } else {
            XCTFail("Expected uploaded state but got \(element.attachmentInfo)")
        }
    }
    
    func testInitWithUploadedAttachmentWithExtraInfo() {
        let element = self.createAttachmentElement(state: .uploadedWithExtraInfo)
        
        if case .uploaded(let destURL, let srcURL, let extraInfo) = element.attachmentInfo {
            XCTAssertEqual(destURL, self.destinationURL)
            XCTAssertEqual(srcURL, self.sourceURL)
            XCTAssertNotNil(extraInfo)
            
            if let typedExtraInfo = extraInfo as? TestAttachmentExtraInfo {
                XCTAssertEqual(typedExtraInfo.id, 123)
                XCTAssertEqual(typedExtraInfo.name, "Test")
            } else {
                XCTFail("Extra info not of expected type")
            }
        } else {
            XCTFail("Expected uploaded state but got \(element.attachmentInfo)")
        }
    }
    
    func testInitWithErrorAttachment() {
        let element = self.createAttachmentElement(state: .error)
        
        if case .error(let url, let message) = element.attachmentInfo {
            XCTAssertEqual(url, self.sourceURL)
            XCTAssertEqual(message, "Test error message")
        } else {
            XCTFail("Expected error state but got \(element.attachmentInfo)")
        }
    }
    
    func testInitWithDifferentControlStates() {
        let normalElement = self.createAttachmentElement(state: .uploaded, controlState: .normal)
        XCTAssertEqual(normalElement.controlState, .normal)
        
        let disabledElement = self.createAttachmentElement(state: .uploaded, controlState: .disabled)
        XCTAssertEqual(disabledElement.controlState, .disabled)
        
        let readOnlyElement = self.createAttachmentElement(state: .uploaded, controlState: .readOnly)
        XCTAssertEqual(readOnlyElement.controlState, .readOnly)
    }
    
    // MARK: - Callback Tests
    
    func testOnPreviewCallback() {
        let element = self.createAttachmentElement(state: .uploaded)
        
        // Simulate user tapping on the attachment to preview
        element.onPreview?(element.attachmentInfo)
        
        XCTAssertTrue(self.previewCalled, "Preview callback should have been called")
        XCTAssertEqual(self.capturedAttachmentInfo?.id, self.destinationURL)
    }
    
    func testOnDeleteCallback() {
        let element = self.createAttachmentElement(state: .uploaded)
        
        // Simulate user tapping delete button
        element.onDelete?(element.attachmentInfo)
        
        XCTAssertTrue(self.deleteCalled, "Delete callback should have been called")
        XCTAssertEqual(self.capturedAttachmentInfo?.id, self.destinationURL)
    }
    
    func testOnExtraInfoChangeCallback() {
        let element = self.createAttachmentElement(state: .uploaded)
        let newExtraInfo = TestAttachmentExtraInfo(id: 456, name: "Updated")
        
        // Simulate updating extra info
        element.onExtraInfoChange?(newExtraInfo)
        
        XCTAssertTrue(self.extraInfoUpdateCalled, "Extra info update callback should have been called")
        XCTAssertEqual(self.capturedExtraInfo?.id, 456)
        XCTAssertEqual(self.capturedExtraInfo?.name, "Updated")
    }
    
    // MARK: - State-Specific Behavior Tests
    
    func testAttachmentNameFromPrimaryURL() {
        // For uploaded attachment, name should come from destination URL
        let uploadedElement = self.createAttachmentElement(state: .uploaded)
        XCTAssertEqual(uploadedElement.attachmentInfo.attachmentName, "destination_file.pdf")
        
        // For uploading attachment, name should come from source URL
        let uploadingElement = self.createAttachmentElement(state: .uploading)
        XCTAssertEqual(uploadingElement.attachmentInfo.attachmentName, "source_file.pdf")
        
        // For error attachment, name should come from source URL
        let errorElement = self.createAttachmentElement(state: .error)
        XCTAssertEqual(errorElement.attachmentInfo.attachmentName, "source_file.pdf")
    }
    
    func testErrorMessageOnlyAvailableForErrorState() {
        let uploadedElement = self.createAttachmentElement(state: .uploaded)
        XCTAssertNil(uploadedElement.attachmentInfo.errorMessage)
        
        let uploadingElement = self.createAttachmentElement(state: .uploading)
        XCTAssertNil(uploadingElement.attachmentInfo.errorMessage)
        
        let errorElement = self.createAttachmentElement(state: .error)
        XCTAssertEqual(errorElement.attachmentInfo.errorMessage, "Test error message")
    }
}

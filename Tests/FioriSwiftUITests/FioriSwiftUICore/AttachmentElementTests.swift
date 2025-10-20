import XCTest
import SwiftUI
@testable import FioriSwiftUICore

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
        previewCalled = false
        deleteCalled = false
        extraInfoUpdateCalled = false
        capturedAttachmentInfo = nil
        capturedExtraInfo = nil
        
        // Create test URLs
        sourceURL = URL(fileURLWithPath: "/tmp/source_file.pdf")
        destinationURL = URL(fileURLWithPath: "/tmp/destination_file.pdf")
    }
    
    override func tearDownWithError() throws {
        // Clean up
        sourceURL = nil
        destinationURL = nil
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
            attachmentInfo = .uploading(sourceURL: sourceURL)
        case .uploaded:
            attachmentInfo = .uploaded(destinationURL: destinationURL, sourceURL: sourceURL)
        case .uploadedWithExtraInfo:
            let extraInfo = TestAttachmentExtraInfo(id: 123, name: "Test")
            attachmentInfo = .uploaded(
                destinationURL: destinationURL,
                sourceURL: sourceURL,
                extraInfo: extraInfo
            )
        case .error:
            attachmentInfo = .error(sourceURL: sourceURL, message: "Test error message")
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
        let element = createAttachmentElement(state: .uploading)
        
        if case .uploading(let url) = element.attachmentInfo {
            XCTAssertEqual(url, sourceURL)
        } else {
            XCTFail("Expected uploading state but got \(element.attachmentInfo)")
        }
        
        XCTAssertEqual(element.controlState, .normal)
    }
    
    func testInitWithUploadedAttachment() {
        let element = createAttachmentElement(state: .uploaded)
        
        if case .uploaded(let destURL, let srcURL, let extraInfo) = element.attachmentInfo {
            XCTAssertEqual(destURL, destinationURL)
            XCTAssertEqual(srcURL, sourceURL)
            XCTAssertNil(extraInfo)
        } else {
            XCTFail("Expected uploaded state but got \(element.attachmentInfo)")
        }
    }
    
    func testInitWithUploadedAttachmentWithExtraInfo() {
        let element = createAttachmentElement(state: .uploadedWithExtraInfo)
        
        if case .uploaded(let destURL, let srcURL, let extraInfo) = element.attachmentInfo {
            XCTAssertEqual(destURL, destinationURL)
            XCTAssertEqual(srcURL, sourceURL)
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
        let element = createAttachmentElement(state: .error)
        
        if case .error(let url, let message) = element.attachmentInfo {
            XCTAssertEqual(url, sourceURL)
            XCTAssertEqual(message, "Test error message")
        } else {
            XCTFail("Expected error state but got \(element.attachmentInfo)")
        }
    }
    
    func testInitWithDifferentControlStates() {
        let normalElement = createAttachmentElement(state: .uploaded, controlState: .normal)
        XCTAssertEqual(normalElement.controlState, .normal)
        
        let disabledElement = createAttachmentElement(state: .uploaded, controlState: .disabled)
        XCTAssertEqual(disabledElement.controlState, .disabled)
        
        let readOnlyElement = createAttachmentElement(state: .uploaded, controlState: .readOnly)
        XCTAssertEqual(readOnlyElement.controlState, .readOnly)
    }
    
    // MARK: - Callback Tests
    
    func testOnPreviewCallback() {
        let element = createAttachmentElement(state: .uploaded)
        
        // Simulate user tapping on the attachment to preview
        element.onPreview?(element.attachmentInfo)
        
        XCTAssertTrue(previewCalled, "Preview callback should have been called")
        XCTAssertEqual(capturedAttachmentInfo?.id, destinationURL)
    }
    
    func testOnDeleteCallback() {
        let element = createAttachmentElement(state: .uploaded)
        
        // Simulate user tapping delete button
        element.onDelete?(element.attachmentInfo)
        
        XCTAssertTrue(deleteCalled, "Delete callback should have been called")
        XCTAssertEqual(capturedAttachmentInfo?.id, destinationURL)
    }
    
    func testOnExtraInfoChangeCallback() {
        let element = createAttachmentElement(state: .uploaded)
        let newExtraInfo = TestAttachmentExtraInfo(id: 456, name: "Updated")
        
        // Simulate updating extra info
        element.onExtraInfoChange?(newExtraInfo)
        
        XCTAssertTrue(extraInfoUpdateCalled, "Extra info update callback should have been called")
        XCTAssertEqual(capturedExtraInfo?.id, 456)
        XCTAssertEqual(capturedExtraInfo?.name, "Updated")
    }
    
    // MARK: - State-Specific Behavior Tests
    
    func testAttachmentNameFromPrimaryURL() {
        // For uploaded attachment, name should come from destination URL
        let uploadedElement = createAttachmentElement(state: .uploaded)
        XCTAssertEqual(uploadedElement.attachmentInfo.attachmentName, "destination_file.pdf")
        
        // For uploading attachment, name should come from source URL
        let uploadingElement = createAttachmentElement(state: .uploading)
        XCTAssertEqual(uploadingElement.attachmentInfo.attachmentName, "source_file.pdf")
        
        // For error attachment, name should come from source URL
        let errorElement = createAttachmentElement(state: .error)
        XCTAssertEqual(errorElement.attachmentInfo.attachmentName, "source_file.pdf")
    }
    
    func testErrorMessageOnlyAvailableForErrorState() {
        let uploadedElement = createAttachmentElement(state: .uploaded)
        XCTAssertNil(uploadedElement.attachmentInfo.errorMessage)
        
        let uploadingElement = createAttachmentElement(state: .uploading)
        XCTAssertNil(uploadingElement.attachmentInfo.errorMessage)
        
        let errorElement = createAttachmentElement(state: .error)
        XCTAssertEqual(errorElement.attachmentInfo.errorMessage, "Test error message")
    }
}

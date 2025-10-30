@testable import FioriSwiftUICore
import XCTest

final class AttachmentInfoArrayTests: XCTestCase {
    // Helper properties for creating consistent test data
    var sourceURL: URL!
    var destinationURL: URL!
    var destinationURL2: URL!
    
    override func setUpWithError() throws {
        // Create test URLs that we'll use in multiple tests
        self.sourceURL = URL(fileURLWithPath: "/tmp/source_file.pdf")
        self.destinationURL = URL(fileURLWithPath: "/tmp/destination_file.pdf")
        self.destinationURL2 = URL(fileURLWithPath: "/tmp/destination_file2.pdf")
    }
    
    // MARK: - isUploading Tests
    
    func testIsUploadingWithNoUploadingAttachments() {
        // Create an array with no uploading attachments
        let attachments = [
            AttachmentInfo.uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Error")
        ]
        
        // The isUploading property should be false
        XCTAssertFalse(attachments.isUploading, "Array with no uploading attachments should return false for isUploading")
    }
    
    func testIsUploadingWithUploadingAttachment() {
        // Create an array with one uploading attachment
        let attachments = [
            AttachmentInfo.uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL),
            AttachmentInfo.uploading(sourceURL: self.sourceURL),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Error")
        ]
        
        // The isUploading property should be true
        XCTAssertTrue(attachments.isUploading, "Array with an uploading attachment should return true for isUploading")
    }
    
    func testIsUploadingWithEmptyArray() {
        // An empty array should not be uploading
        let emptyArray: [AttachmentInfo] = []
        XCTAssertFalse(emptyArray.isUploading, "Empty array should return false for isUploading")
    }
    
    // MARK: - hasError Tests
    
    func testHasErrorWithNoErrorAttachments() {
        // Create an array with no error attachments
        let attachments = [
            AttachmentInfo.uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL),
            AttachmentInfo.uploading(sourceURL: self.sourceURL)
        ]
        
        // The hasError property should be false
        XCTAssertFalse(attachments.hasError, "Array with no error attachments should return false for hasError")
    }
    
    func testHasErrorWithErrorAttachment() {
        // Create an array with one error attachment
        let attachments = [
            AttachmentInfo.uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Network error")
        ]
        
        // The hasError property should be true
        XCTAssertTrue(attachments.hasError, "Array with an error attachment should return true for hasError")
    }
    
    func testHasErrorWithEmptyArray() {
        // An empty array should not have errors
        let emptyArray: [AttachmentInfo] = []
        XCTAssertFalse(emptyArray.hasError, "Empty array should return false for hasError")
    }
    
    func testHasErrorWithMultipleErrorAttachments() {
        // Create an array with multiple error attachments
        let attachments = [
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Network error"),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Server error")
        ]
        
        // The hasError property should be true
        XCTAssertTrue(attachments.hasError, "Array with multiple error attachments should return true for hasError")
    }
    
    // MARK: - hasAttachmentsMoreThan Tests
    
    func testHasAttachmentsMoreThanWithNoUploaded() {
        // Create an array with no uploaded attachments
        let attachments = [
            AttachmentInfo.uploading(sourceURL: self.sourceURL),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Error")
        ]
        
        // Should not have more than 0 uploaded attachments
        XCTAssertFalse(attachments.hasAttachmentsMoreThan(0), "Array with no uploaded attachments should not have more than 0")
    }
    
    func testHasAttachmentsMoreThanWithSomeUploaded() {
        // Create an array with 2 uploaded attachments and 1 uploading
        let attachments = [
            AttachmentInfo.uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL),
            AttachmentInfo.uploading(sourceURL: self.sourceURL),
            AttachmentInfo.uploaded(destinationURL: self.destinationURL2, sourceURL: self.sourceURL)
        ]
        
        // Should have more than 0 uploaded attachments
        XCTAssertTrue(attachments.hasAttachmentsMoreThan(0), "Array with 2 uploaded attachments should have more than 0")
        
        // Should have more than 1 uploaded attachment
        XCTAssertTrue(attachments.hasAttachmentsMoreThan(1), "Array with 2 uploaded attachments should have more than 1")
        
        // Should not have more than 2 uploaded attachments
        XCTAssertFalse(attachments.hasAttachmentsMoreThan(2), "Array with 2 uploaded attachments should not have more than 2")
        
        // Should not have more than 3 uploaded attachments
        XCTAssertFalse(attachments.hasAttachmentsMoreThan(3), "Array with 2 uploaded attachments should not have more than 3")
    }
    
    func testHasAttachmentsMoreThanWithEmptyArray() {
        let emptyArray: [AttachmentInfo] = []
        
        // Should not have more than 0 uploaded attachments
        XCTAssertFalse(emptyArray.hasAttachmentsMoreThan(0), "Empty array should not have more than 0 uploaded attachments")
    }
    
    func testHasAttachmentsMoreThanWithNegativeCount() {
        // Create an array with 1 uploaded attachment
        let attachments = [
            AttachmentInfo.uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL)
        ]
        
        // Should have more than -1 uploaded attachments
        XCTAssertTrue(attachments.hasAttachmentsMoreThan(-1), "Array with 1 uploaded attachment should have more than -1")
    }
    
    // MARK: - firstIndexOfUploaded Tests
    
    func testFirstIndexOfUploadedWithMatchingURL() {
        // Create an array with a mix of attachment states
        let destination1 = URL(fileURLWithPath: "/tmp/file1.pdf")
        let destination2 = URL(fileURLWithPath: "/tmp/file2.pdf")
        
        let attachments = [
            AttachmentInfo.uploading(sourceURL: self.sourceURL),
            AttachmentInfo.uploaded(destinationURL: destination1, sourceURL: self.sourceURL),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Error"),
            AttachmentInfo.uploaded(destinationURL: destination2, sourceURL: self.sourceURL)
        ]
        
        // Should find first uploaded with destination1
        XCTAssertEqual(attachments.firstIndexOfUploaded(destinationURL: destination1), 1, "Should find first uploaded attachment with destination1 at index 1")
        
        // Should find first uploaded with destination2
        XCTAssertEqual(attachments.firstIndexOfUploaded(destinationURL: destination2), 3, "Should find first uploaded attachment with destination2 at index 3")
    }
    
    func testFirstIndexOfUploadedWithNonMatchingURL() {
        // Create an array with a mix of attachment states
        let destination1 = URL(fileURLWithPath: "/tmp/file1.pdf")
        let nonMatchingURL = URL(fileURLWithPath: "/tmp/nonexistent.pdf")
        
        let attachments = [
            AttachmentInfo.uploading(sourceURL: self.sourceURL),
            AttachmentInfo.uploaded(destinationURL: destination1, sourceURL: self.sourceURL),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Error")
        ]
        
        // Should not find uploaded with non-matching URL
        XCTAssertNil(attachments.firstIndexOfUploaded(destinationURL: nonMatchingURL), "Should not find index for non-matching destination URL")
    }
    
    func testFirstIndexOfUploadedWithEmptyArray() {
        let emptyArray: [AttachmentInfo] = []
        let destination = URL(fileURLWithPath: "/tmp/file.pdf")
        
        // Should not find uploaded in empty array
        XCTAssertNil(emptyArray.firstIndexOfUploaded(destinationURL: destination), "Should not find index in empty array")
    }
    
    func testFirstIndexOfUploadedWithMultipleMatches() {
        // Create an array with multiple attachments with the same destination URL
        let destination = URL(fileURLWithPath: "/tmp/file.pdf")
        
        let attachments = [
            AttachmentInfo.uploading(sourceURL: self.sourceURL),
            AttachmentInfo.uploaded(destinationURL: destination, sourceURL: self.sourceURL),
            AttachmentInfo.error(sourceURL: self.sourceURL, message: "Error"),
            AttachmentInfo.uploaded(destinationURL: destination, sourceURL: self.sourceURL)
        ]
        
        // Should find first uploaded with matching destination
        XCTAssertEqual(attachments.firstIndexOfUploaded(destinationURL: destination), 1, "Should return first matching index (1) when multiple matches exist")
    }
    
    func testFirstIndexOfUploadedWithSourceURL() {
        // Create an array where source and destination URLs might be confused
        let attachments = [
            AttachmentInfo.uploading(sourceURL: self.sourceURL),
            AttachmentInfo.uploaded(destinationURL: self.destinationURL, sourceURL: self.sourceURL)
        ]
        
        // Should not find uploaded with source URL (only searches destination URLs)
        XCTAssertNil(attachments.firstIndexOfUploaded(destinationURL: self.sourceURL), "Should not match on source URL when searching for destination URL")
    }
}

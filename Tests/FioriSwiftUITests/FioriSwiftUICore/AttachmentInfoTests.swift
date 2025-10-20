@testable import FioriSwiftUICore
import SwiftUI
import XCTest

/// Custom type conforming to AttachmentExtraInfo for testing purposes
struct TestExtraInfo: AttachmentExtraInfo {
    let id: Int
    let description: String
}

final class AttachmentInfoTests: XCTestCase {
    // Helper function to create test URLs
    func createTestURLs() -> (sourceURL: URL, destinationURL: URL) {
        let sourceURL = URL(fileURLWithPath: "/tmp/source_file.pdf")
        let destinationURL = URL(fileURLWithPath: "/tmp/destination_file.pdf")
        return (sourceURL, destinationURL)
    }
    
    // MARK: - Base Case Tests
    
    func testUploadingCase() {
        let (sourceURL, _) = self.createTestURLs()
        let info = AttachmentInfo.uploading(sourceURL: sourceURL)
        
        // Verify the enum case and associated value
        if case .uploading(let url) = info {
            XCTAssertEqual(url, sourceURL)
        } else {
            XCTFail("Expected .uploading case but got \(info)")
        }
    }
    
    func testUploadedCase() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        let info = AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL)
        
        // Verify the enum case and associated values
        if case .uploaded(let destURL, let srcURL, let extraInfo) = info {
            XCTAssertEqual(destURL, destinationURL)
            XCTAssertEqual(srcURL, sourceURL)
            XCTAssertNil(extraInfo)
        } else {
            XCTFail("Expected .uploaded case but got \(info)")
        }
    }
    
    func testUploadedCaseWithExtraInfo() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        let extraInfo = TestExtraInfo(id: 123, description: "Test attachment")
        let info = AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL, extraInfo: extraInfo)
        
        // Verify the enum case and associated values including extraInfo
        if case .uploaded(let destURL, let srcURL, let extra) = info {
            XCTAssertEqual(destURL, destinationURL)
            XCTAssertEqual(srcURL, sourceURL)
            XCTAssertNotNil(extra)
            
            if let castedExtra = extra as? TestExtraInfo {
                XCTAssertEqual(castedExtra.id, 123)
                XCTAssertEqual(castedExtra.description, "Test attachment")
            } else {
                XCTFail("Extra info couldn't be casted to TestExtraInfo")
            }
        } else {
            XCTFail("Expected .uploaded case but got \(info)")
        }
    }
    
    func testErrorCase() {
        let (sourceURL, _) = self.createTestURLs()
        let errorMessage = "Network connection failed"
        let info = AttachmentInfo.error(sourceURL: sourceURL, message: errorMessage)
        
        // Verify the enum case and associated values
        if case .error(let url, let message) = info {
            XCTAssertEqual(url, sourceURL)
            XCTAssertEqual(message, errorMessage)
        } else {
            XCTFail("Expected .error case but got \(info)")
        }
    }
    
    // MARK: - Identifiable Conformance Tests
    
    func testIdentifiableUploading() {
        let (sourceURL, _) = self.createTestURLs()
        let info = AttachmentInfo.uploading(sourceURL: sourceURL)
        
        // For uploading, id should be the source URL
        XCTAssertEqual(info.id, sourceURL)
    }
    
    func testIdentifiableUploaded() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        let info = AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL)
        
        // For uploaded, id should be the destination URL
        XCTAssertEqual(info.id, destinationURL)
    }
    
    func testIdentifiableError() {
        let (sourceURL, _) = self.createTestURLs()
        let info = AttachmentInfo.error(sourceURL: sourceURL, message: "Error")
        
        // For error, id should be the source URL
        XCTAssertEqual(info.id, sourceURL)
    }
    
    // MARK: - Hashable Conformance Tests
    
    func testEquality() {
        let (sourceURL1, destinationURL1) = self.createTestURLs()
        let (sourceURL2, _) = (
            URL(fileURLWithPath: "/tmp/other_source.pdf"),
            URL(fileURLWithPath: "/tmp/other_destination.pdf")
        )
        
        // Same case with same values should be equal
        XCTAssertEqual(
            AttachmentInfo.uploading(sourceURL: sourceURL1),
            AttachmentInfo.uploading(sourceURL: sourceURL1)
        )
        
        XCTAssertEqual(
            AttachmentInfo.uploaded(destinationURL: destinationURL1, sourceURL: sourceURL1),
            AttachmentInfo.uploaded(destinationURL: destinationURL1, sourceURL: sourceURL1)
        )
        
        XCTAssertEqual(
            AttachmentInfo.error(sourceURL: sourceURL1, message: "Error"),
            AttachmentInfo.error(sourceURL: sourceURL1, message: "Error")
        )
        
        // Different cases should not be equal
        XCTAssertNotEqual(
            AttachmentInfo.uploading(sourceURL: sourceURL1),
            AttachmentInfo.error(sourceURL: sourceURL1, message: "Error")
        )
        
        XCTAssertNotEqual(
            AttachmentInfo.uploading(sourceURL: sourceURL1),
            AttachmentInfo.uploaded(destinationURL: destinationURL1, sourceURL: sourceURL1)
        )
        
        // Same case with different values should not be equal
        XCTAssertNotEqual(
            AttachmentInfo.uploading(sourceURL: sourceURL1),
            AttachmentInfo.uploading(sourceURL: sourceURL2)
        )
        
        XCTAssertNotEqual(
            AttachmentInfo.error(sourceURL: sourceURL1, message: "Error1"),
            AttachmentInfo.error(sourceURL: sourceURL1, message: "Error2")
        )
    }
    
    func testEqualityWithExtraInfo() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        
        let info1 = AttachmentInfo.uploaded(
            destinationURL: destinationURL,
            sourceURL: sourceURL,
            extraInfo: TestExtraInfo(id: 123, description: "Test")
        )
        
        let info2 = AttachmentInfo.uploaded(
            destinationURL: destinationURL,
            sourceURL: sourceURL,
            extraInfo: TestExtraInfo(id: 123, description: "Test")
        )
        
        let info3 = AttachmentInfo.uploaded(
            destinationURL: destinationURL,
            sourceURL: sourceURL,
            extraInfo: TestExtraInfo(id: 456, description: "Different")
        )
        
        // Same extraInfo should be equal
        XCTAssertEqual(info1, info2)
        
        // Different extraInfo should not be equal
        XCTAssertNotEqual(info1, info3)
    }
    
    func testHashIntoWithDifferentCases() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        
        let uploading = AttachmentInfo.uploading(sourceURL: sourceURL)
        let uploaded = AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL)
        let error = AttachmentInfo.error(sourceURL: sourceURL, message: "Error")
        
        // Different cases should produce different hash values
        var set = Set<AttachmentInfo>()
        set.insert(uploading)
        set.insert(uploaded)
        set.insert(error)
        
        XCTAssertEqual(set.count, 3)
    }
    
    // MARK: - Utility Property Tests
    
    func testPrimaryURL() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        
        let uploading = AttachmentInfo.uploading(sourceURL: sourceURL)
        let uploaded = AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL)
        let error = AttachmentInfo.error(sourceURL: sourceURL, message: "Error")
        
        // For uploading and error, primaryURL should be sourceURL
        XCTAssertEqual(uploading.primaryURL, sourceURL)
        XCTAssertEqual(error.primaryURL, sourceURL)
        
        // For uploaded, primaryURL should be destinationURL
        XCTAssertEqual(uploaded.primaryURL, destinationURL)
    }
    
    func testAttachmentName() {
        let sourceURL = URL(fileURLWithPath: "/tmp/myDocument.pdf")
        let destinationURL = URL(fileURLWithPath: "/uploads/finalDocument.pdf")
        
        let uploading = AttachmentInfo.uploading(sourceURL: sourceURL)
        let uploaded = AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL)
        let error = AttachmentInfo.error(sourceURL: sourceURL, message: "Error")
        
        // Attachment name should be the last path component of the primary URL
        XCTAssertEqual(uploading.attachmentName, "myDocument.pdf")
        XCTAssertEqual(uploaded.attachmentName, "finalDocument.pdf")
        XCTAssertEqual(error.attachmentName, "myDocument.pdf")
    }
    
    func testErrorMessage() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        
        let uploading = AttachmentInfo.uploading(sourceURL: sourceURL)
        let uploaded = AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL)
        let error = AttachmentInfo.error(sourceURL: sourceURL, message: "Network connection failed")
        
        // Only error case should have a non-nil error message
        XCTAssertNil(uploading.errorMessage)
        XCTAssertNil(uploaded.errorMessage)
        XCTAssertEqual(error.errorMessage, "Network connection failed")
    }
    
    // MARK: - Array Extension Tests
    
    func testArrayIsUploading() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        
        // Array with no uploading attachments
        let noUploading = [
            AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL),
            AttachmentInfo.error(sourceURL: sourceURL, message: "Error")
        ]
        XCTAssertFalse(noUploading.isUploading)
        
        // Array with at least one uploading attachment
        let hasUploading = [
            AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL),
            AttachmentInfo.uploading(sourceURL: sourceURL),
            AttachmentInfo.error(sourceURL: sourceURL, message: "Error")
        ]
        XCTAssertTrue(hasUploading.isUploading)
    }
    
    func testArrayHasError() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        
        // Array with no error attachments
        let noErrors = [
            AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL),
            AttachmentInfo.uploading(sourceURL: sourceURL)
        ]
        XCTAssertFalse(noErrors.hasError)
        
        // Array with at least one error attachment
        let hasErrors = [
            AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL),
            AttachmentInfo.error(sourceURL: sourceURL, message: "Error")
        ]
        XCTAssertTrue(hasErrors.hasError)
    }
    
    func testArrayHasAttachmentsMoreThan() {
        let (sourceURL, destinationURL) = self.createTestURLs()
        let altDestinationURL = URL(fileURLWithPath: "/tmp/another_file.pdf")
        
        // Create array with 2 uploaded attachments and 1 uploading
        let attachments = [
            AttachmentInfo.uploaded(destinationURL: destinationURL, sourceURL: sourceURL),
            AttachmentInfo.uploading(sourceURL: sourceURL),
            AttachmentInfo.uploaded(destinationURL: altDestinationURL, sourceURL: sourceURL)
        ]
        
        // Should have more than 0 uploaded attachments
        XCTAssertTrue(attachments.hasAttachmentsMoreThan(0))
        
        // Should have more than 1 uploaded attachments
        XCTAssertTrue(attachments.hasAttachmentsMoreThan(1))
        
        // Should not have more than 2 uploaded attachments
        XCTAssertFalse(attachments.hasAttachmentsMoreThan(2))
        
        // Should not have more than 3 uploaded attachments
        XCTAssertFalse(attachments.hasAttachmentsMoreThan(3))
    }
    
    func testArrayFirstIndexOfUploaded() {
        let (sourceURL, _) = self.createTestURLs()
        let destination1 = URL(fileURLWithPath: "/tmp/file1.pdf")
        let destination2 = URL(fileURLWithPath: "/tmp/file2.pdf")
        let destination3 = URL(fileURLWithPath: "/tmp/file3.pdf")
        
        let attachments = [
            AttachmentInfo.uploading(sourceURL: sourceURL),
            AttachmentInfo.uploaded(destinationURL: destination1, sourceURL: sourceURL),
            AttachmentInfo.error(sourceURL: sourceURL, message: "Error"),
            AttachmentInfo.uploaded(destinationURL: destination2, sourceURL: sourceURL)
        ]
        
        // Should find first uploaded with destination1
        XCTAssertEqual(attachments.firstIndexOfUploaded(destinationURL: destination1), 1)
        
        // Should find first uploaded with destination2
        XCTAssertEqual(attachments.firstIndexOfUploaded(destinationURL: destination2), 3)
        
        // Should not find uploaded with destination3
        XCTAssertNil(attachments.firstIndexOfUploaded(destinationURL: destination3))
        
        // Should not find uploaded with sourceURL
        XCTAssertNil(attachments.firstIndexOfUploaded(destinationURL: sourceURL))
    }
}

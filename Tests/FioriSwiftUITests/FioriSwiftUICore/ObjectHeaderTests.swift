@testable import FioriSwiftUICore
import FioriThemeManager
import SwiftUI
import XCTest

final class ObjectHeaderTests: XCTestCase {
    // MARK: - Basic Initialization Tests
    
    func testObjectHeader_DefaultInitialization() {
        // Given/When
        let objectHeader = ObjectHeader(title: { Text("Test Title") })
        
        // Then
        XCTAssertNotNil(objectHeader)
        XCTAssertEqual(objectHeader.componentIdentifier, ObjectHeader.identifier)
    }
    
    func testObjectHeader_InitializationWithAttributedString() {
        // Given
        let title = AttributedString("Test Title")
        
        // When
        let objectHeader = ObjectHeader(title: title)
        
        // Then
        XCTAssertNotNil(objectHeader)
        XCTAssertEqual(objectHeader.componentIdentifier, ObjectHeader.identifier)
    }
    
    func testObjectHeader_InitializationWithTitleAndSubtitle() {
        // Given
        let title = AttributedString("Test Title")
        let subtitle = AttributedString("Test Subtitle")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            subtitle: subtitle
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_InitializationWithAllParameters() {
        // Given
        let title = AttributedString("Test Title")
        let subtitle = AttributedString("Test Subtitle")
        let tags = [AttributedString("Tag1"), AttributedString("Tag2")]
        let bodyText = AttributedString("Body Text")
        let footnote = AttributedString("Footnote")
        let descriptionText = AttributedString("Description")
        let status = TextOrIcon.text("High Priority")
        let substatus = TextOrIcon.text("Scheduled")
        let detailImage = Image(systemName: "person")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            subtitle: subtitle,
            tags: tags,
            bodyText: bodyText,
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: substatus,
            detailImage: detailImage,
            detailContent: { Text("Detail Content") }
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
        XCTAssertEqual(objectHeader.componentIdentifier, ObjectHeader.identifier)
    }
    
    // MARK: - ViewBuilder Initialization Tests
    
    func testObjectHeader_ViewBuilderInitialization() {
        // Given/When
        let objectHeader = ObjectHeader(
            title: { Text("Title") },
            subtitle: { Text("Subtitle") },
            tags: { Text("Tag1") },
            bodyText: { Text("Body") },
            footnote: { Text("Footnote") },
            descriptionText: { Text("Description") },
            status: { Text("Status") },
            substatus: { Text("Substatus") },
            detailImage: { Image(systemName: "person") },
            detailContent: { Text("Detail") }
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
        XCTAssertEqual(objectHeader.componentIdentifier, ObjectHeader.identifier)
    }
    
    func testObjectHeader_ViewBuilderWithEmptyViews() {
        // Given/When
        let objectHeader = ObjectHeader(
            title: { Text("Title Only") }
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    // MARK: - Status and Substatus Tests
    
    func testObjectHeader_StatusWithText() {
        // Given
        let title = AttributedString("Test Title")
        let status = TextOrIcon.text("High Priority")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            status: status
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_StatusWithIcon() {
        // Given
        let title = AttributedString("Test Title")
        let status = TextOrIcon.icon(Image(systemName: "exclamationmark.triangle"))
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            status: status
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_StatusWithBoth() {
        // Given
        let title = AttributedString("Test Title")
        let status = TextOrIcon.both("Priority", Image(systemName: "exclamationmark.triangle"))
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            status: status
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_SubstatusWithText() {
        // Given
        let title = AttributedString("Test Title")
        let substatus = TextOrIcon.text("Scheduled")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            substatus: substatus
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_SubstatusWithIcon() {
        // Given
        let title = AttributedString("Test Title")
        let substatus = TextOrIcon.icon(Image(systemName: "clock"))
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            substatus: substatus
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    // MARK: - Tags Tests
    
    func testObjectHeader_WithSingleTag() {
        // Given
        let title = AttributedString("Test Title")
        let tags = [AttributedString("Tag1")]
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            tags: tags
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_WithMultipleTags() {
        // Given
        let title = AttributedString("Test Title")
        let tags = [
            AttributedString("Started"),
            AttributedString("PM01"),
            AttributedString("103-Repair")
        ]
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            tags: tags
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_WithEmptyTags() {
        // Given
        let title = AttributedString("Test Title")
        let tags: [AttributedString] = []
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            tags: tags
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    // MARK: - Detail Image Tests
    
    func testObjectHeader_WithSystemImage() {
        // Given
        let title = AttributedString("Test Title")
        let detailImage = Image(systemName: "person.circle")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            detailImage: detailImage
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_WithoutDetailImage() {
        // Given
        let title = AttributedString("Test Title")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            detailImage: nil
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    // MARK: - Detail Content Tests
    
    func testObjectHeader_WithDetailContent() {
        // Given/When
        let objectHeader = ObjectHeader(
            title: { Text("Test Title") },
            detailContent: {
                VStack {
                    Text("Line 1")
                    Text("Line 2")
                }
            }
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_WithEmptyDetailContent() {
        // Given/When
        let objectHeader = ObjectHeader(
            title: { Text("Test Title") },
            detailContent: { EmptyView() }
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    // MARK: - Configuration Tests
    
    func testObjectHeader_InitializationFromConfiguration() {
        // Given
        let configuration = ObjectHeaderConfiguration(
            componentIdentifier: ObjectHeader.identifier,
            title: ConfigurationViewWrapper(Text("Test Title")),
            subtitle: ConfigurationViewWrapper(Text("Test Subtitle")),
            tags: ConfigurationViewWrapper(Text("Tag1")),
            bodyText: ConfigurationViewWrapper(Text("Body")),
            footnote: ConfigurationViewWrapper(Text("Footnote")),
            descriptionText: ConfigurationViewWrapper(Text("Description")),
            status: ConfigurationViewWrapper(Text("Status")),
            substatus: ConfigurationViewWrapper(Text("Substatus")),
            detailImage: ConfigurationViewWrapper(Image(systemName: "person")),
            detailContent: ConfigurationViewWrapper(Text("Detail"))
        )
        
        // When
        let objectHeader = ObjectHeader(configuration)
        
        // Then
        XCTAssertNotNil(objectHeader)
        XCTAssertEqual(objectHeader.componentIdentifier, configuration.componentIdentifier)
    }
    
    // MARK: - Component Identifier Tests
    
    func testObjectHeader_DefaultComponentIdentifier() {
        // Given/When
        let objectHeader = ObjectHeader(title: { Text("Test Title") })
        
        // Then
        XCTAssertEqual(objectHeader.componentIdentifier, ObjectHeader.identifier)
        XCTAssertEqual(ObjectHeader.identifier, "fiori_objectheader_component")
    }
    
    func testObjectHeader_CustomComponentIdentifier() {
        // Given
        let customIdentifier = "custom_object_header"
        
        // When
        let objectHeader = ObjectHeader(
            title: { Text("Test Title") },
            componentIdentifier: customIdentifier
        )
        
        // Then
        XCTAssertEqual(objectHeader.componentIdentifier, customIdentifier)
    }
    
    // MARK: - Complex Scenarios Tests
    
    func testObjectHeader_ComplexJobScenario() {
        // Given
        let title = AttributedString("Inspect Electric Pump Motor Long Job Title Example")
        let subtitle = AttributedString("Job 819701")
        let tags = [AttributedString("Started"), AttributedString("PM01"), AttributedString("103-Repair")]
        let bodyText = AttributedString("1000-Hamburg, MECHANIK")
        let footnote = AttributedString("Due on 12/31/16")
        let descriptionText = AttributedString("Temperature sensor predicts overheating failure in 4 days")
        let status = TextOrIcon.text("Very High Priority")
        let substatus = TextOrIcon.text("Scheduled")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            subtitle: subtitle,
            tags: tags,
            bodyText: bodyText,
            footnote: footnote,
            descriptionText: descriptionText,
            status: status,
            substatus: substatus
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_WithImageAndStatus() {
        // Given
        let title = AttributedString("Test Title")
        let subtitle = AttributedString("Test Subtitle")
        let bodyText = AttributedString("Test Body")
        let status = TextOrIcon.icon(Image(systemName: "exclamationmark.square.fill"))
        let substatus = TextOrIcon.text("High Priority")
        let detailImage = Image(systemName: "person")
        
        // When
        let objectHeader = ObjectHeader(
            title: title,
            subtitle: subtitle,
            bodyText: bodyText,
            status: status,
            substatus: substatus,
            detailImage: detailImage
        )
        
        // Then
        XCTAssertNotNil(objectHeader)
    }
    
    func testObjectHeader_MinimalConfiguration() {
        // Given
        let title = AttributedString("Minimal Title")
        
        // When
        let objectHeader = ObjectHeader(title: title)
        
        // Then
        XCTAssertNotNil(objectHeader)
        XCTAssertEqual(objectHeader.componentIdentifier, ObjectHeader.identifier)
    }
    
    // MARK: - View Rendering Tests
    
    func testObjectHeader_AsView() {
        // Given
        let objectHeader = ObjectHeader(
            title: { Text("Test Title") },
            subtitle: { Text("Test Subtitle") }
        )
        
        // When
        let view = objectHeader as any View
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testObjectHeader_ConformsToView() {
        // Given
        let objectHeader = ObjectHeader(title: { Text("Test Title") })
        
        // When
        let mirror = Mirror(reflecting: objectHeader)
        
        // Then
        XCTAssertNotNil(mirror)
        // ObjectHeader conforms to View protocol
        XCTAssertNotNil(objectHeader.body)
    }
}

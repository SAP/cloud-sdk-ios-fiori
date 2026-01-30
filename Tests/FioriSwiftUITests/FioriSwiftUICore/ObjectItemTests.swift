@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class ObjectItemTests: XCTestCase {
    // MARK: - Basic Initialization Tests
    
    func testObjectItem_DefaultInitialization() {
        // Given/When
        let objectItem = ObjectItem(title: { Text("Title") })
        
        // Then
        XCTAssertNotNil(objectItem)
        XCTAssertEqual(objectItem.componentIdentifier, "fiori_objectitem_component")
        XCTAssertFalse(objectItem.showsDescriptionInCompact)
    }
    
    func testObjectItem_InitializationWithAttributedStringOnlyTitle() {
        // Given
        let title = AttributedString("Title")
        
        // When
        let objectItem = ObjectItem(title: title)
        
        // Then
        XCTAssertNotNil(objectItem)
        XCTAssertEqual(objectItem.componentIdentifier, "fiori_objectitem_component")
        XCTAssertFalse(objectItem.showsDescriptionInCompact)
    }
    
    func testObjectItem_InitializationWithTitleAndSubtitle() {
        // Given
        let title = AttributedString("Title")
        let subtitle = AttributedString("Subtitle")
        
        // When
        let objectItem = ObjectItem(title: title, subtitle: subtitle)
        
        // Then
        XCTAssertNotNil(objectItem)
    }
    
    func testObjectItem_InitializationWithAllParameters_AttributedInit() {
        // Given
        let title = AttributedString("Title")
        let subtitle = AttributedString("Subtitle")
        let footnote = AttributedString("Footnote")
        let description = AttributedString("Description")
        let status: TextOrIcon = .text(AttributedString("Status"))
        let substatus: TextOrIcon = .icon(Image(systemName: "clock"))
        let detailImage = Image(systemName: "person")
        let icons: [TextOrIcon] = [.icon(Image(systemName: "star")), .text(AttributedString("i"))]
        let avatars: [TextOrIcon] = [.icon(Image(systemName: "person.circle"))]
        let footnoteIcons: [TextOrIcon] = [.icon(Image(systemName: "info.circle"))]
        let footnoteIconsText = AttributedString("More info")
        let tags: [AttributedString] = ["t1", "t2"].map { AttributedString($0) }
        let action = FioriButton(title: AttributedString("Action"))
        let objectItemButton = FioriButton(title: AttributedString("Accessory"))
        
        // When
        let objectItem = ObjectItem(
            title: title,
            subtitle: subtitle,
            footnote: footnote,
            description: description,
            status: status,
            substatus: substatus,
            detailImage: detailImage,
            icons: icons,
            avatars: avatars,
            footnoteIcons: footnoteIcons,
            footnoteIconsText: footnoteIconsText,
            tags: tags,
            action: action,
            objectItemButton: objectItemButton,
            showsDescriptionInCompact: true
        )
        
        // Then
        XCTAssertNotNil(objectItem)
        XCTAssertTrue(objectItem.showsDescriptionInCompact)
    }
    
    // MARK: - ViewBuilder Initialization Tests
    
    func testObjectItem_ViewBuilderInitialization_AllClosures() {
        // Given/When
        let objectItem = ObjectItem(
            title: { Text("Title") },
            subtitle: { Text("Subtitle") },
            footnote: { Text("Footnote") },
            description: { Text("Description") },
            status: { Text("Status") },
            substatus: { Text("Substatus") },
            detailImage: { Image(systemName: "person") },
            icons: { Image(systemName: "star") },
            avatars: { Image(systemName: "person.circle") },
            footnoteIcons: { Image(systemName: "info.circle") },
            footnoteIconsText: { Text("Info text") },
            tags: { Text("Tag1") },
            action: { FioriButton(title: AttributedString("Action")) },
            objectItemButton: { FioriButton(title: AttributedString("Accessory")) },
            showsDescriptionInCompact: true,
            componentIdentifier: ObjectItem.identifier
        )
        
        // Then
        XCTAssertNotNil(objectItem)
        XCTAssertEqual(objectItem.componentIdentifier, "fiori_objectitem_component")
        XCTAssertTrue(objectItem.showsDescriptionInCompact)
    }
    
    // MARK: - Status and Substatus Variants
    
    func testObjectItem_StatusVariants_TextIconBoth() {
        // Given
        let title = AttributedString("Title")
        let text = TextOrIcon.text(AttributedString("S"))
        let icon = TextOrIcon.icon(Image(systemName: "exclamationmark.triangle"))
        let both = TextOrIcon.both(AttributedString("Label"), Image(systemName: "bolt"))
        
        // When
        let itemText = ObjectItem(title: title, status: text)
        let itemIcon = ObjectItem(title: title, status: icon)
        let itemBoth = ObjectItem(title: title, status: both)
        
        // Then
        XCTAssertNotNil(itemText)
        XCTAssertNotNil(itemIcon)
        XCTAssertNotNil(itemBoth)
    }
    
    func testObjectItem_SubstatusVariants_TextIconBoth() {
        // Given
        let title = AttributedString("Title")
        let text = TextOrIcon.text(AttributedString("Sub"))
        let icon = TextOrIcon.icon(Image(systemName: "circle"))
        let both = TextOrIcon.both(AttributedString("Label"), Image(systemName: "bolt"))
        
        // When
        let itemText = ObjectItem(title: title, substatus: text)
        let itemIcon = ObjectItem(title: title, substatus: icon)
        let itemBoth = ObjectItem(title: title, substatus: both)
        
        // Then
        XCTAssertNotNil(itemText)
        XCTAssertNotNil(itemIcon)
        XCTAssertNotNil(itemBoth)
    }
    
    // MARK: - Arrays and Optionals
    
    func testObjectItem_EmptyArraysAndNilOptionals() {
        // Given
        let title = AttributedString("Title")
        
        // When
        let objectItem = ObjectItem(
            title: title,
            subtitle: nil,
            footnote: nil,
            description: nil,
            status: nil,
            substatus: nil,
            detailImage: nil,
            icons: [],
            avatars: [],
            footnoteIcons: [],
            footnoteIconsText: nil,
            tags: [],
            action: nil,
            objectItemButton: nil,
            showsDescriptionInCompact: false
        )
        
        // Then
        XCTAssertNotNil(objectItem)
        XCTAssertFalse(objectItem.showsDescriptionInCompact)
    }
    
    func testObjectItem_WithVariousCollections() {
        // Given
        let title = AttributedString("Title")
        let icons: [TextOrIcon] = [.icon(Image(systemName: "1.circle")), .icon(Image(systemName: "2.circle"))]
        let avatars: [TextOrIcon] = [.text(AttributedString("A"))]
        let footnoteIcons: [TextOrIcon] = []
        let tags: [AttributedString] = [AttributedString("Tag1"), AttributedString("Tag2")]
        
        // When
        let objectItem = ObjectItem(
            title: title,
            icons: icons,
            avatars: avatars,
            footnoteIcons: footnoteIcons,
            tags: tags
        )
        
        // Then
        XCTAssertNotNil(objectItem)
    }
    
    // MARK: - Configuration-based Initialization
    
    func testObjectItem_InitializationFromConfiguration() {
        // Given
        let configuration = ObjectItemConfiguration(
            componentIdentifier: ObjectItem.identifier,
            title: ConfigurationViewWrapper(Text("Title")),
            subtitle: ConfigurationViewWrapper(Text("Subtitle")),
            footnote: ConfigurationViewWrapper(Text("Footnote")),
            description: ConfigurationViewWrapper(Text("Description")),
            status: ConfigurationViewWrapper(Text("Status")),
            substatus: ConfigurationViewWrapper(Text("Substatus")),
            detailImage: ConfigurationViewWrapper(Image(systemName: "person")),
            icons: ConfigurationViewWrapper(Image(systemName: "star")),
            avatars: ConfigurationViewWrapper(Image(systemName: "person.circle")),
            footnoteIcons: ConfigurationViewWrapper(Image(systemName: "info.circle")),
            footnoteIconsText: ConfigurationViewWrapper(Text("Footnote Icons Text")),
            tags: ConfigurationViewWrapper(Text("Tag")),
            action: ConfigurationViewWrapper(FioriButton(title: AttributedString("Action"))),
            objectItemButton: ConfigurationViewWrapper(FioriButton(title: AttributedString("Accessory"))),
            showsDescriptionInCompact: true
        )
        
        // When
        let objectItem = ObjectItem(configuration)
        
        // Then
        XCTAssertNotNil(objectItem)
        XCTAssertEqual(objectItem.componentIdentifier, configuration.componentIdentifier)
    }
    
    // MARK: - Component Identifier
    
    func testObjectItem_DefaultComponentIdentifier() {
        // Given/When
        let objectItem = ObjectItem(title: { Text("Title") })
        
        // Then
        XCTAssertEqual(objectItem.componentIdentifier, ObjectItem.identifier)
        XCTAssertEqual(ObjectItem.identifier, "fiori_objectitem_component")
    }
    
    func testObjectItem_CustomComponentIdentifier() {
        // Given
        let customIdentifier = "custom_object_item"
        
        // When
        let objectItem = ObjectItem(
            title: { Text("Title") },
            componentIdentifier: customIdentifier
        )
        
        // Then
        XCTAssertEqual(objectItem.componentIdentifier, customIdentifier)
    }
    
    // MARK: - View Rendering Tests
    
    func testObjectItem_AsView() {
        // Given
        let objectItem = ObjectItem(title: { Text("Title") })
        
        // When
        let view = objectItem as any View
        
        // Then
        XCTAssertNotNil(view)
    }
}

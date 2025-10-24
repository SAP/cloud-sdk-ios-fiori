@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class TimelinePreviewItemTests: XCTestCase {
    // MARK: - TimelinePreviewItem Basic Initialization Tests
    
    func testTimelinePreviewItem_BasicInitialization() {
        // Given
        let title = "Test Task"
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text(title) },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.componentIdentifier, "fiori_timelinepreviewitem_component")
        XCTAssertEqual(item.nodeType, nodeType)
        XCTAssertEqual(item.isFuture, false) // Default value
    }
    
    func testTimelinePreviewItem_InitializationWithAllParameters() {
        // Given
        let title = "Complete Task"
        let icon = Image(systemName: "checkmark.circle")
        let timestamp = "March 15, 2024"
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text(title) },
            icon: { icon },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            timestamp: { Text(timestamp) },
            isFuture: false,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.componentIdentifier, "fiori_timelinepreviewitem_component")
        XCTAssertEqual(item.nodeType, nodeType)
        XCTAssertEqual(item.isFuture, false)
    }
    
    func testTimelinePreviewItem_InitializationWithAttributedString() {
        // Given
        let title = AttributedString("Test Task")
        let icon = Image(systemName: "star")
        let timestamp = AttributedString("Today")
        let nodeType = TimelineNodeType.open
        
        // When
        let item = TimelinePreviewItem(
            title: title,
            icon: icon,
            timelineNode: nodeType,
            timestamp: timestamp,
            isFuture: true,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.componentIdentifier, "fiori_timelinepreviewitem_component")
        XCTAssertEqual(item.nodeType, nodeType)
        XCTAssertEqual(item.isFuture, true)
    }
    
    func testTimelinePreviewItem_InitializationWithNilIcon() {
        // Given
        let title = AttributedString("No Icon Task")
        let nodeType = TimelineNodeType.start
        
        // When
        let item = TimelinePreviewItem(
            title: title,
            icon: nil,
            timelineNode: nodeType,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.componentIdentifier, "fiori_timelinepreviewitem_component")
        XCTAssertEqual(item.nodeType, nodeType)
        XCTAssertEqual(item.isFuture, false)
    }
    
    func testTimelinePreviewItem_InitializationWithNilTimestamp() {
        // Given
        let title = AttributedString("No Timestamp Task")
        let icon = Image(systemName: "calendar")
        let nodeType = TimelineNodeType.end
        
        // When
        let item = TimelinePreviewItem(
            title: title,
            icon: icon,
            timelineNode: nodeType,
            timestamp: nil,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.componentIdentifier, "fiori_timelinepreviewitem_component")
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    func testTimelinePreviewItem_InitializationWithCustomComponentIdentifier() {
        // Given
        let title = "Custom ID Task"
        let nodeType = TimelineNodeType.complete
        let customIdentifier = "custom_timeline_item_component"
        
        // When
        let item = TimelinePreviewItem(
            title: { Text(title) },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType,
            componentIdentifier: customIdentifier
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.componentIdentifier, customIdentifier)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    // MARK: - TimelinePreviewItem Timeline Node Type Tests
    
    func testTimelinePreviewItem_WithStartNodeType() {
        // Given
        let nodeType = TimelineNodeType.start
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Start Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            isFuture: true,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertEqual(item.nodeType, .start)
        XCTAssertEqual(item.isFuture, true)
    }
    
    func testTimelinePreviewItem_WithOpenNodeType() {
        // Given
        let nodeType = TimelineNodeType.open
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Open Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            isFuture: false,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertEqual(item.nodeType, .open)
        XCTAssertEqual(item.isFuture, false)
    }
    
    func testTimelinePreviewItem_WithCompleteNodeType() {
        // Given
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Complete Task") },
            icon: { Image(systemName: "checkmark.circle.fill") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            isFuture: false,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertEqual(item.nodeType, .complete)
        XCTAssertEqual(item.isFuture, false)
    }
    
    func testTimelinePreviewItem_WithEndNodeType() {
        // Given
        let nodeType = TimelineNodeType.end
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("End Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            isFuture: true,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertEqual(item.nodeType, .end)
        XCTAssertEqual(item.isFuture, true)
    }
    
    // MARK: - TimelinePreviewItem Future Flag Tests
    
    func testTimelinePreviewItem_IsFutureTrue() {
        // Given
        let nodeType = TimelineNodeType.start
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Future Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            isFuture: true,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertEqual(item.isFuture, true)
    }
    
    func testTimelinePreviewItem_IsFutureFalse() {
        // Given
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Past Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            isFuture: false,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertEqual(item.isFuture, false)
    }
    
    func testTimelinePreviewItem_DefaultIsFuture() {
        // Given
        let nodeType = TimelineNodeType.open
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Default Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertEqual(item.isFuture, false) // Default should be false
    }
    
    // MARK: - TimelinePreviewItem Icon Tests
    
    func testTimelinePreviewItem_WithSystemIcon() {
        // Given
        let icon = Image(systemName: "star.fill")
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Star Task") },
            icon: { icon },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    func testTimelinePreviewItem_WithoutIcon() {
        // Given
        let nodeType = TimelineNodeType.open
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("No Icon Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    // MARK: - TimelinePreviewItem Timestamp Tests
    
    func testTimelinePreviewItem_WithTimestamp() {
        // Given
        let timestamp = "March 15, 2024"
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Timestamped Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            timestamp: { Text(timestamp) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    func testTimelinePreviewItem_WithAttributedTimestamp() {
        // Given
        let timestamp = AttributedString("Today")
        let nodeType = TimelineNodeType.open
        
        // When
        let item = TimelinePreviewItem(
            title: AttributedString("Today's Task"),
            timelineNode: nodeType,
            timestamp: timestamp,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    func testTimelinePreviewItem_WithoutTimestamp() {
        // Given
        let nodeType = TimelineNodeType.start
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("No Timestamp Task") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    // MARK: - TimelinePreviewItem Identifier Tests
    
    func testTimelinePreviewItem_StaticIdentifier() {
        // Given/When/Then
        XCTAssertEqual(TimelinePreviewItem.identifier, "fiori_timelinepreviewitem_component")
    }
    
    // MARK: - TimelinePreviewItem Model Integration Tests
    
    func testTimelinePreviewItem_InitializationFromModel() {
        // Given
        struct TestModel: TimelinePreviewItemModel {
            var id = UUID()
            var title = "Model Task"
            var icon: Image? = Image(systemName: "circle")
            var timelineNode = TimelineNodeType.complete
            var due = Date()
            var formatter: DateFormatter? = nil
            var isFuture: Bool? = false
            var isCurrent: Bool? = false
        }
        
        let model = TestModel()
        
        // When
        let item = TimelinePreviewItem(model: model)
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, model.timelineNode)
        XCTAssertEqual(item.isFuture, false)
    }
    
    // MARK: - TimelinePreviewItem View Rendering Tests
    
    func testTimelinePreviewItem_AsView() {
        // Given
        let item = TimelinePreviewItem(
            title: { Text("View Test") },
            timelineNode: { TimelineNode(timelineNode: .complete) },
            nodeType: .complete
        )
        
        // When
        let body = item.body
        
        // Then
        XCTAssertNotNil(body)
    }
    
    func testTimelinePreviewItem_ViewBodyIsNotNil() {
        // Given
        let item = TimelinePreviewItem(
            title: AttributedString("Body Test"),
            timelineNode: .open,
            nodeType: .open
        )
        
        // When
        let body = item.body
        
        // Then
        XCTAssertNotNil(body)
    }
    
    // MARK: - TimelinePreviewItem Complex Scenarios Tests
    
    func testTimelinePreviewItem_CompleteScenario() {
        // Given
        let title = "Project Completion"
        let icon = Image(systemName: "checkmark.circle.fill")
        let timestamp = "March 15, 2024"
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text(title) },
            icon: { icon },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            timestamp: { Text(timestamp) },
            isFuture: false,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.componentIdentifier, "fiori_timelinepreviewitem_component")
        XCTAssertEqual(item.nodeType, .complete)
        XCTAssertEqual(item.isFuture, false)
    }
    
    func testTimelinePreviewItem_FutureScenario() {
        // Given
        let title = AttributedString("Future Planning")
        let icon = Image(systemName: "calendar.badge.plus")
        let timestamp = AttributedString("Next Week")
        let nodeType = TimelineNodeType.start
        
        // When
        let item = TimelinePreviewItem(
            title: title,
            icon: icon,
            timelineNode: nodeType,
            timestamp: timestamp,
            isFuture: true,
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, .start)
        XCTAssertEqual(item.isFuture, true)
    }
    
    func testTimelinePreviewItem_MinimalScenario() {
        // Given
        let nodeType = TimelineNodeType.open
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("Minimal") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, .open)
        XCTAssertEqual(item.isFuture, false)
        XCTAssertEqual(item.componentIdentifier, "fiori_timelinepreviewitem_component")
    }
    
    // MARK: - TimelinePreviewItem Edge Cases Tests
    
    func testTimelinePreviewItem_EmptyTitle() {
        // Given
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text("") },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    func testTimelinePreviewItem_LongTitle() {
        // Given
        let longTitle = "This is a very long title that might wrap to multiple lines in the timeline preview item component"
        let nodeType = TimelineNodeType.open
        
        // When
        let item = TimelinePreviewItem(
            title: { Text(longTitle) },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
    
    func testTimelinePreviewItem_SpecialCharactersInTitle() {
        // Given
        let specialTitle = "Task with émojis 🚀 & symbols #1 @user"
        let nodeType = TimelineNodeType.complete
        
        // When
        let item = TimelinePreviewItem(
            title: { Text(specialTitle) },
            timelineNode: { TimelineNode(timelineNode: nodeType) },
            nodeType: nodeType
        )
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item.nodeType, nodeType)
    }
}

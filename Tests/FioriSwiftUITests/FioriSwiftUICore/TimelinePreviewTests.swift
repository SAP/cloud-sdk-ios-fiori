@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class TimelinePreviewTests: XCTestCase {
    // MARK: - Helper Test Model
    
    struct TestTimelinePreviewItemModel: TimelinePreviewItemModel {
        var id: UUID
        var title: String
        var icon: Image?
        var timelineNode: TimelineNodeType
        var due: Date
        private var _formatter: DateFormatter?
        var isFuture: Bool?
        var isCurrent: Bool?
        
        var formatter: DateFormatter? {
            self._formatter ?? {
                let defaultFormatter = DateFormatter()
                defaultFormatter.dateFormat = "MMMM dd yyyy"
                return defaultFormatter
            }()
        }
        
        init(
            id: UUID = UUID(),
            title: String,
            icon: Image? = nil,
            timelineNode: TimelineNodeType,
            due: Date,
            formatter: DateFormatter? = nil,
            isFuture: Bool? = nil,
            isCurrent: Bool? = nil
        ) {
            self.id = id
            self.title = title
            self.icon = icon
            self.timelineNode = timelineNode
            self.due = due
            self._formatter = formatter
            self.isFuture = isFuture
            self.isCurrent = isCurrent
        }
    }
    
    // MARK: - Helper Methods
    
    private func createTestItems() -> [any TimelinePreviewItemModel] {
        let now = Date()
        let calendar = Calendar.current
        
        return [
            TestTimelinePreviewItemModel(
                title: "Task 1 - Complete",
                icon: Image(systemName: "checkmark.circle"),
                timelineNode: .complete,
                due: calendar.date(byAdding: .day, value: -7, to: now)!,
                isFuture: false,
                isCurrent: false
            ),
            TestTimelinePreviewItemModel(
                title: "Task 2 - In Progress",
                icon: Image(systemName: "clock"),
                timelineNode: .open,
                due: now,
                isFuture: false,
                isCurrent: true
            ),
            TestTimelinePreviewItemModel(
                title: "Task 3 - Future",
                icon: Image(systemName: "calendar"),
                timelineNode: .start,
                due: calendar.date(byAdding: .day, value: 7, to: now)!,
                isFuture: true,
                isCurrent: false
            ),
            TestTimelinePreviewItemModel(
                title: "Task 4 - End",
                timelineNode: .end,
                due: calendar.date(byAdding: .day, value: 14, to: now)!,
                isFuture: true,
                isCurrent: false
            )
        ]
    }
    
    private func createCustomFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }
    
    // MARK: - TimelinePreview Basic Initialization Tests
    
    func testTimelinePreview_BasicInitialization() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(items: itemsBinding)
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreview_InitializationWithTitle() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        let titleText = "Timeline Overview"
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text(titleText) },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreview_InitializationWithTitleAndAction() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        let titleText = "Timeline Overview"
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text(titleText) },
            action: {
                Button("View All") {}
            },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreview_InitializationWithAttributedString() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        let attributedTitle = AttributedString("Timeline Overview")
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: attributedTitle,
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreview_InitializationWithFioriButton() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        let attributedTitle = AttributedString("Timeline Overview")
        let fioriButton = FioriButton(title: "View All")
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: attributedTitle,
            action: fioriButton,
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreview_InitializationWithCustomComponentIdentifier() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        let customIdentifier = "custom_timeline_component"
        
        // When
        let timelinePreview = TimelinePreview(
            items: itemsBinding,
            componentIdentifier: customIdentifier
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, customIdentifier)
    }
    
    // MARK: - TimelinePreview Data Tests
    
    func testTimelinePreview_WithEmptyItems() {
        // Given
        let emptyItems: [any TimelinePreviewItemModel] = []
        let itemsBinding = Binding.constant(emptyItems)
        
        // When
        let timelinePreview = TimelinePreview(items: itemsBinding)
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreview_WithSingleItem() {
        // Given
        let singleItem = [createTestItems().first!]
        let itemsBinding = Binding.constant(singleItem)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("Single Task") },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreview_WithMultipleItems() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("Multiple Tasks") },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(timelinePreview.componentIdentifier, "fiori_timelinepreview_component")
        XCTAssertEqual(items.count, 4)
    }
    
    // MARK: - TimelinePreviewItemModel Tests
    
    func testTimelinePreviewItemModel_BasicProperties() {
        // Given
        let id = UUID()
        let title = "Test Task"
        let icon = Image(systemName: "star")
        let timelineNode = TimelineNodeType.complete
        let due = Date()
        
        // When
        let item = TestTimelinePreviewItemModel(
            id: id,
            title: title,
            icon: icon,
            timelineNode: timelineNode,
            due: due
        )
        
        // Then
        XCTAssertEqual(item.id, id)
        XCTAssertEqual(item.title, title)
        XCTAssertEqual(item.timelineNode, timelineNode)
        XCTAssertEqual(item.due, due)
        XCTAssertNil(item.isFuture)
        XCTAssertNil(item.isCurrent)
    }
    
    func testTimelinePreviewItemModel_WithFutureFlag() {
        // Given
        let item = TestTimelinePreviewItemModel(
            title: "Future Task",
            timelineNode: .start,
            due: Date(),
            isFuture: true
        )
        
        // When/Then
        XCTAssertEqual(item.title, "Future Task")
        XCTAssertEqual(item.timelineNode, .start)
        XCTAssertEqual(item.isFuture, true)
        XCTAssertNil(item.isCurrent)
    }
    
    func testTimelinePreviewItemModel_WithCurrentFlag() {
        // Given
        let item = TestTimelinePreviewItemModel(
            title: "Current Task",
            timelineNode: .open,
            due: Date(),
            isCurrent: true
        )
        
        // When/Then
        XCTAssertEqual(item.title, "Current Task")
        XCTAssertEqual(item.timelineNode, .open)
        XCTAssertNil(item.isFuture)
        XCTAssertEqual(item.isCurrent, true)
    }
    
    func testTimelinePreviewItemModel_WithCustomFormatter() {
        // Given
        let customFormatter = self.createCustomFormatter()
        let due = Date()
        
        // When
        let item = TestTimelinePreviewItemModel(
            title: "Custom Format Task",
            timelineNode: .complete,
            due: due,
            formatter: customFormatter
        )
        
        // Then
        XCTAssertEqual(item.title, "Custom Format Task")
        XCTAssertEqual(item.formatter?.dateFormat, "MM/dd/yyyy")
    }
    
    func testTimelinePreviewItemModel_DefaultFormatter() {
        // Given
        let item = TestTimelinePreviewItemModel(
            title: "Default Format Task",
            timelineNode: .complete,
            due: Date()
        )
        
        // When
        let defaultFormatter = item.formatter
        
        // Then
        XCTAssertEqual(defaultFormatter?.dateFormat, "MMMM dd yyyy")
    }
    
    // MARK: - TimelinePreview Configuration Tests
    
    func testTimelinePreviewConfiguration_BasicCreation() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        
        // When
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Test")),
            action: TimelinePreviewConfiguration.Action(EmptyView()),
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreviewConfiguration_IsDirectChild() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Test")),
            action: TimelinePreviewConfiguration.Action(EmptyView()),
            items: itemsBinding
        )
        
        // When/Then
        XCTAssertTrue(configuration.isDirectChild("fiori_timelinepreview_component"))
        XCTAssertFalse(configuration.isDirectChild("other_component"))
    }
    
    // MARK: - TimelinePreview Timeline Node Types Tests
    
    func testTimelinePreview_WithAllTimelineNodeTypes() {
        // Given
        let now = Date()
        let calendar = Calendar.current
        
        let items: [any TimelinePreviewItemModel] = [
            TestTimelinePreviewItemModel(
                title: "Start Task",
                timelineNode: .start,
                due: calendar.date(byAdding: .day, value: -3, to: now)!
            ),
            TestTimelinePreviewItemModel(
                title: "Open Task",
                timelineNode: .open,
                due: calendar.date(byAdding: .day, value: -2, to: now)!
            ),
            TestTimelinePreviewItemModel(
                title: "Complete Task",
                timelineNode: .complete,
                due: calendar.date(byAdding: .day, value: -1, to: now)!
            ),
            TestTimelinePreviewItemModel(
                title: "End Task",
                timelineNode: .end,
                due: now
            )
        ]
        
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("All Node Types") },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(items.count, 4)
        XCTAssertEqual(items[0].timelineNode, .start)
        XCTAssertEqual(items[1].timelineNode, .open)
        XCTAssertEqual(items[2].timelineNode, .complete)
        XCTAssertEqual(items[3].timelineNode, .end)
    }
    
    // MARK: - TimelinePreview Edge Cases Tests
    
    func testTimelinePreview_WithNilOptionalTitle() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: nil,
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
    }
    
    func testTimelinePreview_WithNilAction() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: AttributedString("Timeline"),
            action: nil,
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
    }
    
    func testTimelinePreview_WithBothNilTitleAndAction() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: nil,
            action: nil,
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
    }
    
    // MARK: - TimelinePreview Complex Scenarios Tests
    
    func testTimelinePreview_WithMixedTimeStates() {
        // Given
        let now = Date()
        let calendar = Calendar.current
        
        let items: [any TimelinePreviewItemModel] = [
            TestTimelinePreviewItemModel(
                title: "Past Complete",
                icon: Image(systemName: "checkmark.circle.fill"),
                timelineNode: .complete,
                due: calendar.date(byAdding: .day, value: -5, to: now)!,
                isFuture: false,
                isCurrent: false
            ),
            TestTimelinePreviewItemModel(
                title: "Current In Progress",
                icon: Image(systemName: "clock.fill"),
                timelineNode: .open,
                due: now,
                isFuture: false,
                isCurrent: true
            ),
            TestTimelinePreviewItemModel(
                title: "Future Planned",
                icon: Image(systemName: "calendar.circle"),
                timelineNode: .start,
                due: calendar.date(byAdding: .day, value: 5, to: now)!,
                isFuture: true,
                isCurrent: false
            )
        ]
        
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("Mixed Timeline") },
            action: { Button("View Details") {} },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(items.count, 3)
        
        // Verify time states
        XCTAssertEqual(items[0].isFuture, false)
        XCTAssertEqual(items[0].isCurrent, false)
        XCTAssertEqual(items[1].isFuture, false)
        XCTAssertEqual(items[1].isCurrent, true)
        XCTAssertEqual(items[2].isFuture, true)
        XCTAssertEqual(items[2].isCurrent, false)
    }
    
    func testTimelinePreview_WithComplexIcons() {
        // Given
        let items: [any TimelinePreviewItemModel] = [
            TestTimelinePreviewItemModel(
                title: "System Icon Task",
                icon: Image(systemName: "star.fill"),
                timelineNode: .complete,
                due: Date()
            ),
            TestTimelinePreviewItemModel(
                title: "No Icon Task",
                icon: nil,
                timelineNode: .open,
                due: Date()
            )
        ]
        
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("Icon Tests") },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertNotNil(items[0].icon)
        XCTAssertNil(items[1].icon)
    }
    
    // MARK: - TimelinePreview Performance Tests
    
    func testTimelinePreview_WithLargeDataSet() {
        // Given
        let now = Date()
        let calendar = Calendar.current
        let nodeTypes: [TimelineNodeType] = [.start, .open, .complete, .end]
        
        let largeItemSet: [any TimelinePreviewItemModel] = (0 ..< 100).map { index in
            TestTimelinePreviewItemModel(
                title: "Task \(index + 1)",
                icon: Image(systemName: "circle"),
                timelineNode: nodeTypes[index % nodeTypes.count],
                due: calendar.date(byAdding: .day, value: index - 50, to: now)!,
                isFuture: index > 50,
                isCurrent: index == 50
            )
        }
        
        let itemsBinding = Binding.constant(largeItemSet)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("Large Dataset") },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(largeItemSet.count, 100)
    }
    
    // MARK: - TimelinePreview Identifier Tests
    
    func testTimelinePreview_StaticIdentifier() {
        // Given/When/Then
        XCTAssertEqual(TimelinePreview.identifier, "fiori_timelinepreview_component")
    }
    
    // MARK: - TimelinePreview View Rendering Tests
    
    func testTimelinePreview_AsView() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        
        // When
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("Test Timeline") },
            items: itemsBinding
        )
        
        // Then
        XCTAssertNotNil(timelinePreview.body)
    }
    
    func testTimelinePreview_ViewBodyIsNotNil() {
        // Given
        let items = self.createTestItems()
        let itemsBinding = Binding.constant(items)
        let timelinePreview = TimelinePreview(items: itemsBinding)
        
        // When
        let body = timelinePreview.body
        
        // Then
        XCTAssertNotNil(body)
    }
    
    // MARK: - TimelinePreview Binding Tests
    
    func testTimelinePreview_BindingUpdates() {
        // Given
        var items = self.createTestItems()
        let itemsBinding = Binding(
            get: { items },
            set: { items = $0 }
        )
        
        let timelinePreview = TimelinePreview(
            optionalTitle: { Text("Binding Test") },
            items: itemsBinding
        )
        
        // When
        let newItem = TestTimelinePreviewItemModel(
            title: "New Task",
            timelineNode: .start,
            due: Date()
        )
        items.append(newItem)
        
        // Then
        XCTAssertNotNil(timelinePreview)
        XCTAssertEqual(items.count, 5)
        XCTAssertEqual(items.last?.title, "New Task")
    }
}

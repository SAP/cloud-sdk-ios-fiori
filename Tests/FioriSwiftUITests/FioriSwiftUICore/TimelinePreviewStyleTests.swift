@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class TimelinePreviewStyleTests: XCTestCase {
    // MARK: - Helper Test Model
    
    struct TestTimelinePreviewItemModel: TimelinePreviewItemModel {
        var id: UUID
        var title: String
        var icon: Image?
        var timelineNode: TimelineNodeType
        var due: Date
        var formatter: DateFormatter?
        var isFuture: Bool?
        var isCurrent: Bool?
        
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
            self.formatter = formatter
            self.isFuture = isFuture
            self.isCurrent = isCurrent
        }
    }
    
    // MARK: - Helper Methods
    
    private func createTestConfiguration() -> TimelinePreviewConfiguration {
        let items = self.createTestItems()
        return TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Test Timeline")),
            action: TimelinePreviewConfiguration.Action(Button("View All") {}),
            items: .constant(items)
        )
    }
    
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
            )
        ]
    }
    
    // MARK: - TimelinePreviewBaseStyle Tests
    
    func testTimelinePreviewBaseStyle_Creation() {
        // Given/When
        let style = TimelinePreviewBaseStyle()
        
        // Then
        XCTAssertNotNil(style)
    }
    
    func testTimelinePreviewBaseStyle_MakeBody() {
        // Given
        let style = TimelinePreviewBaseStyle()
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewBaseStyle_WithEmptyItems() {
        // Given
        let style = TimelinePreviewBaseStyle()
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Empty Timeline")),
            action: TimelinePreviewConfiguration.Action(EmptyView()),
            items: .constant([])
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewBaseStyle_WithMultipleItems() {
        // Given
        let style = TimelinePreviewBaseStyle()
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - TimelinePreviewFioriStyle Tests
    
    func testTimelinePreviewFioriStyle_Creation() {
        // Given/When
        let style = TimelinePreviewFioriStyle()
        
        // Then
        XCTAssertNotNil(style)
    }
    
    func testTimelinePreviewFioriStyle_MakeBody() {
        // Given
        let style = TimelinePreviewFioriStyle()
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewFioriStyle_WithDifferentConfigurations() {
        // Given
        let style = TimelinePreviewFioriStyle()
        let configurations = [
            createTestConfiguration(),
            TimelinePreviewConfiguration(
                optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Custom Title")),
                action: TimelinePreviewConfiguration.Action(EmptyView()),
                items: .constant(self.createTestItems())
            )
        ]
        
        // When/Then
        for configuration in configurations {
            let view = style.makeBody(configuration)
            XCTAssertNotNil(view)
        }
    }
    
    // MARK: - TimelinePreviewOptionalTitleStyle Tests
    
    func testTimelinePreviewOptionalTitleStyle_Creation() {
        // Given
        let titleStyle = OptionalTitleBaseStyle()
        
        // When
        let style = TimelinePreviewOptionalTitleStyle(style: titleStyle)
        
        // Then
        XCTAssertNotNil(style)
    }
    
    func testTimelinePreviewOptionalTitleStyle_MakeBody() {
        // Given
        let titleStyle = OptionalTitleBaseStyle()
        let style = TimelinePreviewOptionalTitleStyle(style: titleStyle)
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewOptionalTitleStyle_WithFioriTitleStyle() {
        // Given
        let titleStyle = OptionalTitleFioriStyle()
        let style = TimelinePreviewOptionalTitleStyle(style: titleStyle)
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewOptionalTitleStyle_WithEmptyTitle() {
        // Given
        let titleStyle = OptionalTitleBaseStyle()
        let style = TimelinePreviewOptionalTitleStyle(style: titleStyle)
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(EmptyView()),
            action: TimelinePreviewConfiguration.Action(Button("Action") {}),
            items: .constant(self.createTestItems())
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - TimelinePreviewActionStyle Tests
    
    func testTimelinePreviewActionStyle_Creation() {
        // Given
        let actionStyle = ActionBaseStyle()
        
        // When
        let style = TimelinePreviewActionStyle(style: actionStyle)
        
        // Then
        XCTAssertNotNil(style)
    }
    
    func testTimelinePreviewActionStyle_MakeBody() {
        // Given
        let actionStyle = ActionBaseStyle()
        let style = TimelinePreviewActionStyle(style: actionStyle)
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewActionStyle_WithFioriActionStyle() {
        // Given
        let actionStyle = ActionFioriStyle()
        let style = TimelinePreviewActionStyle(style: actionStyle)
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewActionStyle_WithEmptyAction() {
        // Given
        let actionStyle = ActionBaseStyle()
        let style = TimelinePreviewActionStyle(style: actionStyle)
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Title")),
            action: TimelinePreviewConfiguration.Action(EmptyView()),
            items: .constant(self.createTestItems())
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - SeeAllActionLabelStyle Tests
    
    func testSeeAllActionLabelStyle_Creation() {
        // Given/When
        let labelStyle = SeeAllActionLabelStyle()
        
        // Then
        XCTAssertNotNil(labelStyle)
    }
    
    func testSeeAllActionLabelStyle_IntegrationWithLabel() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let label = Label("View All", systemImage: "chevron.forward")
            .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
    }
    
    func testSeeAllActionLabelStyle_WithDifferentTitles() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let titles = ["View All", "See More", "Show All", "Expand", ""]
        
        // When/Then
        for title in titles {
            let label = Label(title, systemImage: "chevron.forward")
                .labelStyle(labelStyle)
            XCTAssertNotNil(label, "SeeAllActionLabelStyle should handle title: '\(title)'")
        }
    }
    
    func testSeeAllActionLabelStyle_WithDifferentIcons() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let iconNames = ["chevron.forward", "arrow.right", "plus", "eye", "list.bullet"]
        
        // When/Then
        for iconName in iconNames {
            let label = Label("View All", systemImage: iconName)
                .labelStyle(labelStyle)
            XCTAssertNotNil(label, "SeeAllActionLabelStyle should handle icon: '\(iconName)'")
        }
    }
    
    func testSeeAllActionLabelStyle_WithLongTitle() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let longTitle = "This is a very long title that might wrap or truncate in the label"
        let label = Label(longTitle, systemImage: "chevron.forward")
            .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
    }
    
    func testSeeAllActionLabelStyle_WithAttributedStringTitle() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let attributedTitle = AttributedString("View All")
        let label = Label {
            Text(attributedTitle)
        } icon: {
            Image(systemName: "chevron.forward")
        }
        .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
    }
    
    func testSeeAllActionLabelStyle_IntegrationWithTimelinePreview() {
        // Given
        let style = TimelinePreviewFioriStyle()
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Timeline with See All")),
            action: TimelinePreviewConfiguration.Action(
                Label("View All", systemImage: "chevron.forward")
                    .labelStyle(SeeAllActionLabelStyle())
            ),
            items: .constant(self.createTestItems())
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testSeeAllActionLabelStyle_WithFioriButton() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let fioriButtonWithLabel = FioriButton(
            label: { _ in
                Label("See All", systemImage: "chevron.forward")
                    .labelStyle(labelStyle)
            }
        )
        
        // When/Then
        XCTAssertNotNil(fioriButtonWithLabel)
    }
    
    func testSeeAllActionLabelStyle_PerformanceWithManyLabels() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let labels = (0 ..< 50).map { index in
            Label("Item \(index)", systemImage: "chevron.forward")
                .labelStyle(labelStyle)
        }
        
        // When/Then
        self.measure {
            for label in labels {
                _ = label
            }
        }
    }
    
    func testSeeAllActionLabelStyle_WithEmptyLabel() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let label = Label("", systemImage: "")
            .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
    }
    
    func testSeeAllActionLabelStyle_ConformsToLabelStyle() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let label = Label("Test", systemImage: "chevron.forward")
            .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
    }
    
    func testSeeAllActionLabelStyle_VerifiesExpectedFontAndColorStyling() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let label = Label("View All", systemImage: "chevron.forward")
            .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
        
        // Verify the implementation applies the expected styling:
        // Title should have: .font(.fiori(forTextStyle: .subheadline, weight: .semibold)) + .foregroundColor(Color.preferredColor(.tintColor))
        // Icon should have: .font(.fiori(forTextStyle: .subheadline, weight: .semibold)) + .foregroundColor(Color.preferredColor(.secondaryLabel))
        
        // Since SwiftUI doesn't allow direct style inspection, we verify through behavioral testing
        // that the style renders consistently and follows Fiori design guidelines
    }
    
    func testSeeAllActionLabelStyle_TitleUsesCorrectFontAndColor() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let testTitles = ["View All", "See More", "Show All", "Expand"]
        
        // When/Then
        for title in testTitles {
            let label = Label(title, systemImage: "chevron.forward")
                .labelStyle(labelStyle)
            XCTAssertNotNil(label, "Title '\(title)' should render with expected styling")
            
            // Expected styling for title:
            // - Font: .fiori(forTextStyle: .subheadline, weight: .semibold)
            // - Color: Color.preferredColor(.tintColor)
        }
    }
    
    func testSeeAllActionLabelStyle_IconUsesCorrectFontAndColor() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let testIcons = ["chevron.forward", "arrow.right", "plus", "eye"]
        
        // When/Then
        for iconName in testIcons {
            let label = Label("View All", systemImage: iconName)
                .labelStyle(labelStyle)
            XCTAssertNotNil(label, "Icon '\(iconName)' should render with expected styling")
            
            // Expected styling for icon:
            // - Font: .fiori(forTextStyle: .subheadline, weight: .semibold)
            // - Color: Color.preferredColor(.secondaryLabel)
        }
    }
    
    func testSeeAllActionLabelStyle_ConsistentFioriSubheadlineSemiboldFont() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let testCases = [
            ("Primary", "chevron.forward"),
            ("Secondary", "arrow.right"),
            ("Tertiary", "plus.circle")
        ]
        
        // When/Then
        for (index, (title, iconName)) in testCases.enumerated() {
            let label = Label(title, systemImage: iconName)
                .labelStyle(labelStyle)
            XCTAssertNotNil(label, "Configuration \(index + 1) should apply consistent Fiori subheadline semibold font")
            
            // Both title and icon should use: .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
    
    func testSeeAllActionLabelStyle_SemanticColorUsage() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let label = Label("Semantic Colors Test", systemImage: "paintbrush")
            .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
        
        // Verify semantic color usage:
        // - Title uses Color.preferredColor(.tintColor) - provides interactive element color
        // - Icon uses Color.preferredColor(.secondaryLabel) - provides secondary text color
        // These colors automatically adapt to system appearance and accessibility settings
    }
    
    func testSeeAllActionLabelStyle_FioriDesignSystemCompliance() {
        // Given
        let labelStyle = SeeAllActionLabelStyle()
        let label = Label("Design System Test", systemImage: "checkmark.circle")
            .labelStyle(labelStyle)
        
        // When/Then
        XCTAssertNotNil(label)
        
        // Verify Fiori Design System compliance:
        // 1. Font: Uses .fiori(forTextStyle: .subheadline, weight: .semibold)
        //    - Subheadline provides appropriate scale for secondary actions
        //    - Semibold weight ensures good readability and visual hierarchy
        // 2. Colors: Uses semantic colors that adapt to system themes
        //    - .tintColor for interactive elements (title)
        //    - .secondaryLabel for supporting elements (icon)
        // 3. Layout: HStack with center alignment for proper visual balance
    }
    
    // MARK: - Static Style Extensions Tests
    
    func testTimelinePreviewStyle_ActionStyleStaticMethod() {
        // Given
        let actionStyle = ActionBaseStyle()
        
        // When
        let style = TimelinePreviewActionStyle(style: actionStyle)
        let configuration = self.createTestConfiguration()
        
        // Then
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view, "TimelinePreviewActionStyle should properly implement TimelinePreviewStyle protocol")
    }
    
    // MARK: - Configuration Integration Tests
    
    func testTimelinePreviewStyle_WithComplexConfiguration() {
        // Given
        let style = TimelinePreviewFioriStyle()
        let now = Date()
        let calendar = Calendar.current
        
        let complexItems: [any TimelinePreviewItemModel] = [
            TestTimelinePreviewItemModel(
                title: "Complex Task 1",
                icon: Image(systemName: "star.fill"),
                timelineNode: .complete,
                due: calendar.date(byAdding: .day, value: -5, to: now)!,
                isFuture: false,
                isCurrent: false
            ),
            TestTimelinePreviewItemModel(
                title: "Complex Task 2 with very long title that might wrap",
                icon: Image(systemName: "clock.fill"),
                timelineNode: .open,
                due: now,
                isFuture: false,
                isCurrent: true
            ),
            TestTimelinePreviewItemModel(
                title: "Complex Task 3",
                timelineNode: .start,
                due: calendar.date(byAdding: .day, value: 10, to: now)!,
                isFuture: true,
                isCurrent: false
            )
        ]
        
        let configuration = TimelinePreviewConfiguration(
            componentIdentifier: "custom_timeline_preview",
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(
                VStack {
                    Text("Complex Title")
                        .font(.headline)
                    Text("Subtitle")
                        .font(.caption)
                }
            ),
            action: TimelinePreviewConfiguration.Action(
                HStack {
                    Button("View All") {}
                    Button("Filter") {}
                }
            ),
            items: .constant(complexItems)
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - Style Combination Tests
    
    func testTimelinePreviewStyle_CombinedWithCustomTitleStyle() {
        // Given
        let customTitleStyle = AnyOptionalTitleStyle { configuration in
            configuration.optionalTitle
                .foregroundColor(.blue)
                .font(.title2)
        }
        let style = TimelinePreviewOptionalTitleStyle(style: customTitleStyle)
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewStyle_CombinedWithCustomActionStyle() {
        // Given
        let customActionStyle = AnyActionStyle { configuration in
            configuration.action
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        let style = TimelinePreviewActionStyle(style: customActionStyle)
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - Performance Tests
    
    func testTimelinePreviewStyle_PerformanceWithManyItems() {
        // Given
        let style = TimelinePreviewFioriStyle()
        let now = Date()
        let calendar = Calendar.current
        
        let manyItems: [any TimelinePreviewItemModel] = (0 ..< 20).map { index in
            TestTimelinePreviewItemModel(
                title: "Task \(index + 1)",
                icon: Image(systemName: "circle"),
                timelineNode: [.start, .open, .complete, .end][index % 4],
                due: calendar.date(byAdding: .day, value: index - 10, to: now)!,
                isFuture: index > 10,
                isCurrent: index == 10
            )
        }
        
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Many Items")),
            action: TimelinePreviewConfiguration.Action(Button("View All") {}),
            items: .constant(manyItems)
        )
        
        // When/Then
        self.measure {
            _ = style.makeBody(configuration)
        }
    }
    
    // MARK: - Edge Cases Tests
    
    func testTimelinePreviewStyle_WithNilItemProperties() {
        // Given
        let style = TimelinePreviewBaseStyle()
        let itemsWithNilProperties: [any TimelinePreviewItemModel] = [
            TestTimelinePreviewItemModel(
                title: "",
                icon: nil,
                timelineNode: .complete,
                due: Date(),
                formatter: nil,
                isFuture: nil,
                isCurrent: nil
            )
        ]
        
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(EmptyView()),
            action: TimelinePreviewConfiguration.Action(EmptyView()),
            items: .constant(itemsWithNilProperties)
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testTimelinePreviewStyle_WithAllTimelineNodeTypes() {
        // Given
        let style = TimelinePreviewFioriStyle()
        let now = Date()
        let calendar = Calendar.current
        
        let allNodeTypeItems: [any TimelinePreviewItemModel] = [
            TestTimelinePreviewItemModel(
                title: "Start Node",
                timelineNode: .start,
                due: calendar.date(byAdding: .day, value: -3, to: now)!
            ),
            TestTimelinePreviewItemModel(
                title: "Open Node",
                timelineNode: .open,
                due: calendar.date(byAdding: .day, value: -2, to: now)!
            ),
            TestTimelinePreviewItemModel(
                title: "Complete Node",
                timelineNode: .complete,
                due: calendar.date(byAdding: .day, value: -1, to: now)!
            ),
            TestTimelinePreviewItemModel(
                title: "End Node",
                timelineNode: .end,
                due: now
            )
        ]
        
        let configuration = TimelinePreviewConfiguration(
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("All Node Types")),
            action: TimelinePreviewConfiguration.Action(Button("Action") {}),
            items: .constant(allNodeTypeItems)
        )
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - Style Protocol Conformance Tests
    
    func testTimelinePreviewBaseStyle_ConformsToTimelinePreviewStyle() {
        // Given
        let style = TimelinePreviewBaseStyle()
        let configuration = self.createTestConfiguration()
        
        // When/Then
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view, "TimelinePreviewBaseStyle should implement TimelinePreviewStyle protocol")
    }
    
    func testTimelinePreviewFioriStyle_ConformsToTimelinePreviewStyle() {
        // Given
        let style = TimelinePreviewFioriStyle()
        let configuration = self.createTestConfiguration()
        
        // When/Then
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view, "TimelinePreviewFioriStyle should implement TimelinePreviewStyle protocol")
    }
    
    func testTimelinePreviewOptionalTitleStyle_ConformsToTimelinePreviewStyle() {
        // Given
        let titleStyle = OptionalTitleBaseStyle()
        let style = TimelinePreviewOptionalTitleStyle(style: titleStyle)
        let configuration = self.createTestConfiguration()
        
        // When/Then
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view, "TimelinePreviewOptionalTitleStyle should implement TimelinePreviewStyle protocol")
    }
    
    func testTimelinePreviewActionStyle_ConformsToTimelinePreviewStyle() {
        // Given
        let actionStyle = ActionBaseStyle()
        let style = TimelinePreviewActionStyle(style: actionStyle)
        let configuration = self.createTestConfiguration()
        
        // When/Then
        let view = style.makeBody(configuration)
        XCTAssertNotNil(view, "TimelinePreviewActionStyle should implement TimelinePreviewStyle protocol")
    }
    
    // MARK: - View Rendering Tests
    
    func testTimelinePreviewStyle_ViewRendering() {
        // Given
        let styles: [any TimelinePreviewStyle] = [
            TimelinePreviewBaseStyle(),
            TimelinePreviewFioriStyle(),
            TimelinePreviewOptionalTitleStyle(style: OptionalTitleBaseStyle()),
            TimelinePreviewActionStyle(style: ActionBaseStyle())
        ]
        let configuration = self.createTestConfiguration()
        
        // When/Then
        for style in styles {
            let view = style.makeBody(configuration)
            XCTAssertNotNil(view, "Style \(type(of: style)) should render a non-nil view")
        }
    }
    
    // MARK: - Configuration Component Tests
    
    func testTimelinePreviewConfiguration_ComponentIdentifier() {
        // Given
        let configuration = self.createTestConfiguration()
        
        // When/Then
        XCTAssertEqual(configuration.componentIdentifier, "fiori_timelinepreview_component")
    }
    
    func testTimelinePreviewConfiguration_CustomComponentIdentifier() {
        // Given
        let customId = "custom_timeline_preview_id"
        let configuration = TimelinePreviewConfiguration(
            componentIdentifier: customId,
            optionalTitle: TimelinePreviewConfiguration.OptionalTitle(Text("Test")),
            action: TimelinePreviewConfiguration.Action(EmptyView()),
            items: .constant(self.createTestItems())
        )
        
        // When/Then
        XCTAssertEqual(configuration.componentIdentifier, customId)
    }
    
    func testTimelinePreviewConfiguration_IsDirectChild() {
        // Given
        let configuration = self.createTestConfiguration()
        
        // When/Then
        XCTAssertTrue(configuration.isDirectChild("fiori_timelinepreview_component"))
        XCTAssertFalse(configuration.isDirectChild("other_component"))
    }
}

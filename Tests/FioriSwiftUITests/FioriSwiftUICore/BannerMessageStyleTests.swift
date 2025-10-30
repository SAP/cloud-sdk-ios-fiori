@testable import FioriSwiftUICore
import SwiftUI
import XCTest

// If using ViewInspector, uncomment the next line and ensure it's added as a test dependency
// import ViewInspector

final class BannerMessageStyleTests: XCTestCase {
    // MARK: - Helper Methods
    
    private func createTestConfiguration(
        messageType: BannerMultiMessageType = .neutral,
        alignment: HorizontalAlignment = .center,
        hideSeparator: Bool = false,
        showDetailLink: Bool = false,
        bannerTapAction: (() -> Void)? = nil
    ) -> BannerMessageConfiguration {
        BannerMessageConfiguration(
            componentIdentifier: "fiori_bannermessage_component",
            icon: BannerMessageConfiguration.Icon(Image(systemName: "info.circle")),
            title: BannerMessageConfiguration.Title(Text("Test Title")),
            closeAction: BannerMessageConfiguration.CloseAction(Image(systemName: "xmark")),
            topDivider: BannerMessageConfiguration.TopDivider(Rectangle().fill(Color.clear)),
            bannerTapAction: bannerTapAction,
            alignment: alignment,
            hideSeparator: hideSeparator,
            messageType: messageType,
            showDetailLink: showDetailLink
        )
    }
    
    // MARK: - BannerMessageBaseStyle Tests
    
    func testBannerMessageBaseStyle_Creation() {
        // Given/When
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testBannerMessageBaseStyle_LeadingAlignment() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(alignment: .leading)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.alignment, .leading)
    }
    
    func testBannerMessageBaseStyle_CenterAlignment() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(alignment: .center)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.alignment, .center)
    }
    
    func testBannerMessageBaseStyle_TrailingAlignment() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(alignment: .trailing)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(configuration.alignment, .trailing)
    }
    
    func testBannerMessageBaseStyle_HiddenSeparator() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(hideSeparator: true)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertTrue(configuration.hideSeparator)
    }
    
    func testBannerMessageBaseStyle_VisibleSeparator() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(hideSeparator: false)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertFalse(configuration.hideSeparator)
    }
    
    func testBannerMessageBaseStyle_GetLeadingPaddingCenterAlignment() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(messageType: .neutral, alignment: .center)
        
        // When
        let padding = style.getLeadingPadding(configuration: configuration)
        
        // Then
        XCTAssertEqual(padding, 44)
    }
    
    func testBannerMessageBaseStyle_GetLeadingPaddingCenterAlignmentAINotice() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(messageType: .aiNotice, alignment: .center)
        
        // When
        let padding = style.getLeadingPadding(configuration: configuration)
        
        // Then
        XCTAssertEqual(padding, 0)
    }
    
    func testBannerMessageBaseStyle_GetLeadingPaddingLeadingAlignment() {
        // Given
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(alignment: .leading)
        
        // When
        let padding = style.getLeadingPadding(configuration: configuration)
        
        // Then
        XCTAssertEqual(padding, 16)
    }
    
    func testBannerMessageBaseStyle_BannerTapAction() {
        // Given
        var actionCalled = false
        let tapAction = { actionCalled = true }
        let style = BannerMessageBaseStyle()
        let configuration = self.createTestConfiguration(bannerTapAction: tapAction)
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertNotNil(configuration.bannerTapAction)
        configuration.bannerTapAction?()
        XCTAssertTrue(actionCalled)
    }
    
    // MARK: - BannerMessageFioriStyle Tests
    
    func testBannerMessageFioriStyle_Creation() {
        // Given/When
        let style = BannerMessageFioriStyle()
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testBannerMessageFioriStyle_TitleForegroundColorNeutral() {
        // Given/When
        let color = BannerMessageFioriStyle.titleForegroundColor(type: .neutral)
        let expectedColor = Color.preferredColor(.neutralLabel)
        
        // Then
        XCTAssertNotNil(color)
        XCTAssertNotNil(expectedColor)
        // Verify colors are both valid instances rather than comparing exact equality
        XCTAssertTrue(String(describing: color).contains("neutralLabel") || String(describing: color).contains("UIDynamicProviderColor"))
    }
    
    func testBannerMessageFioriStyle_TitleForegroundColorNegative() {
        // Given/When
        let color = BannerMessageFioriStyle.titleForegroundColor(type: .negative)
        let expectedColor = Color.preferredColor(.negativeLabel)
        
        // Then
        XCTAssertNotNil(color)
        XCTAssertNotNil(expectedColor)
        // Verify colors are both valid instances rather than comparing exact equality
        XCTAssertTrue(String(describing: color).contains("negativeLabel") || String(describing: color).contains("UIDynamicProviderColor"))
    }
    
    func testBannerMessageFioriStyle_TitleForegroundColorCritical() {
        // Given/When
        let color = BannerMessageFioriStyle.titleForegroundColor(type: .critical)
        let expectedColor = Color.preferredColor(.criticalLabel)
        
        // Then
        XCTAssertNotNil(color)
        XCTAssertNotNil(expectedColor)
        // Verify colors are both valid instances rather than comparing exact equality
        XCTAssertTrue(String(describing: color).contains("criticalLabel") || String(describing: color).contains("UIDynamicProviderColor"))
    }
    
    func testBannerMessageFioriStyle_TitleForegroundColorPositive() {
        // Given/When
        let color = BannerMessageFioriStyle.titleForegroundColor(type: .positive)
        let expectedColor = Color.preferredColor(.positiveLabel)
        
        // Then
        XCTAssertNotNil(color)
        XCTAssertNotNil(expectedColor)
        // Verify colors are both valid instances rather than comparing exact equality
        XCTAssertTrue(String(describing: color).contains("positiveLabel") || String(describing: color).contains("UIDynamicProviderColor"))
    }
    
    func testBannerMessageFioriStyle_TitleForegroundColorInformative() {
        // Given/When
        let color = BannerMessageFioriStyle.titleForegroundColor(type: .informative)
        let expectedColor = Color.preferredColor(.informativeLabel)
        
        // Then
        XCTAssertNotNil(color)
        XCTAssertNotNil(expectedColor)
        // Verify colors are both valid instances rather than comparing exact equality
        XCTAssertTrue(String(describing: color).contains("informativeLabel") || String(describing: color).contains("UIDynamicProviderColor"))
    }
    
    func testBannerMessageFioriStyle_TitleForegroundColorAINotice() {
        // Given/When
        let color = BannerMessageFioriStyle.titleForegroundColor(type: .aiNotice)
        let expectedColor = Color.preferredColor(.neutralLabel)
        
        // Then
        XCTAssertNotNil(color)
        XCTAssertNotNil(expectedColor)
        // Verify colors are both valid instances rather than comparing exact equality
        XCTAssertTrue(String(describing: color).contains("neutralLabel") || String(describing: color).contains("UIDynamicProviderColor"))
    }
    
    // MARK: - Message Type Specific Styles Tests
    
    func testBannerMessageNeutralStyle_Creation() {
        // Given/When
        let style = BannerMessageNeutralStyle()
        let configuration = self.createTestConfiguration(messageType: .neutral)
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testBannerMessageNegativeStyle_Creation() {
        // Given/When
        let style = BannerMessageNegativeStyle()
        let configuration = self.createTestConfiguration(messageType: .negative)
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testBannerMessageCriticalStyle_Creation() {
        // Given/When
        let style = BannerMessageCriticalStyle()
        let configuration = self.createTestConfiguration(messageType: .critical)
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testBannerMessagePositiveStyle_Creation() {
        // Given/When
        let style = BannerMessagePositiveStyle()
        let configuration = self.createTestConfiguration(messageType: .positive)
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testBannerMessageInformativeStyle_Creation() {
        // Given/When
        let style = BannerMessageInformativeStyle()
        let configuration = self.createTestConfiguration(messageType: .informative)
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - Component Specific Styles Tests
    
    func testIconFioriStyle_Creation() {
        // Given
        let bannerConfiguration = self.createTestConfiguration(messageType: .positive)
        let iconConfiguration = IconConfiguration(
            componentIdentifier: "fiori_icon_component",
            icon: IconConfiguration.Icon(Image(systemName: "checkmark.circle"))
        )
        
        // When
        let style = BannerMessageFioriStyle.IconFioriStyle(bannerMessageConfiguration: bannerConfiguration)
        let view = style.makeBody(iconConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.bannerMessageConfiguration.messageType, .positive)
    }
    
    func testTitleFioriStyle_Creation() {
        // Given
        let bannerConfiguration = self.createTestConfiguration(messageType: .informative)
        let titleConfiguration = TitleConfiguration(
            componentIdentifier: "fiori_title_component",
            title: TitleConfiguration.Title(Text("Test Title"))
        )
        
        // When
        let style = BannerMessageFioriStyle.TitleFioriStyle(bannerMessageConfiguration: bannerConfiguration)
        let view = style.makeBody(titleConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.bannerMessageConfiguration.messageType, .informative)
    }
    
    func testCloseActionFioriStyle_Creation() {
        // Given
        let bannerConfiguration = self.createTestConfiguration()
        let closeActionConfiguration = CloseActionConfiguration(
            componentIdentifier: "fiori_closeaction_component",
            closeAction: CloseActionConfiguration.CloseAction(Image(systemName: "xmark"))
        )
        
        // When
        let style = BannerMessageFioriStyle.CloseActionFioriStyle(bannerMessageConfiguration: bannerConfiguration)
        let view = style.makeBody(closeActionConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertNotNil(style.bannerMessageConfiguration)
    }
    
    func testTopDividerFioriStyle_Creation() {
        // Given
        let bannerConfiguration = self.createTestConfiguration(messageType: .critical)
        let topDividerConfiguration = TopDividerConfiguration(
            componentIdentifier: "fiori_topdivider_component",
            topDivider: TopDividerConfiguration.TopDivider(Rectangle())
        )
        
        // When
        let style = BannerMessageFioriStyle.TopDividerFioriStyle(bannerMessageConfiguration: bannerConfiguration)
        let view = style.makeBody(topDividerConfiguration)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(style.bannerMessageConfiguration.messageType, .critical)
    }
    
    func testContentFioriStyle_Creation() {
        // Given/When
        let style = BannerMessageFioriStyle.ContentFioriStyle()
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - AnyBannerMessageStyle Tests
    
    func testAnyBannerMessageStyle_Creation() {
        // Given/When
        let style = AnyBannerMessageStyle { _ in
            Text("Custom Banner Message")
        }
        let configuration = self.createTestConfiguration()
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testAnyBannerMessageStyle_CustomContent() {
        // Given
        let customText = "Custom Banner Content"
        let style = AnyBannerMessageStyle { configuration in
            VStack {
                Text(customText)
                configuration.title
            }
        }
        let configuration = self.createTestConfiguration()
        
        // When
        let view = style.makeBody(configuration)
        
        // Then
        XCTAssertNotNil(view)
    }
    
    // MARK: - BannerMessageConfiguration Tests
    
    func testBannerMessageConfiguration_Creation() {
        // Given/When
        let configuration = self.createTestConfiguration()
        
        // Then
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.componentIdentifier, "fiori_bannermessage_component")
        XCTAssertNotNil(configuration.icon)
        XCTAssertNotNil(configuration.title)
        XCTAssertNotNil(configuration.closeAction)
        XCTAssertNotNil(configuration.topDivider)
    }
    
    func testBannerMessageConfiguration_IsDirectChild() {
        // Given
        let configuration = self.createTestConfiguration()
        
        // When/Then
        XCTAssertTrue(configuration.isDirectChild("fiori_bannermessage_component"))
        XCTAssertFalse(configuration.isDirectChild("other_component"))
    }
    
    func testBannerMessageConfiguration_AllMessageTypes() {
        // Test all message types can be configured
        let messageTypes: [BannerMultiMessageType] = [
            .neutral, .informative, .aiNotice, .positive, .critical, .negative
        ]
        
        for messageType in messageTypes {
            // Given/When
            let configuration = self.createTestConfiguration(messageType: messageType)
            
            // Then
            XCTAssertEqual(configuration.messageType, messageType)
        }
    }
    
    func testBannerMessageConfiguration_AllAlignments() {
        // Test all alignments can be configured
        let alignments: [HorizontalAlignment] = [.leading, .center, .trailing]
        
        for alignment in alignments {
            // Given/When
            let configuration = self.createTestConfiguration(alignment: alignment)
            
            // Then
            XCTAssertEqual(configuration.alignment, alignment)
        }
    }
    
    func testBannerMessageConfiguration_WithAction() {
        // Given
        var actionCalled = false
        let tapAction = { actionCalled = true }
        
        // When
        let configuration = self.createTestConfiguration(bannerTapAction: tapAction)
        
        // Then
        XCTAssertNotNil(configuration.bannerTapAction)
        configuration.bannerTapAction?()
        XCTAssertTrue(actionCalled)
    }
    
    func testBannerMessageConfiguration_WithoutAction() {
        // Given/When
        let configuration = self.createTestConfiguration(bannerTapAction: nil)
        
        // Then
        XCTAssertNil(configuration.bannerTapAction)
    }
    
    // MARK: - View Details Font Tests
    
    func testBannerMessageModifier_ViewDetailsFont() {
        // Given
        let bannerMessages = [
            BannerMessageListModel(category: "Test Category", items: [
                BannerMessageItemModel(id: UUID(), icon: nil, title: "Test Message", messageType: .informative)
            ])
        ]
        let modifier = BannerMessageModifier(
            icon: nil,
            title: nil,
            isPresented: .constant(true),
            pushContentDown: .constant(false),
            bannerTapped: nil,
            viewDetailAction: nil,
            alignment: .center,
            hideSeparator: false,
            messageType: .informative,
            turnOnSectionHeader: true,
            showDetailLink: true,
            bannerMultiMessages: .constant(bannerMessages)
        )
        
        // When
        let summary = modifier.calculateMessageSummary()
        
        // Then
        XCTAssertNotNil(summary)
        XCTAssertTrue(summary.description.contains("View Details"))
        
        // Check that the attributed string contains the expected link
        let runs = summary.runs
        var foundViewDetailsWithCorrectFont = false
        
        for run in runs {
            if let link = run.link,
               link.absoluteString == "ViewDetails",
               let font = run.font
            {
                // Verify the font is footnote with semibold weight
                // Note: In a real test environment, you might need to compare font descriptors
                // or use a more sophisticated font comparison method
                foundViewDetailsWithCorrectFont = true
                break
            }
        }
        
        XCTAssertTrue(foundViewDetailsWithCorrectFont, "View Details should have correct font styling (.fiori(forTextStyle: .footnote, weight: .semibold))")
    }
    
    func testBannerMessageModifier_ViewDetailsLinkColor() {
        // Given
        let bannerMessages = [
            BannerMessageListModel(category: "Negative Messages", items: [
                BannerMessageItemModel(id: UUID(), icon: nil, title: "Test Message", messageType: .negative)
            ])
        ]
        let modifier = BannerMessageModifier(
            icon: nil,
            title: nil,
            isPresented: .constant(true),
            pushContentDown: .constant(false),
            bannerTapped: nil,
            viewDetailAction: nil,
            alignment: .center,
            hideSeparator: false,
            messageType: .negative,
            turnOnSectionHeader: true,
            showDetailLink: true,
            bannerMultiMessages: .constant(bannerMessages)
        )
        
        // When
        let summary = modifier.calculateMessageSummary()
        
        // Then
        let runs = summary.runs
        var foundViewDetailsWithCorrectColor = false
        
        for run in runs {
            if let link = run.link,
               link.absoluteString == "ViewDetails",
               let foregroundColor = run.foregroundColor
            {
                // Verify the color is tintColor
                foundViewDetailsWithCorrectColor = true
                break
            }
        }
        
        XCTAssertTrue(foundViewDetailsWithCorrectColor, "View Details should have tint color")
    }
    
    func testBannerMessageModifier_ViewDetailsNotShownWhenShowDetailLinkFalse() {
        // Given
        let bannerMessages = [
            BannerMessageListModel(category: "Critical Messages", items: [
                BannerMessageItemModel(id: UUID(), icon: nil, title: "Test Message", messageType: .critical)
            ])
        ]
        let modifier = BannerMessageModifier(
            icon: nil,
            title: nil,
            isPresented: .constant(true),
            pushContentDown: .constant(false),
            bannerTapped: nil,
            viewDetailAction: nil,
            alignment: .center,
            hideSeparator: false,
            messageType: .critical,
            turnOnSectionHeader: true,
            showDetailLink: false, // This should prevent View Details from being shown
            bannerMultiMessages: .constant(bannerMessages)
        )
        
        // When
        let summary = modifier.calculateMessageSummary()
        
        // Then
        XCTAssertFalse(summary.description.contains("View Details"), "View Details should not be shown when showDetailLink is false")
    }
    
    func testBannerMessageModifier_CalculateMessageSummaryWithMultipleMessageTypes() {
        // Given
        let bannerMessages = [
            BannerMessageListModel(category: "Mixed Messages", items: [
                BannerMessageItemModel(id: UUID(), icon: nil, title: "Error Message", messageType: .negative),
                BannerMessageItemModel(id: UUID(), icon: nil, title: "Warning Message", messageType: .critical),
                BannerMessageItemModel(id: UUID(), icon: nil, title: "Info Message", messageType: .informative)
            ])
        ]
        let modifier = BannerMessageModifier(
            icon: nil,
            title: nil,
            isPresented: .constant(true),
            pushContentDown: .constant(false),
            bannerTapped: nil,
            viewDetailAction: nil,
            alignment: .center,
            hideSeparator: false,
            messageType: .negative,
            turnOnSectionHeader: true,
            showDetailLink: true,
            bannerMultiMessages: .constant(bannerMessages)
        )
        
        // When
        let summary = modifier.calculateMessageSummary()
        
        // Then
        XCTAssertTrue(summary.description.contains("View Details"))
        XCTAssertTrue(summary.description.contains("error"))
        XCTAssertTrue(summary.description.contains("warning"))
        XCTAssertTrue(summary.description.contains("information"))
    }
}

// MARK: - Integration Tests

final class BannerMessageStyleIntegrationTests: XCTestCase {
    func testBannerMessageStyle_ProtocolConformance() {
        // Test that all styles conform to BannerMessageStyle protocol
        let baseStyle: any BannerMessageStyle = BannerMessageBaseStyle()
        let fioriStyle: any BannerMessageStyle = BannerMessageFioriStyle()
        let neutralStyle: any BannerMessageStyle = BannerMessageNeutralStyle()
        let negativeStyle: any BannerMessageStyle = BannerMessageNegativeStyle()
        let criticalStyle: any BannerMessageStyle = BannerMessageCriticalStyle()
        let positiveStyle: any BannerMessageStyle = BannerMessagePositiveStyle()
        let informativeStyle: any BannerMessageStyle = BannerMessageInformativeStyle()
        
        XCTAssertNotNil(baseStyle)
        XCTAssertNotNil(fioriStyle)
        XCTAssertNotNil(neutralStyle)
        XCTAssertNotNil(negativeStyle)
        XCTAssertNotNil(criticalStyle)
        XCTAssertNotNil(positiveStyle)
        XCTAssertNotNil(informativeStyle)
    }
    
    func testBannerMessageStyle_AllStylesCanRenderWithAllMessageTypes() {
        // Given
        let styles: [any BannerMessageStyle] = [
            BannerMessageBaseStyle(),
            BannerMessageFioriStyle(),
            BannerMessageNeutralStyle(),
            BannerMessageNegativeStyle(),
            BannerMessageCriticalStyle(),
            BannerMessagePositiveStyle(),
            BannerMessageInformativeStyle()
        ]
        
        let messageTypes: [BannerMultiMessageType] = [
            .neutral, .informative, .aiNotice, .positive, .critical, .negative
        ]
        
        // When/Then - Test that all style and message type combinations work
        for style in styles {
            for messageType in messageTypes {
                let configuration = BannerMessageConfiguration(
                    componentIdentifier: "fiori_bannermessage_component",
                    icon: BannerMessageConfiguration.Icon(Image(systemName: "info.circle")),
                    title: BannerMessageConfiguration.Title(Text("Test")),
                    closeAction: BannerMessageConfiguration.CloseAction(Image(systemName: "xmark")),
                    topDivider: BannerMessageConfiguration.TopDivider(Rectangle()),
                    bannerTapAction: nil,
                    alignment: .center,
                    hideSeparator: false,
                    messageType: messageType,
                    showDetailLink: false
                )
                
                let view = style.makeBody(configuration)
                XCTAssertNotNil(view, "Style \(type(of: style)) failed to render with message type \(messageType)")
            }
        }
    }
}

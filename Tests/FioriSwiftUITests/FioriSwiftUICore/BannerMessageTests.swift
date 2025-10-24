@testable import FioriSwiftUICore
import SwiftUI
import XCTest

// If using ViewInspector, uncomment the next line and ensure it's added as a test dependency
// import ViewInspector

final class BannerMessageTests: XCTestCase {
    // MARK: - Basic Initialization Tests
    
    func testBannerMessage_DefaultInitialization() {
        // Given/When
        let bannerMessage = BannerMessage(title: { Text("Test Message") })
        
        // Then
        XCTAssertNotNil(bannerMessage)
        XCTAssertEqual(bannerMessage.componentIdentifier, BannerMessage.identifier)
        XCTAssertEqual(bannerMessage.alignment, .center)
        XCTAssertEqual(bannerMessage.hideSeparator, false)
        XCTAssertEqual(bannerMessage.messageType, .negative)
        XCTAssertEqual(bannerMessage.showDetailLink, false)
        XCTAssertNil(bannerMessage.bannerTapAction)
    }
    
    func testBannerMessage_InitializationWithAttributedString() {
        // Given
        let attributedTitle = AttributedString("Test Attributed Message")
        
        // When
        let bannerMessage = BannerMessage(title: attributedTitle)
        
        // Then
        XCTAssertNotNil(bannerMessage)
        XCTAssertEqual(bannerMessage.componentIdentifier, BannerMessage.identifier)
    }
    
    func testBannerMessage_InitializationWithIcon() {
        // Given
        let icon = Image(systemName: "exclamationmark.triangle")
        let attributedTitle = AttributedString("Test Message with Icon")
        
        // When
        let bannerMessage = BannerMessage(icon: icon, title: attributedTitle)
        
        // Then
        XCTAssertNotNil(bannerMessage)
    }
    
    // MARK: - Message Type Tests
    
    func testBannerMessage_NeutralMessageType() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Neutral Message") },
            messageType: .neutral
        )
        
        // Then
        XCTAssertEqual(bannerMessage.messageType, .neutral)
    }
    
    func testBannerMessage_InformativeMessageType() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Informative Message") },
            messageType: .informative
        )
        
        // Then
        XCTAssertEqual(bannerMessage.messageType, .informative)
    }
    
    func testBannerMessage_AINoticeMessageType() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("AI Notice Message") },
            messageType: .aiNotice
        )
        
        // Then
        XCTAssertEqual(bannerMessage.messageType, .aiNotice)
    }
    
    func testBannerMessage_PositiveMessageType() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Positive Message") },
            messageType: .positive
        )
        
        // Then
        XCTAssertEqual(bannerMessage.messageType, .positive)
    }
    
    func testBannerMessage_CriticalMessageType() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Critical Message") },
            messageType: .critical
        )
        
        // Then
        XCTAssertEqual(bannerMessage.messageType, .critical)
    }
    
    func testBannerMessage_NegativeMessageType() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Negative Message") },
            messageType: .negative
        )
        
        // Then
        XCTAssertEqual(bannerMessage.messageType, .negative)
    }
    
    // MARK: - Alignment Tests
    
    func testBannerMessage_LeadingAlignment() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Leading Aligned Message") },
            alignment: .leading
        )
        
        // Then
        XCTAssertEqual(bannerMessage.alignment, .leading)
    }
    
    func testBannerMessage_CenterAlignment() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Center Aligned Message") },
            alignment: .center
        )
        
        // Then
        XCTAssertEqual(bannerMessage.alignment, .center)
    }
    
    func testBannerMessage_TrailingAlignment() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Trailing Aligned Message") },
            alignment: .trailing
        )
        
        // Then
        XCTAssertEqual(bannerMessage.alignment, .trailing)
    }
    
    // MARK: - Property Tests
    
    func testBannerMessage_HideSeparatorTrue() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Message with Hidden Separator") },
            hideSeparator: true
        )
        
        // Then
        XCTAssertTrue(bannerMessage.hideSeparator)
    }
    
    func testBannerMessage_HideSeparatorFalse() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Message with Visible Separator") },
            hideSeparator: false
        )
        
        // Then
        XCTAssertFalse(bannerMessage.hideSeparator)
    }
    
    func testBannerMessage_ShowDetailLinkTrue() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Message with Detail Link") },
            showDetailLink: true
        )
        
        // Then
        XCTAssertTrue(bannerMessage.showDetailLink)
    }
    
    func testBannerMessage_ShowDetailLinkFalse() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Message without Detail Link") },
            showDetailLink: false
        )
        
        // Then
        XCTAssertFalse(bannerMessage.showDetailLink)
    }
    
    // MARK: - Action Tests
    
    func testBannerMessage_BannerTapAction() {
        // Given
        var actionCalled = false
        let tapAction = { actionCalled = true }
        
        // When
        let bannerMessage = BannerMessage(
            title: { Text("Tappable Message") },
            bannerTapAction: tapAction
        )
        
        // Then
        XCTAssertNotNil(bannerMessage.bannerTapAction)
        bannerMessage.bannerTapAction?()
        XCTAssertTrue(actionCalled)
    }
    
    func testBannerMessage_NoBannerTapAction() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Non-tappable Message") },
            bannerTapAction: nil
        )
        
        // Then
        XCTAssertNil(bannerMessage.bannerTapAction)
    }
    
    // MARK: - Custom Component Identifier Tests
    
    func testBannerMessage_CustomComponentIdentifier() {
        // Given
        let customIdentifier = "custom_banner_identifier"
        
        // When
        let bannerMessage = BannerMessage(
            title: { Text("Custom Identifier Message") },
            componentIdentifier: customIdentifier
        )
        
        // Then
        XCTAssertEqual(bannerMessage.componentIdentifier, customIdentifier)
    }
    
    func testBannerMessage_DefaultComponentIdentifier() {
        // Given/When
        let bannerMessage = BannerMessage(
            title: { Text("Default Identifier Message") }
        )
        
        // Then
        XCTAssertEqual(bannerMessage.componentIdentifier, BannerMessage.identifier)
        XCTAssertEqual(BannerMessage.identifier, "fiori_bannermessage_component")
    }
    
    // MARK: - Configuration Tests
    
    func testBannerMessage_FullConfiguration() {
        // Given
        var actionCalled = false
        let tapAction = { actionCalled = true }
        
        // When
        let bannerMessage = BannerMessage(
            icon: { Image(systemName: "info.circle") },
            title: { Text("Full Configuration Message") },
            closeAction: { FioriButton { _ in Image(systemName: "xmark") } },
            topDivider: { Rectangle().fill(Color.blue).frame(height: 2) },
            bannerTapAction: tapAction,
            alignment: .leading,
            hideSeparator: true,
            messageType: .informative,
            showDetailLink: true,
            componentIdentifier: "test_banner"
        )
        
        // Then
        XCTAssertNotNil(bannerMessage)
        XCTAssertEqual(bannerMessage.alignment, .leading)
        XCTAssertTrue(bannerMessage.hideSeparator)
        XCTAssertEqual(bannerMessage.messageType, .informative)
        XCTAssertTrue(bannerMessage.showDetailLink)
        XCTAssertEqual(bannerMessage.componentIdentifier, "test_banner")
        XCTAssertNotNil(bannerMessage.bannerTapAction)
        
        bannerMessage.bannerTapAction?()
        XCTAssertTrue(actionCalled)
    }
    
    // MARK: - View Tests
    
    func testBannerMessage_AsView() {
        // Given/When
        let bannerMessage = BannerMessage(title: { Text("View Test Message") })
        let view = bannerMessage as any View
        
        // Then
        XCTAssertNotNil(view)
    }
    
    func testBannerMessage_ViewBody() {
        // Given/When
        let bannerMessage = BannerMessage(title: { Text("Body Test Message") })
        let body = bannerMessage.body
        
        // Then
        XCTAssertNotNil(body)
    }
}

// MARK: - BannerMultiMessageType Tests

final class BannerMultiMessageTypeTests: XCTestCase {
    func testBannerMultiMessageType_RawValues() {
        // Test that each message type has the expected raw value
        XCTAssertEqual(BannerMultiMessageType.neutral.rawValue, 0)
        XCTAssertEqual(BannerMultiMessageType.informative.rawValue, 1)
        XCTAssertEqual(BannerMultiMessageType.aiNotice.rawValue, 2)
        XCTAssertEqual(BannerMultiMessageType.positive.rawValue, 3)
        XCTAssertEqual(BannerMultiMessageType.critical.rawValue, 4)
        XCTAssertEqual(BannerMultiMessageType.negative.rawValue, 5)
    }
    
    func testBannerMultiMessageType_InitFromRawValue() {
        // Test initialization from raw values
        XCTAssertEqual(BannerMultiMessageType(rawValue: 0), .neutral)
        XCTAssertEqual(BannerMultiMessageType(rawValue: 1), .informative)
        XCTAssertEqual(BannerMultiMessageType(rawValue: 2), .aiNotice)
        XCTAssertEqual(BannerMultiMessageType(rawValue: 3), .positive)
        XCTAssertEqual(BannerMultiMessageType(rawValue: 4), .critical)
        XCTAssertEqual(BannerMultiMessageType(rawValue: 5), .negative)
        XCTAssertNil(BannerMultiMessageType(rawValue: 99))
    }
    
    func testBannerMultiMessageType_AllCases() {
        // Test that all cases are defined
        let allTypes: [BannerMultiMessageType] = [
            .neutral, .informative, .aiNotice, .positive, .critical, .negative
        ]
        
        XCTAssertEqual(allTypes.count, 6)
    }
}

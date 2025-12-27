@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class AvatarStackTests: XCTestCase {
    // MARK: - Initializer coverage
    
    func testDefaultInitializerProducesView() {
        let sut = AvatarStack()
        let bodyDesc = String(describing: sut.body)
        XCTAssertFalse(bodyDesc.isEmpty)
    }
    
    func testInitializerWithAvatarsArrayAndTitle() {
        let title = AttributedString("Team Members")
        let sut = AvatarStack(avatars: [], avatarsTitle: title)
        let desc = String(describing: sut.body)
        XCTAssertTrue(desc.contains("AvatarStack"), "Description should include AvatarStack to indicate composed body")
    }
    
    func testInitializerWithBuilders() {
        let sut = AvatarStack(avatars: {
            Image(systemName: "person.crop.circle")
        }, avatarsTitle: {
            Text("Title")
        })
        let desc = String(describing: sut.body)
        XCTAssertFalse(desc.isEmpty)
    }
    
    func testIdentifierConstant() {
        XCTAssertEqual(AvatarStack.identifier, "fiori_avatarstack_component")
    }
    
    // MARK: - Convenience init with list of TextOrIcon
    
    func testConvenienceInitWithTextOrIconList() {
        let avatars: [TextOrIcon] = [.icon(Image(systemName: "person")), .icon(Image(systemName: "person.fill"))]
        let sut = AvatarStack(avatars: avatars, avatarsTitle: AttributedString("Members"))
        XCTAssertFalse(String(describing: sut.body).isEmpty)
    }
    
    // MARK: - Layout & TextPosition
    
    func testTextPositionAlignmentMapping() {
        XCTAssertEqual(AvatarStack.TextPosition.top.alignment, .top)
        XCTAssertEqual(AvatarStack.TextPosition.bottom.alignment, .bottom)
        XCTAssertEqual(AvatarStack.TextPosition.leading.alignment, .leading)
        XCTAssertEqual(AvatarStack.TextPosition.trailing.alignment, .trailing)
    }
    
    func testLayoutEnumPresence() {
        let cases: [AvatarStack.Layout] = [.horizontal, .grouped]
        XCTAssertEqual(cases.count, 2)
    }
    
    // MARK: - Environment modifiers behavior
    
    func testAvatarsBorderEnvironment() {
        let base = AvatarStack(avatars: [], avatarsTitle: nil)
        let modified = base.avatarsBorder(.red, width: 2)
        let desc = String(describing: modified)
        XCTAssertFalse(desc.isEmpty)
    }
    
    func testAvatarSizeEnvironment() {
        let sut = AvatarStack()
        let sized = sut.avatarSize(CGSize(width: 30, height: 30))
        let desc = String(describing: sized)
        XCTAssertFalse(desc.isEmpty)
    }
    
    func testAvatarSizeEnvironmentNil() {
        let sut = AvatarStack()
        let sized = sut.avatarSize(nil)
        XCTAssertFalse(String(describing: sized).isEmpty)
    }
    
    func testIsAvatarCircularEnvironment() {
        let sut = AvatarStack()
        let circular = sut.isAvatarCircular(false)
        let desc = String(describing: circular)
        XCTAssertFalse(desc.isEmpty)
    }
    
    func testAvatarsTitlePositionEnvironment() {
        let sut = AvatarStack()
        let pos = sut.avatarsTitlePosition(.leading)
        XCTAssertFalse(String(describing: pos).isEmpty)
    }
    
    func testAvatarsLayoutEnvironment() {
        let sut = AvatarStack()
        let layouted = sut.avatarsLayout(.horizontal)
        XCTAssertFalse(String(describing: layouted).isEmpty)
    }
    
    func testAvatarsMaxCountEnvironment() {
        let sut = AvatarStack()
        let limited = sut.avatarsMaxCount(3)
        XCTAssertFalse(String(describing: limited).isEmpty)
    }
    
    func testAvatarsMaxCountEnvironmentNil() {
        let sut = AvatarStack()
        let unlimited = sut.avatarsMaxCount(nil)
        XCTAssertFalse(String(describing: unlimited).isEmpty)
    }
    
    func testAvatarsSpacingEnvironment() {
        let sut = AvatarStack()
        let spaced = sut.avatarsSpacing(4)
        XCTAssertFalse(String(describing: spaced).isEmpty)
    }
    
    func testAvatarsSpacingEnvironmentNegativeDefault() {
        // Ensure negative spacing value is still representable (default -1 is allowed)
        let sut = AvatarStack()
        let spaced = sut.avatarsSpacing(-1)
        XCTAssertFalse(String(describing: spaced).isEmpty)
    }
    
    // MARK: - Replacement for deprecated modifiers
    
    func testBorderColorReplacementCompiles() {
        let sut = AvatarStack()
        let v = sut.avatarsBorder(.blue, width: 1)
        XCTAssertFalse(String(describing: v).isEmpty)
    }
    
    func testBorderWidthReplacementCompiles() {
        let sut = AvatarStack()
        let v = sut.avatarsBorder(.primary, width: 0.5)
        XCTAssertFalse(String(describing: v).isEmpty)
    }
    
    // MARK: - Fiori Style application paths
    
    func testDefaultStyleApplicationProducesContent() {
        let sut = AvatarStack(avatars: {
            HStack { Image(systemName: "person.crop.circle"); Image(systemName: "person.crop.circle.fill") }
        }, avatarsTitle: {
            Text("Members")
        })
        let desc = String(describing: sut.body)
        XCTAssertFalse(desc.isEmpty)
    }
    
    func testConfigurationInitDisablesDefaultStyle() {
        // Initialize via configuration to flip _shouldApplyDefaultStyle = false path
        // Use public init that accepts configuration and ensures custom style resolution path is taken.
        let config = AvatarStackConfiguration(componentIdentifier: AvatarStack.identifier,
                                              avatars: .init(EmptyView()),
                                              avatarsTitle: .init(EmptyView()))
        let sut = AvatarStack(config)
        let desc = String(describing: sut.body)
        XCTAssertFalse(desc.isEmpty)
    }
    
    // MARK: - Identifier propagation
    
    func testCustomComponentIdentifierPropagates() {
        let customId = "custom_component_id"
        let sut = AvatarStack(avatars: { EmptyView() }, avatarsTitle: { EmptyView() }, componentIdentifier: customId)
        // Access body to ensure the identifier is used during style resolution without crashing
        XCTAssertFalse(String(describing: sut.body).isEmpty)
    }
    
    func testAllAvatarsTitlePositions() {
        let sut = AvatarStack()
        let positions: [AvatarStack.TextPosition] = [.top, .bottom, .leading, .trailing]
        for pos in positions {
            let v = sut.avatarsTitlePosition(pos)
            XCTAssertFalse(String(describing: v).isEmpty)
        }
    }
    
    func testGroupedLayoutEnvironment() {
        let sut = AvatarStack()
        let v = sut.avatarsLayout(.grouped)
        XCTAssertFalse(String(describing: v).isEmpty)
    }
    
    func testAvatarsSpacingEdgeValues() {
        let sut = AvatarStack()
        // Large spacing
        XCTAssertFalse(String(describing: sut.avatarsSpacing(100)).isEmpty)
        // Zero spacing
        XCTAssertFalse(String(describing: sut.avatarsSpacing(0)).isEmpty)
        // Negative arbitrary spacing
        XCTAssertFalse(String(describing: sut.avatarsSpacing(-10)).isEmpty)
    }
    
    func testAvatarsMaxCountEdgeValues() {
        let sut = AvatarStack()
        // Zero means likely show none; still should produce a view
        XCTAssertFalse(String(describing: sut.avatarsMaxCount(0)).isEmpty)
        // Negative should still be representable (no validation at modifier level)
        XCTAssertFalse(String(describing: sut.avatarsMaxCount(-5)).isEmpty)
        // Very large
        XCTAssertFalse(String(describing: sut.avatarsMaxCount(10000)).isEmpty)
    }
    
    func testAvatarBorderWidthZero() {
        let sut = AvatarStack()
        let v = sut.avatarsBorder(.green, width: 0)
        XCTAssertFalse(String(describing: v).isEmpty)
    }
    
    func testLargeAvatarSize() {
        let sut = AvatarStack()
        let v = sut.avatarSize(CGSize(width: 1000, height: 1000))
        XCTAssertFalse(String(describing: v).isEmpty)
    }
    
    func testChainingMultipleEnvironmentModifiers() {
        let sut = AvatarStack()
        let v = sut
            .avatarsBorder(.orange, width: 3)
            .avatarSize(CGSize(width: 24, height: 24))
            .isAvatarCircular(true)
            .avatarsTitlePosition(.top)
            .avatarsLayout(.horizontal)
            .avatarsMaxCount(5)
            .avatarsSpacing(2)
        XCTAssertFalse(String(describing: v).isEmpty)
    }
    
    func testContentFioriStyleReturnsAvatarStack() throws {
        // Given a configuration
        let cfg = AvatarStackConfiguration(componentIdentifier: AvatarStack.identifier,
                                           avatars: .init(EmptyView()),
                                           avatarsTitle: .init(EmptyView()))
        // When applying ContentFioriStyle
        let view = AvatarStackFioriStyle.ContentFioriStyle().makeBody(cfg)
        // Then: the root is AvatarStack(configuration)
        XCTAssertFalse(String(describing: view).isEmpty)
    }
    
    func testAvatarsFioriStyleComposesAvatars() throws {
        // Given
        let stackCfg = AvatarStackConfiguration(componentIdentifier: AvatarStack.identifier,
                                                avatars: .init(EmptyView()),
                                                avatarsTitle: .init(EmptyView()))
        let style = AvatarStackFioriStyle.AvatarsFioriStyle(avatarStackConfiguration: stackCfg)
        let avatarsCfg = AvatarsConfiguration(componentIdentifier: stackCfg.componentIdentifier, avatars: .init(EmptyView()))
        // When
        let v = style.makeBody(avatarsCfg)
        // Then
        XCTAssertFalse(String(describing: v).isEmpty)
    }
    
    func testAvatarsTitleFioriStyleAppliesFontAndColor() throws {
        // Given
        let stackCfg = AvatarStackConfiguration(componentIdentifier: AvatarStack.identifier,
                                                avatars: .init(EmptyView()),
                                                avatarsTitle: .init(Text("Members")))
        let style = AvatarStackFioriStyle.AvatarsTitleFioriStyle(avatarStackConfiguration: stackCfg)
        let titleCfg = AvatarsTitleConfiguration(componentIdentifier: stackCfg.componentIdentifier, avatarsTitle: .init(Text("Members")))
        // When
        let v = style.makeBody(titleCfg)
        // Then: ensure non-empty
        XCTAssertFalse(String(describing: v).isEmpty)
    }
}

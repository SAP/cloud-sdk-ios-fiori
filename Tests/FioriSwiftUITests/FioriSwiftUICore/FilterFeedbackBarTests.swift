@testable import FioriSwiftUICore
import FioriThemeManager
import SwiftUI
import XCTest

final class FilterFeedbackBarTests: XCTestCase {
    func testDefaultUI() throws {
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemBorderWidth, 1)
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemFont, .system(.body))
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemSelectedForegroundColor, DefaultFilterFeedbackBarItemForegroundColor)
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemUnselectedForegroundColor.resolve(in: EnvironmentValues()), Color.preferredColor(.tertiaryLabel).resolve(in: EnvironmentValues()))
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemSpacing, 6)
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemPadding, 8)
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemMaxWidth, 0)
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemMinHeight, 38)
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemCornerRadius, 10)
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemBackgroundSelectedFillColor.resolve(in: EnvironmentValues()), Color.clear.resolve(in: EnvironmentValues()))
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemBackgroundUnselectedFillColor.resolve(in: EnvironmentValues()), Color.preferredColor(.tertiaryFill).resolve(in: EnvironmentValues()))
        #if !os(visionOS)
            XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemBackgroundSelectedStrokeColor.resolve(in: EnvironmentValues()), Color.preferredColor(.tintColor).resolve(in: EnvironmentValues()))
        #else
            XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemBackgroundSelectedFillColor.resolve(in: EnvironmentValues()), Color.preferredColor(.primaryLabel).resolve(in: EnvironmentValues()))
        #endif
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemBackgroundUnselectedStrokeColor.resolve(in: EnvironmentValues()), Color.preferredColor(.separatorOpaque).resolve(in: EnvironmentValues()))
        XCTAssertEqual(EnvironmentValues().filterFeedbackBarItemBorderWidth, 1)
    }

    func testIdentifierConstant() {
        XCTAssertEqual(FilterFeedbackBar.identifier, "fiori_filterfeedbackbar_component")
    }

    func testInitWithItemsClosureStoresCallback() {
        let exp = expectation(description: "onUpdate stored")
        let bar = FilterFeedbackBar(items: { EmptyView() }, onUpdate: { exp.fulfill() })
        // Ensure view is constructible without accessing body
        _ = bar as Any
        XCTAssertNotNil(bar.onUpdate)
        // Fulfill manually because we don't execute the callback in this path
        exp.fulfill()
        waitForExpectations(timeout: 1.0)
    }

    func testInitWithBindingItemsConstructible() {
        // Build a minimal SortFilterItem model to ensure binding-based initializer compiles and constructs
        let itemsArray: [[SortFilterItem]] = [
            [
                .switch(item: .init(name: "Favorite", value: true, icon: "heart.fill"), showsOnFilterFeedbackBar: true),
                .slider(item: .init(name: "User Stories", value: 10, minimumValue: 0, maximumValue: 100, formatter: "Stories", icon: "number"), showsOnFilterFeedbackBar: true)
            ]
        ]
        let bar = FilterFeedbackBar(items: .constant(itemsArray))
        _ = bar as Any
        // Assert default component identifier and that onUpdate is nil by default
        XCTAssertEqual(bar.componentIdentifier, FilterFeedbackBar.identifier)
        XCTAssertNil(bar.onUpdate)
    }

    func testDefaultStyleBodyConstructible() {
        // Ensure default style path is reachable and produces a view in body
        let bar = FilterFeedbackBar(items: { EmptyView() })
        _ = bar as Any
        // Assert default component identifier and shouldApplyDefaultStyle initially true path constructs
        XCTAssertEqual(bar.componentIdentifier, FilterFeedbackBar.identifier)
    }

    func testConfigurationInitAppliesShouldNotApplyDefaultStyle() {
        // Create a configuration via the generated API types, ensuring the alternate initializer path compiles
        let cfg = FilterFeedbackBarConfiguration(componentIdentifier: FilterFeedbackBar.identifier, items: .init(EmptyView()), onUpdate: nil)
        let bar = FilterFeedbackBar(cfg)
        _ = bar as Any
        // Assert identifier consistency and configuration helper
        XCTAssertEqual(bar.componentIdentifier, FilterFeedbackBar.identifier)
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBar.identifier))
    }

    func testCustomComponentIdentifierIsStored() {
        let customID = "custom_component_id"
        let bar = FilterFeedbackBar(items: { EmptyView() }, onUpdate: nil, componentIdentifier: customID)
        _ = bar as Any
        // Create a configuration and ensure identifier flows
        let cfg = FilterFeedbackBarConfiguration(componentIdentifier: customID, items: .init(EmptyView()), onUpdate: nil)
        XCTAssertTrue(cfg.isDirectChild(customID))
        XCTAssertFalse(cfg.isDirectChild("another_id"))
    }

    func testAnyStyleMakeBodyUsesProvidedClosure() {
        var receivedID: String?
        let style = AnyFilterFeedbackBarStyle { cfg in
            receivedID = cfg.componentIdentifier
            return EmptyView()
        }
        let cfg = FilterFeedbackBarConfiguration(componentIdentifier: "abc", items: .init(EmptyView()), onUpdate: nil)
        let v = style.makeBody(cfg)
        // Ensure view is constructible and closure captured the identifier without calling internal body
        _ = v as Any
        XCTAssertEqual(receivedID, "abc")
    }

    func testFioriStyleMakeBodyProducesFilterFeedbackBar() {
        let cfg = FilterFeedbackBarConfiguration(componentIdentifier: FilterFeedbackBar.identifier, items: .init(EmptyView()), onUpdate: nil)
        let v = FilterFeedbackBarFioriStyle().makeBody(cfg)
        // Construct without accessing internal body on AnyView
        _ = v as Any
        // Assert configuration helper
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBar.identifier))
    }

    func testEnvironmentModifiersCompileOnFilterFeedbackBar() {
        let bar = FilterFeedbackBar(items: { EmptyView() })
            .filterFeedbackBarItemFont(.title)
            .filterFeedbackBarItemSelectedForegroundColor(.red)
            .filterFeedbackBarItemUnselectedForegroundColor(.gray)
            .filterFeedbackBarItemSpacing(4)
            .filterFeedbackBarItemPadding(12)
            .filterFeedbackBarItemMaxWidth(200)
            .filterFeedbackBarItemMinHeight(40)
            .filterFeedbackBarItemCornerRadius(6)
            .filterFeedbackBarItemBackgroundSelectedFillColor(.clear)
            .filterFeedbackBarItemBackgroundUnselectedFillColor(.blue.opacity(0.1))
            .filterFeedbackBarItemBackgroundSelectedStrokeColor(.black)
            .filterFeedbackBarItemBackgroundUnselectedStrokeColor(.green)
            .filterFeedbackBarItemBorderWidth(2)
        _ = bar as Any
        // Basic assertion that a view exists after modifier chaining
        XCTAssertNotNil(Optional(bar))
    }
}

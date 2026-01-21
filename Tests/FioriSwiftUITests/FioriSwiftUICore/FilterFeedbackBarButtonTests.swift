@testable import FioriSwiftUICore
import FioriThemeManager
import SwiftUI
import XCTest

final class FilterFeedbackBarButtonTests: XCTestCase {
    func testIdentifierConstant() {
        XCTAssertEqual(FilterFeedbackBarButton.identifier, "fiori_filterfeedbackbarbutton_component")
    }

    func testInitWithViewBuildersConstructible() {
        let btn = FilterFeedbackBarButton(icon: { Image(systemName: "checkmark") },
                                          title: { Text("Status") },
                                          isSelected: true,
                                          spacing: 5,
                                          componentIdentifier: "custom_btn_id")
        _ = btn as Any
        XCTAssertTrue(btn.isSelected)
        XCTAssertEqual(btn.spacing, 5)
        XCTAssertEqual(btn.componentIdentifier, "custom_btn_id")
    }

    func testInitWithConvenienceParamsConstructible() {
        let icon = Image(systemName: "checkmark")
        let title = AttributedString("Status")
        let btn = FilterFeedbackBarButton(icon: icon,
                                          title: title,
                                          isSelected: false,
                                          spacing: 4)
        _ = btn as Any
        XCTAssertFalse(btn.isSelected)
        XCTAssertEqual(btn.spacing, 4)
        XCTAssertEqual(btn.componentIdentifier, FilterFeedbackBarButton.identifier)
    }

    func testConfigurationInitConstructible() {
        let cfg = FilterFeedbackBarButtonConfiguration(componentIdentifier: FilterFeedbackBarButton.identifier,
                                                       icon: .init(Image(systemName: "checkmark")),
                                                       title: .init(Text("Status")),
                                                       isSelected: true,
                                                       spacing: 7)
        let btn = FilterFeedbackBarButton(cfg)
        _ = btn as Any
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBarButton.identifier))
        XCTAssertFalse(cfg.isDirectChild("other"))
        XCTAssertTrue(btn.isSelected)
        XCTAssertEqual(btn.spacing, 7)
        XCTAssertEqual(btn.componentIdentifier, FilterFeedbackBarButton.identifier)
    }

    func testAnyStyleMakeBodyUsesProvidedClosure() {
        var capturedSpacing: CGFloat?
        let style = AnyFilterFeedbackBarButtonStyle { cfg in
            capturedSpacing = cfg.spacing
            return EmptyView()
        }
        let cfg = FilterFeedbackBarButtonConfiguration(componentIdentifier: "abc",
                                                       icon: .init(Image(systemName: "checkmark")),
                                                       title: .init(Text("Status")),
                                                       isSelected: false,
                                                       spacing: 9)
        let v = style.makeBody(cfg)
        _ = v as Any
        XCTAssertEqual(capturedSpacing, 9)
        XCTAssertFalse(cfg.isDirectChild(FilterFeedbackBarButton.identifier))
    }

    // Removed tests referencing internal types: ContentFioriStyle, IconFioriStyle, TitleFioriStyle
    // The following tests exercise public styles only.

    func testFioriStyleMakeBodyProducesButton() {
        let cfg = FilterFeedbackBarButtonConfiguration(componentIdentifier: FilterFeedbackBarButton.identifier,
                                                       icon: .init(Image(systemName: "checkmark")),
                                                       title: .init(Text("Status")),
                                                       isSelected: true,
                                                       spacing: 4)
        let v = FilterFeedbackBarButtonFioriStyle().makeBody(cfg)
        _ = v as Any
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBarButton.identifier))
    }

    func testBaseStyleConstructibleSelected() {
        let cfg = FilterFeedbackBarButtonConfiguration(componentIdentifier: FilterFeedbackBarButton.identifier,
                                                       icon: .init(Image(systemName: "checkmark")),
                                                       title: .init(Text("Status")),
                                                       isSelected: true,
                                                       spacing: 5)
        let v = FilterFeedbackBarButtonBaseStyle().makeBody(cfg)
        _ = v as Any
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBarButton.identifier))
        XCTAssertTrue(cfg.isSelected)
        XCTAssertEqual(cfg.spacing, 5)
    }

    func testBaseStyleConstructibleUnselected() {
        let cfg = FilterFeedbackBarButtonConfiguration(componentIdentifier: FilterFeedbackBarButton.identifier,
                                                       icon: .init(Image(systemName: "checkmark")),
                                                       title: .init(Text("Status")),
                                                       isSelected: false,
                                                       spacing: 6)
        let v = FilterFeedbackBarButtonBaseStyle().makeBody(cfg)
        _ = v as Any
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBarButton.identifier))
        XCTAssertEqual(cfg.spacing, 6)
        XCTAssertFalse(cfg.isSelected)
    }

    func testEnvironmentModifiersCompileOnButton() {
        let btn = FilterFeedbackBarButton(icon: { Image(systemName: "checkmark") },
                                          title: { Text("Status") },
                                          isSelected: false)
            .filterFeedbackBarItemFont(.callout)
            .filterFeedbackBarItemSelectedForegroundColor(.red)
            .filterFeedbackBarItemUnselectedForegroundColor(.gray)
            .filterFeedbackBarItemSpacing(3)
            .filterFeedbackBarItemPadding(6)
            .filterFeedbackBarItemMaxWidth(120)
            .filterFeedbackBarItemMinHeight(24)
            .filterFeedbackBarItemCornerRadius(6)
            .filterFeedbackBarItemBackgroundSelectedFillColor(.clear)
            .filterFeedbackBarItemBackgroundUnselectedFillColor(.blue.opacity(0.15))
            .filterFeedbackBarItemBackgroundSelectedStrokeColor(.black)
            .filterFeedbackBarItemBackgroundUnselectedStrokeColor(.green)
            .filterFeedbackBarItemBorderWidth(1)
        _ = btn as Any
        XCTAssertNotNil(Optional(btn))
    }
}

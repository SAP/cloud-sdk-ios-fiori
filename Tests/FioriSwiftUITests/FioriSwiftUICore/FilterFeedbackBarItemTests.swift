@testable import FioriSwiftUICore
import FioriThemeManager
import SwiftUI
import XCTest

final class FilterFeedbackBarItemTests: XCTestCase {
    func testIdentifierConstant() {
        XCTAssertEqual(FilterFeedbackBarItem.identifier, "fiori_filterfeedbackbaritem_component")
    }

    func testInitWithViewBuildersConstructible() {
        let item = FilterFeedbackBarItem(icon: { Image(systemName: "clock") },
                                         title: { Text("Item Title") },
                                         accessoryIcon: { Image(systemName: "chevron.down") },
                                         isSelected: true,
                                         spacing: 8,
                                         componentIdentifier: "custom_id")
        _ = item as Any
        XCTAssertTrue(item.isSelected)
        XCTAssertEqual(item.spacing, 8)
        XCTAssertEqual(item.componentIdentifier, "custom_id")
    }

    func testInitWithConvenienceParamsConstructible() {
        let icon = Image(systemName: "star")
        let accessory = Image(systemName: "chevron.down")
        let title = AttributedString("Title")
        let item = FilterFeedbackBarItem(icon: icon,
                                         title: title,
                                         accessoryIcon: accessory,
                                         isSelected: false,
                                         spacing: 6)
        _ = item as Any
        XCTAssertFalse(item.isSelected)
        XCTAssertEqual(item.spacing, 6)
        XCTAssertEqual(item.componentIdentifier, FilterFeedbackBarItem.identifier)
    }

    func testConfigurationInitConstructible() {
        let cfg = FilterFeedbackBarItemConfiguration(componentIdentifier: FilterFeedbackBarItem.identifier,
                                                     icon: .init(Image(systemName: "clock")),
                                                     title: .init(Text("Item")),
                                                     accessoryIcon: .init(Image(systemName: "chevron.down")),
                                                     isSelected: true,
                                                     spacing: 4)
        let item = FilterFeedbackBarItem(cfg)
        _ = item as Any
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBarItem.identifier))
        XCTAssertFalse(cfg.isDirectChild("another"))
        XCTAssertTrue(item.isSelected)
        XCTAssertEqual(item.spacing, 4)
        XCTAssertEqual(item.componentIdentifier, FilterFeedbackBarItem.identifier)
    }

    func testAnyStyleMakeBodyUsesProvidedClosure() {
        var capturedIsSelected: Bool?
        let style = AnyFilterFeedbackBarItemStyle { cfg in
            capturedIsSelected = cfg.isSelected
            return EmptyView()
        }
        let cfg = FilterFeedbackBarItemConfiguration(componentIdentifier: "abc",
                                                     icon: .init(Image(systemName: "clock")),
                                                     title: .init(Text("Item")),
                                                     accessoryIcon: .init(Image(systemName: "chevron.down")),
                                                     isSelected: false,
                                                     spacing: 6)
        let v = style.makeBody(cfg)
        _ = v as Any
        XCTAssertEqual(capturedIsSelected, false)
        XCTAssertFalse(cfg.isDirectChild(FilterFeedbackBarItem.identifier))
    }

    func testFioriStyleMakeBodyProducesItem() {
        let cfg = FilterFeedbackBarItemConfiguration(componentIdentifier: FilterFeedbackBarItem.identifier,
                                                     icon: .init(Image(systemName: "clock")),
                                                     title: .init(Text("Item")),
                                                     accessoryIcon: .init(Image(systemName: "chevron.down")),
                                                     isSelected: true,
                                                     spacing: 6)
        let v = FilterFeedbackBarItemFioriStyle().makeBody(cfg)
        _ = v as Any
        XCTAssertTrue(cfg.isDirectChild(FilterFeedbackBarItem.identifier))
    }

    func testEnvironmentModifiersCompileOnItem() {
        let item = FilterFeedbackBarItem(icon: { Image(systemName: "clock") },
                                         title: { Text("Item Title") },
                                         accessoryIcon: { Image(systemName: "chevron.down") },
                                         isSelected: false)
            .filterFeedbackBarItemFont(.title2)
            .filterFeedbackBarItemSelectedForegroundColor(.red)
            .filterFeedbackBarItemUnselectedForegroundColor(.gray)
            .filterFeedbackBarItemSpacing(10)
            .filterFeedbackBarItemPadding(5)
            .filterFeedbackBarItemMaxWidth(150)
            .filterFeedbackBarItemMinHeight(30)
            .filterFeedbackBarItemCornerRadius(8)
            .filterFeedbackBarItemBackgroundSelectedFillColor(.clear)
            .filterFeedbackBarItemBackgroundUnselectedFillColor(.blue.opacity(0.2))
            .filterFeedbackBarItemBackgroundSelectedStrokeColor(.black)
            .filterFeedbackBarItemBackgroundUnselectedStrokeColor(.green)
            .filterFeedbackBarItemBorderWidth(2)
        _ = item as Any
        XCTAssertNotNil(Optional(item))
    }
}

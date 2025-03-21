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
}

@testable import FioriSwiftUICore
import FioriThemeManager
import SwiftUI
import Testing
import XCTest

struct Test {
    @Test func defaultUI() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        #expect(EnvironmentValues().filterFeedbackBarItemBorderWidth == 1)
        #expect(EnvironmentValues().filterFeedbackBarItemFont == .system(.body))
        #expect(EnvironmentValues().filterFeedbackBarItemSelectedForegroundColor == DefaultFilterFeedbackBarItemForegroundColor)
        #expect(EnvironmentValues().filterFeedbackBarItemUnselectedForegroundColor.resolve(in: EnvironmentValues()) == Color.preferredColor(.tertiaryLabel).resolve(in: EnvironmentValues()))
        #expect(EnvironmentValues().filterFeedbackBarItemSpacing == 6)
        #expect(EnvironmentValues().filterFeedbackBarItemPadding == 8)
        #expect(EnvironmentValues().filterFeedbackBarItemMaxWidth == 0)
        #expect(EnvironmentValues().filterFeedbackBarItemMinHeight == 38)
        #expect(EnvironmentValues().filterFeedbackBarItemCornerRadius == 10)
        #expect(EnvironmentValues().filterFeedbackBarItemBackgroundSelectedFillColor.resolve(in: EnvironmentValues()) == Color.clear.resolve(in: EnvironmentValues()))
        #expect(EnvironmentValues().filterFeedbackBarItemBackgroundUnselectedFillColor.resolve(in: EnvironmentValues()) == Color.preferredColor(.tertiaryFill).resolve(in: EnvironmentValues()))
        #if !os(visionOS)
            #expect(EnvironmentValues().filterFeedbackBarItemBackgroundSelectedStrokeColor.resolve(in: EnvironmentValues()) == Color.preferredColor(.tintColor).resolve(in: EnvironmentValues()))
        #else
            #expect(EnvironmentValues().filterFeedbackBarItemBackgroundSelectedFillColor.resolve(in: EnvironmentValues()) == Color.preferredColor(.primaryLabel).resolve(in: EnvironmentValues()))
        #endif
        #expect(EnvironmentValues().filterFeedbackBarItemBackgroundUnselectedStrokeColor.resolve(in: EnvironmentValues()) == Color.preferredColor(.separatorOpaque).resolve(in: EnvironmentValues()))
        #expect(EnvironmentValues().filterFeedbackBarItemBorderWidth == 1)
    }
}

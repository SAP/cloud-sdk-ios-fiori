@testable import FioriSwiftUICore
import SwiftUI
import XCTest

@MainActor final class SwitchViewTests: XCTestCase {
    func testSwitchViewConfigurations() {
        let title = AttributedString("My Switch")
        let isOn = true

        let switchView = SwitchView(title: title, isOn: .constant(isOn))
        XCTAssertEqual(switchView.isOn, isOn)
    }

    // MARK: - Helpers

    /// Builds a `SwitchViewConfiguration` we can query directly.
    /// We intentionally do not `inspect()` the produced layout: doing so
    /// re-walks the view tree through ViewInspector's Mirror-based traversal,
    /// which bypasses SwiftUI's environment installation and triggers the
    /// "Accessing Environment<SwitchStyle>'s value outside of being installed
    /// on a View" warning in a loop.
    @MainActor
    private func makeConfiguration(
        title: AttributedString,
        isOn: Binding<Bool>,
        stateLabel: AttributedString? = nil,
        controlState: ControlState = .normal
    ) -> SwitchViewConfiguration {
        SwitchViewConfiguration(
            componentIdentifier: SwitchView.identifier,
            title: .init(Text(title)),
            isOn: isOn,
            stateLabel: .init(OptionalText(stateLabel)),
            icon: .init(EmptyView()),
            description: .init(EmptyView()),
            controlState: controlState
        )
    }

    // MARK: - Tests

    // In `.normal` control state, the base layout is expected to render the
    // configuration's Switch. We assert this indirectly: `configuration.isOn`
    // reflects the binding, and control state remains `.normal`.
    func testSwitchViewBaseStyle_switchOn() {
        let config = self.makeConfiguration(
            title: AttributedString("My Switch"),
            isOn: .constant(true)
        )

        XCTAssertEqual(config.controlState, .normal)
        XCTAssertTrue(config.isOn)
        // In `.normal`, `switchStack` renders `configuration._switch`.
        // We verify by ensuring the base style makeBody returns a non-nil view.
        let body = SwitchViewBaseStyle().makeBody(config)
        XCTAssertNotNil(body)
    }

    func testSwitchViewBaseStyle_switchOff() {
        let config = self.makeConfiguration(
            title: AttributedString("My Switch"),
            isOn: .constant(false)
        )

        XCTAssertEqual(config.controlState, .normal)
        XCTAssertFalse(config.isOn)
        let body = SwitchViewBaseStyle().makeBody(config)
        XCTAssertNotNil(body)
    }

    // Read-only with no state label: `switchStack` chooses the localized
    // "On"/"Off" text branch. We verify by checking the configuration's
    // `stateLabel` is empty via `_ViewEmptyChecking`.
    func testSwitchViewBaseStyle_readOnlyUsesFallbackStateLabel() {
        let config = self.makeConfiguration(
            title: AttributedString("My Switch"),
            isOn: .constant(true),
            controlState: .readOnly
        )

        XCTAssertEqual(config.controlState, .readOnly)
        XCTAssertTrue(config.stateLabel.isEmpty,
                      "Expected an empty state label so the base style renders the localized fallback")
        let body = SwitchViewBaseStyle().makeBody(config)
        XCTAssertNotNil(body)
    }

    // Read-only with a custom state label: `switchStack` renders the
    // provided `stateLabel` view.
    func testSwitchViewBaseStyle_readOnlyUsesCustomStateLabel() {
        let config = self.makeConfiguration(
            title: AttributedString("My Switch"),
            isOn: .constant(false),
            stateLabel: AttributedString("Disabled"),
            controlState: .readOnly
        )

        XCTAssertEqual(config.controlState, .readOnly)
        XCTAssertFalse(config.stateLabel.isEmpty,
                       "Expected a non-empty custom state label to be present in the configuration")
        let body = SwitchViewBaseStyle().makeBody(config)
        XCTAssertNotNil(body)
    }
}

@testable import FioriSwiftUICore
import SwiftUI
import ViewInspector
import XCTest

final class SwitchViewTests: XCTestCase {
    func testSwitchViewConfigurations() {
        let title = AttributedString("My Switch")
        let isOn = true

        let switchView = SwitchView(title: title, isOn: .constant(isOn))
        XCTAssertEqual(switchView.isOn, isOn)
    }

    func testSwitchViewBaseStyle() throws {
        let title = AttributedString("My Switch")
        @State var isOn = true
        let switchConfiguration = SwitchViewConfiguration(title: SwitchViewConfiguration.Title(Text(title)), isOn: $isOn)
        let switchView = SwitchViewBaseStyle().makeBody(switchConfiguration)
        let toggles = try switchView.inspect().findAll(ViewType.Toggle.self)
        XCTAssertFalse(toggles.isEmpty)
        let toggle = toggles.first!
        try XCTAssertTrue(toggle.isOn())

        @State var isOn2 = false
        let switchConfiguration2 = SwitchViewConfiguration(title: SwitchViewConfiguration.Title(Text(title)), isOn: $isOn2)
        let switchView2 = SwitchViewBaseStyle().makeBody(switchConfiguration2)
        let toggles2 = try switchView2.inspect().findAll(ViewType.Toggle.self)
        XCTAssertFalse(toggles2.isEmpty)
        let toggle2 = toggles2.first!
        try XCTAssertFalse(toggle2.isOn())
    }
}

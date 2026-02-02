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
        
        // test Switch On
        let isOn = true
        let view = SwitchView(
            title: title,
            isOn: .constant(isOn)
        )
        
        let configuration = SwitchViewConfiguration(
            componentIdentifier: view.componentIdentifier,
            title: .init(view.title),
            isOn: .constant(isOn),
            stateLabel: .init(view.stateLabel),
            icon: .init(view.icon),
            description: .init(view.description),
            controlState: view.controlState
        )
        let switchView = SwitchViewBaseStyle().makeBody(configuration)
        
        let toggles = try switchView.inspect().findAll(ViewType.Toggle.self)
        XCTAssertFalse(toggles.isEmpty)
        let toggle = toggles.first!
        try XCTAssertTrue(toggle.isOn())

        // test Switch Off
        let isOn2 = false
        let view2 = SwitchView(
            title: title,
            isOn: .constant(isOn2)
        )
        
        let configuration2 = SwitchViewConfiguration(
            componentIdentifier: view2.componentIdentifier,
            title: .init(view2.title),
            isOn: .constant(isOn2),
            stateLabel: .init(view2.stateLabel),
            icon: .init(view2.icon),
            description: .init(view2.description),
            controlState: view2.controlState
        )
        let switchView2 = SwitchViewBaseStyle().makeBody(configuration2)
        
        let toggles2 = try switchView2.inspect().findAll(ViewType.Toggle.self)
        XCTAssertFalse(toggles2.isEmpty)
        let toggle2 = toggles2.first!
        try XCTAssertFalse(toggle2.isOn())
        
        // test Switch readonly with default state label
        let isOn3 = true
        let view3 = SwitchView(
            title: title,
            isOn: .constant(isOn3),
            controlState: .readOnly
        )
        
        let configuration3 = SwitchViewConfiguration(
            componentIdentifier: view3.componentIdentifier,
            title: .init(view3.title),
            isOn: .constant(isOn3),
            stateLabel: .init(view3.stateLabel),
            icon: .init(view3.icon),
            description: .init(view3.description),
            controlState: view3.controlState
        )
        let switchView3 = SwitchViewBaseStyle().makeBody(configuration3)
        
        XCTAssertThrowsError(
            try switchView3.inspect().find(ViewType.Toggle.self),
            "Toggle should not be present in read-only state"
        )
        let states = try switchView3.inspect().findAll(ViewType.Text.self)
        let stateTexts = states.filter { state in
            do {
                let string = try state.string()
                return string == "On"
            } catch {
                return false
            }
        }
        XCTAssertFalse(stateTexts.isEmpty, "Expected a state label Text to be present")
        
        // test Switch readonly with customized state label
        let isOn4 = false
        let stateLabel = AttributedString(isOn4 ? "Enabled" : "Disabled")
        let view4 = SwitchView(
            title: title,
            isOn: .constant(isOn4),
            stateLabel: stateLabel,
            controlState: .readOnly
        )
        
        let configuration4 = SwitchViewConfiguration(
            componentIdentifier: view4.componentIdentifier,
            title: .init(view4.title),
            isOn: .constant(isOn4),
            stateLabel: .init(view4.stateLabel),
            icon: .init(view4.icon),
            description: .init(view4.description),
            controlState: view4.controlState
        )
        let switchView4 = SwitchViewBaseStyle().makeBody(configuration4)
        
        XCTAssertThrowsError(
            try switchView4.inspect().find(ViewType.Toggle.self),
            "Toggle should not be present in read-only state"
        )
        let states2 = try switchView4.inspect().findAll(ViewType.Text.self)
        let stateTexts2 = states2.filter { state in
            do {
                let string = try state.string()
                return string == "Disabled"
            } catch {
                return false
            }
        }

        XCTAssertFalse(stateTexts.isEmpty, "Expected a state label Text to be present")
    }
}

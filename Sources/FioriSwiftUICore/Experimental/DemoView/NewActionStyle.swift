import Foundation
import SwiftUI

// TODO: macro
public protocol NewActionStyle: DynamicProperty {
    associatedtype Body: View
    func makeBody(_ configuration: NewActionConfiguration) -> Body
}

// TODO: macro
public struct NewActionConfiguration {
    let actionTitle: ActionTitle
    let action: (() -> Void)?
    
    public typealias ActionTitle = ConfigurationViewWrapper
}

// MARK: Style implementations

// TODO: macro
// Layout style
public struct NewActionBaseStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        Button(action: configuration.action ?? {}) {
            configuration.actionTitle
        }
    }
}

public struct NewActionFioriStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        NewAction(configuration)
            .actionTitleStyle {
                ActionTitle($0).modifier(ActionTitleFioriStyleModifier())
            }
    }
}

extension NewActionFioriStyle {
    struct ActionTitleFioriStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title)
                .foregroundStyle(Color.preferredColor(.tintColor))
        }
    }
}

// TODO: macro
struct NewActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NewActionStyle] = []
}

// TODO: macro
extension EnvironmentValues {
    var newActionStyleStack: [any NewActionStyle] {
        get { self[NewActionStyleStackKey.self] }
        set { self[NewActionStyleStackKey.self] = newValue }
    }
}

// TODO: macro
extension EnvironmentValues {
    var newActionStyle: any NewActionStyle {
        newActionStyleStack.last ?? .base
    }
}

extension NewActionStyle where Self == NewActionBaseStyle {
    static var base: NewActionBaseStyle {
        NewActionBaseStyle()
    }
}

// #Preview(body: {
//    Action(primaryButton: Button(action: {
//        print("tapped")
//    }, label: {
//        Text("Button12")
//            .foregroundStyle(.red)
//    }))
// })

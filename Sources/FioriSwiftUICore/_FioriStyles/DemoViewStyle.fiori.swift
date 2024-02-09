import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct DemoViewBaseStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        // Add default layout here
        VStack(spacing: 10) {
            configuration.title
            configuration.subtitle
            configuration.status
            configuration.newAction
            configuration._switch
        }
        .padding()
    }
}
    
// Default fiori styles
extension DemoViewFioriStyle {
    struct ContentFioriStyle: DemoViewStyle {
        func makeBody(_ configuration: DemoViewConfiguration) -> some View {
            DemoView(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style here
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
            // Add default style here
        }
    }

    struct StatusFioriStyle: StatusStyle {
        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
            // Add default style here
        }
    }

    struct NewActionFioriStyle: NewActionStyle {
        func makeBody(_ configuration: NewActionConfiguration) -> some View {
            NewAction(configuration)
            // Add default style here
        }
    }
}

/// Show contents in a scrollable horizontal stack
public struct DemoViewHorizontalStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        HStack(spacing: 10) {
            configuration.title
            configuration.subtitle
            configuration.status
            configuration.newAction
            Toggle(isOn: configuration.$isOn, label: {})
        }
        .padding()
    }
}

/// Card style
public struct DemoViewCardStyle: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.secondary)
            }
    }
}

public extension DemoViewStyle where Self == DemoViewHorizontalStyle {
    static var horizontal: Self {
        DemoViewHorizontalStyle()
    }
}

public extension DemoViewStyle where Self == DemoViewCardStyle {
    static var card: Self {
        DemoViewCardStyle()
    }
}

// Testing

struct CustomTagDemoViewStyle: DemoViewStyle {
    let tag: String

    func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        VStack {
            HStack {
                VStack {
                    configuration.title
                    configuration.subtitle
                }

                configuration.status
            }

            HStack {
                Spacer()

                if !configuration.newAction.isEmpty {
                    configuration.newAction
                }
            }
        }
        .overlay(alignment: .topLeading) {
            Text(tag)
                .border(.red)
        }
        .padding()
    }
}

extension DemoViewStyle where Self == CustomTagDemoViewStyle {
    static func tag(_ tag: String) -> Self {
        CustomTagDemoViewStyle(tag: tag)
    }
}

struct CustomComposableDemoViewStyle: DemoViewStyle {
    func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.secondary)
            }
    }
}

extension DemoViewStyle where Self == CustomComposableDemoViewStyle {
    static var roundedBorder: Self {
        CustomComposableDemoViewStyle()
    }
}

struct CustomTitleColorDemoViewStyle: DemoViewStyle {
    let color: Color

    func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .foregroundColor(self.color)
    }
}

extension DemoViewStyle where Self == CustomTitleColorDemoViewStyle {
    static func titleColor(_ color: Color) -> Self {
        CustomTitleColorDemoViewStyle(color: color)
    }
}

public struct CustomNewTitleColorStyle: TitleStyle {
    let color: Color

    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .foregroundStyle(self.color)
    }
}

class Model: ObservableObject {
    @Published var isOn: Bool

    init(isOn: Bool = true) {
        self.isOn = isOn
    }
}

struct Preview: PreviewProvider {
//    @State static var isOn = true
    @StateObject static var model = Model()

    static var previews: some View {
        // 1. Test style propagation
        HStack {
            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: .text("Status"), newAction: FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") }), isOn: $model.isOn)

            Title(title: "Other Title")
                .titleStyle { configuration in
                    Title(configuration)
                        .foregroundStyle(.red)
                }
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .titleStyle { configuration in
//            Title(configuration)
            configuration.title
                .foregroundStyle(.yellow)
        }
        .titleStyle { configuration in
            Title(configuration)
                .foregroundStyle(.blue)
        }
        .newActionStyle {
            NewAction($0)
                .foregroundStyle(Color.red)
        }

        // 2. Test style customization for a specific component
        HStack {
            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: .text("Status"), newAction: FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") }), isOn: $model.isOn)

            Title(title: "Other Title")
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .demoViewStyle(.titleStyle { config in
            Title(config)
                .foregroundStyle(.yellow)
        })

        // 3. Reusable style
        DemoView(title: "DemoView Title", subtitle: "Subtitle", status: .text("Status"), newAction: FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") }), isOn: $model.isOn)
            .demoViewStyle(.card)

        // 4. Style composition (concatenation)
        VStack {
            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: .text("Status"), newAction: FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") }), isOn: $model.isOn)
                .demoViewStyle(.horizontal.concat(.card))

            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: .text("Status"), newAction: FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") }), isOn: $model.isOn)
                .demoViewStyle(.card)
                .demoViewStyle(.horizontal)
        }

        // 5. Style based on the state (Not work in Preview, only work in a test app)
        DemoView(title: "DemoView Title", subtitle: "Subtitle", status: .text("Status"), newAction: FioriButton(title: "ActionTitle", action: { _ in print("Action tapped") }), isOn: $model.isOn)
            .demoViewStyle(.card)
            .demoViewStyle { configuration in
                DemoView(configuration)
                    .titleStyle { titleConfiguration in
                        Title(titleConfiguration)
                            .foregroundStyle(configuration.isOn ? .red : .blue)
                    }
            }
    }
}

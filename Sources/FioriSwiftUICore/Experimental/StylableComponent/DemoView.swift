import FioriMacro
import Foundation
import SwiftUI

public struct DemoView {
    @ViewBuilder
    let title: any View
    let subtitle: any View
    let status: any View
    
    let actionTitle: any View
    let action: (() -> Void)?
    
    @Binding var isOn: Bool
    
    // TODO: macro
    @Environment(\.demoViewStyle) var style
    
    // TODO: macro
    public init
        (
            @ViewBuilder title: () -> any View,
            @ViewBuilder subtitle: () -> any View = { EmptyView() },
            @ViewBuilder status: () -> any View = { EmptyView() },
            @ViewBuilder actionTitle: () -> any View = { EmptyView() },
            action: (() -> Void)? = nil,
            isOn: Binding<Bool>
        )
    {
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.status = status()
        self.actionTitle = ActionTitle { actionTitle() }
        self.action = action
        self._isOn = isOn
    }
}

// TODO: macro
public extension DemoView {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         status: AttributedString? = nil,
         actionTitle: AttributedString? = nil,
         action: (() -> Void)? = nil,
         isOn: Binding<Bool>)
    {
        self.init(title: {
            Text(title)
        }, subtitle: {
            OptionalText(subtitle)
        }, status: {
            OptionalText(status)
        }, actionTitle: {
            OptionalText(actionTitle)
        }, action: action, isOn: isOn)
    }
}

// TODO: macro
public extension DemoView {
    init(_ configuration: DemoViewConfiguration) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.status = configuration.status
        self.actionTitle = configuration.actionTitle
        self.action = configuration.action
        self._isOn = configuration.isOn
    }
}

// TODO: macro
extension DemoView: View {
    public var body: some View {
        let configuration = DemoViewConfiguration(title: .init(title), subtitle: .init(subtitle), status: .init(status), actionTitle: .init(actionTitle), action: action, isOn: _isOn)
        style.resolve(configuration: configuration).typeErased
            .transformEnvironment(\.demoViewStyleStack) { stack in
                if !stack.isEmpty {
                    stack.removeLast()
                }
            }
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
                
                if !configuration.actionTitle.isEmpty {
                    Button(action: configuration.action ?? {}, label: {
                        configuration.actionTitle
                    })
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
            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: "Status", actionTitle: "ActionTitle", action: { print("Action tapped") }, isOn: $model.isOn)

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
        .actionTitleStyle {
            ActionTitle($0)
                .foregroundStyle(Color.red)
        }
        
        // 2. Test style customization for a specific component
        HStack {
            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: "Status", actionTitle: "ActionTitle", action: { print("Action tapped") }, isOn: $model.isOn)

            Title(title: "Other Title")
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .demoViewStyle(.titleStyle { config in
            Title(config)
                .foregroundStyle(.yellow)
        })
        
        // 3. Reusable style
        DemoView(title: "DemoView Title", subtitle: "Subtitle", status: "Status", actionTitle: "ActionTitle", action: { print("Action tapped") }, isOn: $model.isOn)
            .demoViewStyle(.card)
        
        // 4. Style composition (concatenation)
        VStack {
            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: "Status", actionTitle: "ActionTitle", action: { print("Action tapped") }, isOn: $model.isOn)
                .demoViewStyle(.horizontal.concat(.card))

            DemoView(title: "DemoView Title", subtitle: "Subtitle", status: "Status", actionTitle: "ActionTitle", action: { print("Action tapped") }, isOn: $model.isOn)
                .demoViewStyle(.card)
                .demoViewStyle(.horizontal)
        }
        
        // 5. Style based on the state (Not work in Preview, only work in a test app)
        DemoView(title: "DemoView Title", subtitle: "Subtitle", status: "Status", actionTitle: "ActionTitle", action: { print("Action tapped") }, isOn: $model.isOn)
            .demoViewStyle(.card)
            .demoViewStyle { configuration in
                DemoView(configuration)
                    .titleStyle { titleConfiguration in
                        Title(titleConfiguration)
                            .foregroundStyle(configuration.isOn.wrappedValue ? .red : .blue)
                    }
            }
    }
}

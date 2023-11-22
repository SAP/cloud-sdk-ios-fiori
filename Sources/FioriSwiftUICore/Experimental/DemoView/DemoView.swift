import FioriMacro
import Foundation
import SwiftUI

// TODO:
/// 1. Add default component fiori style into stack √
/// 2. make environment variables work in style object √
/// 3. how to handle dynamic basic component and what styling api should be provided
/// 4. Swift Macro
public struct DemoView<_Title: View, Subtitle: View, Status: View, ActionTitle: View>: _TitleComponent, _SubtitleComponent, _StatusComponent, _ActionComponent {
    @ViewBuilder
    let title: _Title
    let subtitle: Subtitle
    let status: Status
    
    let actionTitle: ActionTitle
    let action: (() -> Void)?
    
    // TODO: macro
    @Environment(\.demoViewStyle) var style
    
    // TODO: macro
    public init<Title_: View>
    (
        @ViewBuilder title: () -> Title_,
        @ViewBuilder subtitle: () -> Subtitle = { EmptyView() },
        @ViewBuilder status: () -> Status = { EmptyView() },
        @ViewBuilder actionTitle: () -> ActionTitle = { EmptyView() },
        action: (() -> Void)? = nil
    )
        where _Title == Title<Title_>
    {
        self.title = Title { title() }
        self.subtitle = subtitle()
        self.status = status()
        self.actionTitle = actionTitle()
        self.action = action
    }
}

// TODO: macro
public extension DemoView where _Title == Title<Text>,
    Subtitle == Text?,
    Status == Text?,
    ActionTitle == Text?
{
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         status: AttributedString? = nil,
         actionTitle: AttributedString? = nil,
         action: (() -> Void)? = nil)
    {
        self.init(title: {
            Text(title)
        }, subtitle: {
            Text(attributedString: subtitle)
        }, status: {
            Text(attributedString: status)
        }, actionTitle: {
            Text(attributedString: actionTitle)
        }, action: action)
    }
}

// TODO: macro
public extension DemoView where _Title == DemoViewConfiguration.Label,
    Subtitle == DemoViewConfiguration.Label,
    Status == DemoViewConfiguration.Label,
    ActionTitle == DemoViewConfiguration.Label
{
    init(_ configuration: DemoViewConfiguration) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.status = configuration.status
        self.actionTitle = configuration.actionTitle
        self.action = configuration.action
    }
}

// TODO: macro
extension DemoView: View {
    public var body: some View {
        let configuration = DemoViewConfiguration(title: .init(title), subtitle: .init(subtitle), status: .init(status), actionTitle: .init(actionTitle), action: action)
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

struct Preview: PreviewProvider {
    static var previews: some View {
        DemoView(title: "Title", subtitle: "Subtitle", status: "Status", actionTitle: "ActionTitle") {
            print("Action tapped")
        }
        
        DemoView(title: "Title")

        DemoView(title: {
            Text("Title")
        })
        
        DemoView(title: {
            Text("Title")
        }, subtitle: {
            Text("Subtitle")
        }, actionTitle: {
            Text("ActionTitle")
        })

        // Test styling propagation
        DemoView {
            Text("Outer")
        } subtitle: {
            DemoView {
                Text("Inner")
            }
        }
        .demoViewStyle(.tag("A"))
        .demoViewStyle(.tag("B"))
        
        // Test styling composition
        DemoView {
            Text("Outer")
        } subtitle: {
            DemoView {
                Text("Inner")
            }
//            .demoViewStyle(.roundedBorder)
        }
        .demoViewStyle(.roundedBorder)
        .demoViewStyle(.tag("A"))
        .demoViewStyle(.roundedBorder)
        .demoViewStyle(.tag("B"))
        
        // Test the case where developer-set styles overrides default styles
        DemoView(title: "Title", subtitle: "Subtitle")
//            .titleStyle {
//                Title($0)
//                    .foregroundStyle(.yellow)
//                    .font(.largeTitle)
//            }
            .demoViewStyle(.newTitleStyle {
                Title($0)
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
            })
    }
}

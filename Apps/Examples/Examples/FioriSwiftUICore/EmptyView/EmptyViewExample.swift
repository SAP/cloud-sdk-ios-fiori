import FioriSwiftUICore
import SwiftUI

struct EmptyViewExample: View {
    let data: [EmptyViewShowType] = [.title, .titleAndIcon, .titleAndDescription, .titleAndIconAndDescription, .all, .custom]
    
    var body: some View {
        Group {
            List(data, id: \.self) { item in
                NavigationLink(
                    destination: EmptyContentViewExample(type: item),
                    label: {
                        Text(item.rawValue)
                    }
                )
            }
        }
        .navigationTitle("EmptyViewExample")
    }
}

enum EmptyViewShowType: String {
    case title
    case titleAndIcon
    case titleAndDescription
    case titleAndIconAndDescription
    case all
    case custom
}

struct EmptyContentViewExample: View {
    struct Ocean: Identifiable {
        let name: String
        let id = UUID()
    }

    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]
    
    @State var isEmpty = true
    
    var type: EmptyViewShowType
    
    init(type: EmptyViewShowType) {
        self.type = type
    }
    
    var body: some View {
        Group {
            if isEmpty == false {
                List(oceans) { ocean in
                    Text(ocean.name)
                }
            } else {
                switch type {
                case .title:
                    EmptyStateView(title: "This is a placeholder title")
                case .titleAndIcon:
                    EmptyStateView(title: "This is a placeholder title", image: Image("rw"))
                case .titleAndDescription:
                    EmptyStateView(title: "This is a placeholder title",
                                   descriptionText: "This is a very long description text, maximum line number is 3.")
                case .titleAndIconAndDescription:
                    EmptyStateView(title: "This is a placeholder title",
                                   descriptionText: "This is a very long description text, maximum line number is 3.",
                                   image: Image("rw"))
                case .all:
                    EmptyStateView(title: "This is a placeholder title",
                                   descriptionText: "This is a very long description text, maximum line number is 3.",
                                   image: Image("rw"),
                                   action: Action(actionText: "Refresh", didSelectAction: {
                                       self.isEmpty.toggle()
                                   }))
                case .custom:
                    EmptyStateView(title: {
                        Text("custom title")
                            .font(Font.title)
                            .foregroundColor(Color.red)
                            .background(Color.green)
                    }, descriptionText: {
                        Text("custom description")
                            .font(Font.subheadline)
                            .foregroundColor(Color.green)
                            .background(Color.red)
                    }, image: Image("rw"),
                    action: {
                        Action(actionText: "Clear", didSelectAction: {
                            self.isEmpty.toggle()
                        })
                    })
                }
            }
        }
        .navigationBarItems(trailing: Button("Clear") {
            self.isEmpty.toggle()
        })
    }
}

struct EmptyViewExample_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewExample()
    }
}

import FioriSwiftUICore
import SwiftUI

struct EmptyStateViewExample: View {
    let data: [EmptyViewShowType] = [.title, .titleAndIcon, .titleAndDescription, .titleAndIconAndDescription, .all, .adaptiveHorizontal, .adaptiveVertical, .custom]
    
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
        .navigationTitle("EmptyStateViewExample")
    }
}

enum EmptyViewShowType: String {
    case title
    case titleAndIcon
    case titleAndDescription
    case titleAndIconAndDescription
    case all
    case adaptiveHorizontal
    case adaptiveVertical
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
                    EmptyStateView(title: "This is a placeholder title",
                                   detailImage: Image("rw"))
                case .titleAndDescription:
                    EmptyStateView(title: "This is a placeholder title",
                                   descriptionText: "This is a very long description text, maximum line number is 3.")
                case .titleAndIconAndDescription:
                    EmptyStateView(title: "This is a placeholder title",
                                   descriptionText: "This is a very long description text, maximum line number is 3.",
                                   detailImage: Image("rw"))
                case .all:
                    EmptyStateView(title: "This is a placeholder title",
                                   descriptionText: "This is a very long description text, maximum line number is 3.",
                                   detailImage: Image("rw").resizable(),
                                   action: Action(actionText: "Refresh", didSelectAction: {
                                       self.isEmpty.toggle()
                                   }))
                case .adaptiveHorizontal:
                    EmptyStateViewAdaptiveExample(alignmentAxis: .horizontal)
                case .adaptiveVertical:
                    EmptyStateViewAdaptiveExample(alignmentAxis: .vertical)
                case .custom:
                    EmptyStateView {
                        Text("custom title")
                            .font(Font.title)
                            .foregroundColor(Color.red)
                            .background(Color.green)
                    } descriptionText: {
                        Text("custom description")
                            .font(Font.subheadline)
                            .foregroundColor(Color.green)
                            .background(Color.red)
                    } detailImage: {
                        Image("rw")
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 80, height: 80)
                    } action: {
                        Action(actionText: "Clear", didSelectAction: {
                            self.isEmpty.toggle()
                        })
                    }
                }
            }
        }
        .navigationBarItems(trailing: Button("Clear") {
            self.isEmpty.toggle()
        })
    }
}

struct EmptyStateViewAdaptiveExample: View {
    var alignmentAxis: Axis
    var body: some View {
        GeometryReader { geo in
            if geo.size.width > 500 {
                EmptyStateView(
                    title: {
                        Text("This is a placeholder title")
                    },
                    descriptionText: {
                        Text("This is very long description text, maximum line number is 3.")
                    },
                    detailImage: {
                        Image("wheel")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 200)
                            .clipped()
                    },
                    action: {
                        Action(actionText: "Refresh")
                    },
                    alignmentAxis: self.alignmentAxis
                )
                .frame(width: geo.frame(in: .local).width, height: geo.frame(in: .local).height)
            } else {
                EmptyStateView(
                    title: {
                        Text("This is a placeholder title")
                    },
                    descriptionText: {
                        Text("This is very long description text, maximum line number is 3.")
                    },
                    detailImage: {
                        Image("ProfilePic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .clipped()
                    },
                    action: {
                        Action(actionText: "Refresh")
                    },
                    alignmentAxis: self.alignmentAxis
                )
                .frame(width: geo.frame(in: .local).width, height: geo.frame(in: .local).height)
            }
        }
    }
}

struct EmptyStateViewExample_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateViewExample()
    }
}

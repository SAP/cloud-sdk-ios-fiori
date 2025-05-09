import FioriSwiftUICore
import SwiftUI

struct ActivityItemsExample: View {
    var body: some View {
        List {
            Section {
                ActivityItems(activityItems: [
                    .init(type: .phone, didSelectActivityItem: {
                        print("click phone")
                    })
                ])
                ActivityItems(activityItems: [
                    .init(type: .phone, didSelectActivityItem: {
                        print("click phone")
                    }),
                    .init(type: .email, didSelectActivityItem: {
                        print("click email")
                    })
                ])
                ActivityItems(activityItems: [
                    .init(type: .phone, didSelectActivityItem: {
                        print("click phone")
                    }),
                    .init(type: .email, didSelectActivityItem: {
                        print("click email")
                    }),
                    .init(type: .message, didSelectActivityItem: {
                        print("click message")
                    })
                ])
                ActivityItems(activityItems: [
                    .init(type: .phone, didSelectActivityItem: {
                        print("click phone")
                    }),
                    .init(type: .email, didSelectActivityItem: {
                        print("click email")
                    }),
                    .init(type: .message, didSelectActivityItem: {
                        print("click message")
                    }),
                    .init(type: .videoCall, didSelectActivityItem: {
                        print("click videoCall")
                    })
                ])
                ActivityItems(activityItems: [
                    .init(type: .phone, didSelectActivityItem: {
                        print("click phone")
                    }),
                    .init(type: .email, didSelectActivityItem: {
                        print("click email")
                    }),
                    .init(type: .message, didSelectActivityItem: {
                        print("click message")
                    }),
                    .init(type: .videoCall, didSelectActivityItem: {
                        print("click videoCall")
                    }),
                    .init(type: .detail, didSelectActivityItem: {
                        print("click detail")
                    })
                ])
                .activityItemsStyle { conf in
                    conf.activityItems
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                        .foregroundColor(.red)
                }
            } header: {
                Text("Usual Type")
                    .textCase(.none)
            }
            
            Section {
                ActivityItems(activityItems: [
                    .init(type: .custom(Image(systemName: "person")), didSelectActivityItem: {
                        print("custom person")
                    }),
                    .init(type: .custom(Image(systemName: "heart")), didSelectActivityItem: {
                        print("custom heart")
                    }),
                    .init(type: .custom(Image(systemName: "clock")), didSelectActivityItem: {
                        print("custom clock")
                    })
                ])
            } header: {
                Text("Custom Type")
                    .textCase(.none)
            }
            
            Section {
                ActivityItems {
                    Button {
                        print("click person")
                    } label: {
                        Image(systemName: "person")
                            .font(.fiori(forTextStyle: .headline).weight(.heavy))
                            .imageScale(.large)
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button {
                        print("click heart")
                    } label: {
                        Image(systemName: "heart")
                            .font(.fiori(forTextStyle: .headline).weight(.heavy))
                            .imageScale(.large)
                            .foregroundColor(.yellow)
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button {
                        print("click info.circle")
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.fiori(forTextStyle: .headline).weight(.heavy))
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Button {
                        print("click book")
                    } label: {
                        Image(systemName: "book")
                            .font(.fiori(forTextStyle: .headline).weight(.heavy))
                            .imageScale(.large)
                            .foregroundColor(.green)
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            } header: {
                Text("Custom items")
            }
        }
        .navigationTitle("ActivityItemsExample")
    }
}

#Preview {
    ActivityItemsExample()
}

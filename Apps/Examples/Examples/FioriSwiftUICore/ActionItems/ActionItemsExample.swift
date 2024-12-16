import FioriSwiftUICore
import SwiftUI

struct ActionItemsExample: View {
    var body: some View {
        List {
            Section {
                ActionItems(actionItems: [.init(type: .phone)]) { dataType in
                    print("\(dataType)")
                }
                ActionItems(actionItems: [.init(type: .phone), .init(type: .email)]) { dataType in
                    print("\(dataType)")
                }
                ActionItems(actionItems: [.init(type: .phone), .init(type: .email), .init(type: .message)]) { dataType in
                    print("\(dataType)")
                }
                ActionItems(actionItems: [.init(type: .phone), .init(type: .email), .init(type: .message), .init(type: .videoCall)]) { dataType in
                    print("\(dataType)")
                }
                ActionItems(actionItems: [.init(type: .phone), .init(type: .email), .init(type: .message), .init(type: .videoCall), .init(type: .detail)]) { dataType in
                    print("\(dataType)")
                }
            } header: {
                Text("Usual Type")
                    .textCase(.none)
            }
            
            Section {
                ActionItems(actionItems: [
                    .init(type: .custom(Image(systemName: "person"))),
                    .init(type: .custom(Image(systemName: "heart"))),
                    .init(type: .custom(Image(systemName: "clock"))),
                    .init(type: .custom(Image(systemName: "info.circle"))),
                    .init(type: .custom(Image(systemName: "book")))
                ]) { dataType in
                    print("\(dataType)")
                }
            } header: {
                Text("Custom Type")
                    .textCase(.none)
            }
        }
    }
}

#Preview {
    ActionItemsExample()
}

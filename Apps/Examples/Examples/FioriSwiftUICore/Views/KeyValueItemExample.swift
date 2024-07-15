import FioriSwiftUICore
import SwiftUI

struct KeyValueItemExample: View {
    var body: some View {
        Text("KeyValueItemExample")
        List {
            Text("Default Horizontal")
            KeyValueItem {
                Text("Key 1")

            } value: {
                Text("Value 1")
            }

            Text("Vertical")
            KeyValueItem(key: {
                Text("Vertical Axis")
            }, value: {
                Text("Value 2")
            }, axis: .vertical)

            Text("Custom Color and Font")
            KeyValueItem {
                Text("Custom Color")
                    .foregroundStyle(.red)
                    .font(.fiori(forTextStyle: .title1))
            } value: {
                Text("Value 3")
                    .foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .footnote))
            }

            Text("Verticle Custom Color and Font")
            KeyValueItem(key: {
                Text("Custom Color and Font Vertical Axis")
                    .foregroundStyle(.red)
                    .font(.fiori(forTextStyle: .title1))
            }, value: {
                Text("Value 4")
                    .foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .footnote))
            }, axis: .vertical)
        }
    }
}

#Preview {
    KeyValueItemExample()
}

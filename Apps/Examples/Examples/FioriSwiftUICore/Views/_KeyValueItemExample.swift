import FioriSwiftUICore
import SwiftUI

struct _KeyValueItemExample: View {
    var body: some View {
        Text("_KeyValueItemExample")
        List {
            Text("Default Horizontal")
            _KeyValueItem {
                Text("Key 1")

            } value: {
                Text("Value 1")
            }

            Text("Vertical")
            _KeyValueItem(key: {
                Text("Vertical Axis")
            }, value: {
                Text("Value 2")
            }, axis: .vertical)

            Text("Custom Color and Font")
            _KeyValueItem {
                Text("Custom Color")
                    .foregroundStyle(.red)
                    .font(.fiori(forTextStyle: .title1))
            } value: {
                Text("Value 3")
                    .foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .footnote))
            }

            Text("Verticle Custom Color and Font")
            _KeyValueItem(key: {
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
    _KeyValueItemExample()
}

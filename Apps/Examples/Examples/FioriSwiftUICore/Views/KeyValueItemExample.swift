import FioriSwiftUICore
import SwiftUI

struct KeyValueItemExample: View {
    @State var axis: Axis = .horizontal
    @State var isLoading: Bool = true
    
    struct CustomKeyValueItemStyle: KeyValueItemStyle {
        func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
            KeyValueItem(configuration)
                .keyStyle { c in
                    c.key
                        .lineLimit(2)
                        .font(.fiori(forTextStyle: .callout))
                        .foregroundStyle(Color.preferredColor(.green7))
                }
                .valueStyle { c in
                    c.value
                        .lineLimit(2)
                        .font(.fiori(forTextStyle: .title3))
                        .foregroundStyle(Color.preferredColor(.indigo7))
                        .background(Color.preferredColor(.red3))
                }
        }
    }
    
    var body: some View {
        List {
            Section {
                Picker("Axis", selection: self.$axis) {
                    Text("Horizontal").tag(Axis.horizontal)
                    Text("Vertical").tag(Axis.vertical)
                }
                Toggle("Skeleton Loading", isOn: self.$isLoading)
            }
            Section {
                Text("Key Value Item (Default Style)")
                KeyValueItem(
                    key: { Text("Key 1") },
                    value: { Text("Value 1") },
                    axis: self.axis
                )
                
                Text("Key Value Item (Long String)")
                KeyValueItem(
                    key: { Text("Long long long long long long long long long long long long long long long long long long Key") },
                    value: { self.MultipleValues() },
                    axis: self.axis
                )

                Text("Key Value Item 2 lines (Custom Style)")
                KeyValueItem(
                    key: { Text("Long long long long long long long long long long long long long long long long long long long long long Key") },
                    value: { Text("Long long long long long long long long long Value") },
                    axis: self.axis
                )
                .ifApply(!self.isLoading) {
                    $0.keyValueItemStyle(CustomKeyValueItemStyle())
                }
            }
            .environment(\.isLoading, self.isLoading)
        }
    }
    
    func MultipleValues() -> any View {
        switch self.axis {
        case .horizontal:
            return HStack(spacing: 0) {
                Text("Long long long long long long long long long Value")
                Spacer()
                Link("650-000-0000", destination: URL(string: "tel:650-000-0000")!).foregroundColor(.blue).font(.fiori(forTextStyle: .body, weight: .semibold))
                Spacer()
                Text("xyz@gmail.com").font(.fiori(forTextStyle: .body, weight: .semibold))
                Spacer()
                Text("www.google.com").font(.fiori(forTextStyle: .body, weight: .semibold))
            }
        case .vertical:
            return VStack(alignment: .leading) {
                Text("Long long long long long long long long long Value")
                Link("650-000-0000", destination: URL(string: "tel:650-000-0000")!).foregroundColor(.blue)
                Text("xyz@gmail.com")
                Text("https://www.google.com")
            }
        }
    }
    
    struct KeyValueItemExample_Previews: PreviewProvider {
        static var previews: some View {
            KeyValueItemExample()
        }
    }
}

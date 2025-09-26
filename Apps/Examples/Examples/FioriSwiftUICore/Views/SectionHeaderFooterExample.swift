import FioriSwiftUICore
import SwiftUI

struct SectionHeaderFooterExample: View {
    @State var isLoading = false
    
    var body: some View {
        List {
            Toggle("Show Skeleton Loading", isOn: self.$isLoading)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            
            Section {
                Text("Apple")
                Text("Banana")
                Text("Cherry")
                Text("Lemon")
                Text("Orange")
            } header: {
                SectionHeader(title: "Fruits shop", attribute: AttributedString("Cheap")) {
                    print("Fruits shop Tapped")
                }
                .sectionHeaderStyle(.isDisclosureAccessoryHidden(isHidden: false))
            } footer: {
                SectionFooter(title: "List of fruits", attribute: AttributedString("buy"))
            }
            .environment(\.isLoading, self.isLoading)
            
            Section {
                Text("Beef")
                Text("Chicken")
                Text("Pork")
            } header: {
                SectionHeader(title: "Meat shop", attribute: AttributedString("fresh"), sectionHeaderStyle: .attribute)
                    .titleStyle { config in
                        config.title.foregroundStyle(Color.green)
                            .font(.fiori(forTextStyle: .largeTitle))
                    }
                    .attributeStyle { config in
                        config.attribute.foregroundStyle(Color.red)
                    }
            } footer: {
                SectionFooter(title: "List of Meat", attribute: AttributedString("buy"), sectionFooterStyle: .attribute, didSelectHandler: {
                    print("List of Meat Tapped")
                })
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.secondaryLabel))
                        .font(.fiori(forTextStyle: .subheadline))
                }
                .attributeStyle { config in
                    config.attribute.foregroundStyle(Color.preferredColor(.primaryLabel))
                        .font(.fiori(forTextStyle: .title1))
                }
            }
            .environment(\.isLoading, self.isLoading)
        }
        .navigationTitle("SectionHeader/Footer Example")
    }
}

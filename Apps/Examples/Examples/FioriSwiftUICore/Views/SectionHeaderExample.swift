import FioriSwiftUICore
import SwiftUI

struct SectionHeaderExample: View {
    var body: some View {
        Text("SectionHeader Example")
        List {
            SectionHeader(title: "String Title init", attribute: AttributedString("attribute"))
            
            SectionHeader {
                Text("Text View init")
            } attribute: {
                Text("attribute")
            }
            
            SectionHeader(title: "Custom style", attribute: AttributedString("attribute"))
                .titleStyle { config in
                    config.title.foregroundStyle(Color.green)
                        .font(.fiori(forTextStyle: .title1))
                }
                .attributeStyle { config in
                    config.attribute.foregroundStyle(Color.red)
                }
            
            SectionHeader {
                Text("Default style")
            } attribute: {
                Text("attribute")
            }
            .sectionHeaderStyle(.fiori)
        }
    }
}

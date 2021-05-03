import FioriSwiftUICore
import SwiftUI

struct StylingModifierExample: View {
    var body: some View {
        VStack {
            ExpHeaderView("Styling", subtitle: "via Modifier", desc: "works no type completion :(((",
                          back: .orange, textColor: .white)

            ContactItem(model: LibraryPreviewData.Person.laurelosborn)
                .titleModifier { $0.font(.headline).foregroundColor(.red) }
                .exampleHighlighting()
        }
    }
}

struct StylingModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        StylingModifierExample()
    }
}

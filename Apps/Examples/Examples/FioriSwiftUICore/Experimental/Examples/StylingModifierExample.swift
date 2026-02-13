import FioriSwiftUICore
import SwiftUI

struct StylingModifierExample: View {
    var body: some View {
        VStack {
            ExpHeaderView("Styling", subtitle: "via Modifier", desc: "works no type completion :(((",
                          back: .orange, textColor: .white)

            let model = LibraryPreviewData.Person.laurelosborn
            ContactItem(title: AttributedString(model.title), subtitle: AttributedString(model.subtitle ?? ""), description: AttributedString(model.descriptionText ?? ""), detailImage: model.detailImage)
                .exampleHighlighting()
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

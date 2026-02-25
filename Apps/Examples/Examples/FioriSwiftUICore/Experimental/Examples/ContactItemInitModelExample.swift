import FioriSwiftUICore
import SwiftUI

struct ContactItemInitModelExample: View {
    var body: some View {
        VStack {
            ExpHeaderView("Contact Item", subtitle: "Model based initializer", desc: "will set @ViewBuilder closures with default controls",
                          back: .green, textColor: .white)
            
            let model = LibraryPreviewData.Person.laurelosborn
            ContactItem(title: AttributedString(model.title), subtitle: AttributedString(model.subtitle ?? ""), description: AttributedString(model.descriptionText ?? ""), detailImage: model.detailImage)
                .exampleHighlighting()
        }
    }
}

struct ContactItemInitModelExample_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemInitModelExample()
    }
}

import FioriSwiftUICore
import SwiftUI

struct ContactItemInitModelExample: View {
    var body: some View {
        VStack {
            ExpHeaderView("Contact Item", subtitle: "Model based initializer", desc: "will set @ViewBuilder closures with default controls",
                          back: .green, textColor: .white)

            _ContactItem(model: LibraryPreviewData.Person.laurelosborn)
                .exampleHighlighting()
        }
    }
}

struct ContactItemInitModelExample_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemInitModelExample()
    }
}

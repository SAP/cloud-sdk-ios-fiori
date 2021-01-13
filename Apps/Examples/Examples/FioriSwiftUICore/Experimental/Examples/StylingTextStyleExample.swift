import FioriSwiftUICore
import SwiftUI

struct StylingTextStyleExample: View {
    var body: some View {
        VStack {
            ExpHeaderView("Styling", subtitle: "via TextStyle", desc: "does NOT work but is a good api",
                          back: .orange, textColor: .white)

            ContactItem(model: LibraryPreviewData.Person.laurelosborn)
                .titleStyle(TextStyle(font: .headline), concat: false) // DOES NOT WORK but is a good API
                .exampleHighlighting()
        }
    }
}

struct StylingTextStyleExample_Previews: PreviewProvider {
    static var previews: some View {
        StylingTextStyleExample()
    }
}

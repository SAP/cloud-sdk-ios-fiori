import FioriSwiftUICore
import Foundation
import SwiftUI

struct ContactItemInitViewBuilderExample: View {
    @State private var useDifferentView = false
    var body: some View {
        VStack {
            ExpHeaderView("Contact Item", subtitle: "ViewBuilder based initializer", desc: "can be injected with any view, e.g. Title can be an image and is not restricted to being a text",
                          back: .green, textColor: .white)

            ContactItem {
                if self.useDifferentView {
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                } else {
                    Text("Title")
                }
            } subtitle: {
                Text("SubTitle")
            } descriptionText: {
                Text("Description")
            } detailImage: {
                if self.useDifferentView {
                    Text("Not an image")
                } else {
                    Image(systemName: "person.crop.circle")
                }
            }
            .exampleHighlighting()

            Toggle(isOn: self.$useDifferentView) {
                Text("Use different views")
            }.padding()
        }
    }
}

struct ContactItemInitViewBuilderExample_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactItemInitViewBuilderExample()
                .previewLayout(.sizeThatFits)
        }
    }
}

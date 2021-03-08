import FioriSwiftUICore
import SwiftUI

struct SignatureViewInline_Example: View {
    @State var newImage: Image? = nil
    var body: some View {
        SignatureViewInline { image in
            self.newImage = image
        } onCancel: {
            self.newImage = nil
        }
    }
}

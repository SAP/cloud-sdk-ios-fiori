import FioriSwiftUICore
import SwiftUI

struct SignatureCaptureView_Example: View {
    @State var newImage: Image? = nil
    var body: some View {
        SignatureCaptureView { image in
            self.newImage = image
        } onCancel: {
            self.newImage = nil
        }
    }
}

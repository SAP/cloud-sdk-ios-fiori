import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct Sandbox: View {
    @State var photoFilters: [PHPickerFilter] = []
    @State var fileFilters: [UTType] = []

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Sandbox()
}

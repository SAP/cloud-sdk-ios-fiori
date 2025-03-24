import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct Sandbox: View {
    @State var photoFilters: [PHPickerFilter] = []
    @State var fileFilters: [UTType] = []

    var body: some View {
        FilterCFG(photoFilters: self.$photoFilters, fileFilters: self.$fileFilters)
            .border(Color.blue)
    }
}

#Preview {
    Sandbox()
}

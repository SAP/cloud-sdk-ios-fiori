import FioriSwiftUICore
import SwiftUI

struct Sandbox: View {
    @State private var useMenu: Bool = true
    
    var body: some View {
        VStack {
            Toggle("Menu:On Dialog:Off", isOn: self.$useMenu)
                .padding()
        }
    }
}

#Preview {
    Sandbox()
}

import FioriThemeManager
import SwiftUI

struct NavigationBarExample: View {
    @State private var isPresented = false
    
    var body: some View {
        List {
            NavigationLink {
                NavigationBarFioriStyle()
            } label: {
                Text("FioriStyle")
            }
            NavigationLink {
                NavigationBarPopover()
            } label: {
                Text("Title & Subtitle for TitleView(Long press to show popover)")
            }
            
            NavigationLink {
                NavigationBarCustomItem()
            } label: {
                Text("BarButtonItem with Expandable Touch Area & Highlighted State")
            }
        }
        .navigationTitle("NavigationBar Test")
    }
}

#Preview {
    NavigationBarExample()
}

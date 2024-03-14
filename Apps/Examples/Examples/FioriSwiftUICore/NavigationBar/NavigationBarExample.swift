import FioriThemeManager
import SwiftUI

struct NavigationBarExample: View {
    @State private var isPresented = false
    
    var body: some View {
        List {
            HStack {
                Text("FioriStyle")
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.isPresented.toggle()
            }
            .sheet(isPresented: self.$isPresented) {
                NavigationBarFioriStyle()
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

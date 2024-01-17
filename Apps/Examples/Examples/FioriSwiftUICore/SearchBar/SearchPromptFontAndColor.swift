import FioriThemeManager
import SwiftUI

struct SearchPromptFontAndColor: View {
    @State private var queryString = ""
    
    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(queryString)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
        }
        .searchable(
            text: $queryString,
            
            prompt: Text("Color name")
                .foregroundColor(.red) // SwiftUI does not support prompt text color
                .font(.fiori(forTextStyle: .title3)) // SwiftUI does not support prompt font
        )
        .navigationBarTitleDisplayMode(.inline)
        .font(.fiori(forTextStyle: .title3)) // prompt font can be inherited from here
        .onAppear {
            UISearchBar.appearance().tintColor = Color.preferredColor(.mango6).uiColor() // works
        }
    }
}

#Preview {
    SearchPromptFontAndColor()
}

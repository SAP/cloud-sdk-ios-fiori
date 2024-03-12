import SwiftUI

struct SearchDemos: View {
    var body: some View {
        List {
            NavigationLink {
                SearchFontAndColor()
            } label: {
                Text("Search text and font")
            }
            
            NavigationLink {
                SearchIconAndPlaceholder()
            } label: {
                Text("Search icon and placeholder")
            }
            
            NavigationLink {
                SearchWithSuggestion()
            } label: {
                Text("Search with suggestions")
            }

            NavigationLink {
                SearchWithToken()
            } label: {
                Text("Search with tokens")
            }

            NavigationLink {
                SearchWithScope()
            } label: {
                Text("Search with scopes")
            }

//            NavigationLink {
//                SearchWithBookmark()
//            } label: {
//                Text("Search with bookmark (icon only)")
//            }
 
            NavigationLink {
                SearchPromptFontAndColor()
            } label: {
                Text("Cursor and button color")
            }
        }
        .navigationTitle("Search Demos")
    }
}

#Preview {
    SearchDemos()
}

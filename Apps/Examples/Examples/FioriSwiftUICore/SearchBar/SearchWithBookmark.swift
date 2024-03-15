import FioriThemeManager
import SwiftUI

struct SearchWithBookmark: View {
    @State private var queryString = ""
    @State private var searchScope = SearchScope.all
//    var delegate = MyUISearchBarDelegate()

    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(self.queryString, scope: self.searchScope)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
        }
        .searchable(text: self.$queryString, prompt: "Color name")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
//            UISearchBar.appearance().delegate = delegate // SwiftUI doesn't support bookmark actions.
            UISearchBar.appearance().showsBookmarkButton = true // bookmark shown
//            UISearchBar.appearance().setImage(Image(systemName: "checkmark").asUIImage(), for: .bookmark, state: .normal)
        }
    }
}

// class MyUISearchBarDelegate: NSObject, UISearchBarDelegate {
//    override init() {
//
//    }
//
//    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//        print("Bookmark button clicked")
//    }
// }

#Preview {
    SearchWithBookmark()
}

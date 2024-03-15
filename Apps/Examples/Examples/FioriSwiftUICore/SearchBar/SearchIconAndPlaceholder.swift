import FioriThemeManager
import SwiftUI

struct SearchIconAndPlaceholder: View {
    @State private var queryString = ""

    // following code demonstrate a workaround for styling search bar
    // search icon and placeholder
    // reference issue: https://developer.apple.com/forums/thread/709773
    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(self.queryString)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
        }
        .searchable(text: self.$queryString, prompt: "Color name")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            UISearchTextField.appearance().backgroundColor = UIColor(Color.preferredColor(.quaternaryFill))
            UISearchTextField.appearance().attributedPlaceholder = NSAttributedString(string: "Color name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(Color.preferredColor(.tertiaryLabel))])
            
            let searchImage = UIImage(systemName: "magnifyingglass")?
                .withTintColor(UIColor(Color.preferredColor(.tertiaryLabel)), renderingMode: .alwaysOriginal)
                .applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .semibold))
            UISearchBar.appearance().setImage(searchImage, for: .search, state: .normal)
            
            // SwiftUI doesn't support bookmark actions.
            // Only show bookmark icon
            UISearchBar.appearance().showsBookmarkButton = true
            let bookmarkImage = UIImage(systemName: "book")?
                .withTintColor(UIColor(Color.preferredColor(.tintColor2)), renderingMode: .alwaysOriginal)
            UISearchBar.appearance().setImage(bookmarkImage, for: .bookmark, state: .normal)
        }
        .onDisappear {
            UISearchTextField.appearance().backgroundColor = nil
            UISearchTextField.appearance().attributedPlaceholder = nil
            UISearchBar.appearance().setImage(nil, for: .search, state: .normal)
            UISearchBar.appearance().showsBookmarkButton = false // bookmark hidden
            UISearchBar.appearance().setImage(nil, for: .bookmark, state: .normal)
        }
    }
}

#Preview {
    SearchIconAndPlaceholder()
}

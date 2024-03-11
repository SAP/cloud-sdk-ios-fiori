import FioriThemeManager
import SwiftUI

struct SearchFontAndColor: View {
    @State private var queryString = ""

    // following code demonstrate a workaround for styling search bar
    // font and test color
    // reference issue: https://developer.apple.com/forums/thread/709773
    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(queryString)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
                    .font(.fiori(forTextStyle: .body))
            }
            .navigationTitle("Colors")
        }
        .searchable(text: $queryString, prompt: "Color name")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.preferredColor(.red5))
        .font(.fiori(forTextStyle: .title3))
        .onAppear {
            UISearchTextField.appearance().backgroundColor = UIColor(Color.preferredColor(.quaternaryFill))
            UISearchTextField.appearance().attributedPlaceholder = NSAttributedString(string: "Color name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(Color.preferredColor(.tertiaryLabel))])
            
            let image = UIImage(systemName: "magnifyingglass")?
                .withTintColor(UIColor(Color.preferredColor(.red4)), renderingMode: .alwaysOriginal)
                .applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .semibold))
            UISearchBar.appearance().setImage(image, for: .search, state: .normal)
        }
        .onDisappear {
            UISearchTextField.appearance().backgroundColor = nil
            UISearchTextField.appearance().attributedPlaceholder = nil
            UISearchBar.appearance().setImage(nil, for: .search, state: .normal)
        }
    }
}

#Preview {
    SearchFontAndColor()
}

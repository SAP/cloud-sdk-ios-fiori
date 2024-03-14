import FioriThemeManager
import SwiftUI

struct SearchWithSuggestion: View {
    @State private var queryString = ""

    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(self.queryString)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
        }
        .searchable(text: self.$queryString,
                    prompt: "Color name",
                    suggestions: {
                        ForEach(ColorEntity.colors.filter { $0.name.localizedCaseInsensitiveContains(self.queryString) }) { suggestion in
                            Text(suggestion.name)
                                .foregroundColor(suggestion.fioriColor)
                                .font(.fiori(forTextStyle: .body))
                                .searchCompletion(suggestion.name)
                        }
                    })
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchWithSuggestion()
}

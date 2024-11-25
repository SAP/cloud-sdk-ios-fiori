import FioriThemeManager
import SwiftUI

/// Dialog title component
struct SortFilterItemTitle: TitleComponent, View {
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(self.title)
            .font(.fiori(forTextStyle: .subheadline, weight: .black))
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    SortFilterItemTitle(title: "My Title")
}

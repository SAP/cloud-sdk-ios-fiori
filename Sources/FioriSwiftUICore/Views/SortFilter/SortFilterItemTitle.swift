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
            .font(.body)
            .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    SortFilterItemTitle(title: "My Title")
}

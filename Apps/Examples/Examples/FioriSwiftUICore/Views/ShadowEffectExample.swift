import FioriSwiftUICore
import SwiftUI

struct ShadowEffectExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(FioriShadowStyle.allCases, id: \.self) { style in
                    ZStack {
                        Color.preferredColor(.secondaryGroupedBackground)
                            .frame(width: 300, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(style)
                            .padding()
                        
                        self.styleDescription(style)
                            .bold()
                            .font(.fiori(forTextStyle: .title1))
                    }
                }
            }.frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .background(Color.preferredColor(.primaryGroupedBackground))
        .navigationTitle("Shadow Effect")
    }
    
    @ViewBuilder func styleDescription(_ style: FioriShadowStyle) -> some View {
        switch style {
        case .minimal:
            Text("Level 0")
        case .light:
            Text("Level 1")
        case .medium:
            Text("Level 2")
        case .heavy:
            Text("Level 3")
        case .max:
            Text("Level 3")
        case .compact:
            Text("Small Shape")
        case .broad:
            Text("Medium Shape")
        }
    }
}

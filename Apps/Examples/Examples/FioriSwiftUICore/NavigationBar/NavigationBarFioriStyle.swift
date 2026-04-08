import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct NavigationBarFioriStyle: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.preferredFioriFont(forTextStyle: .largeTitle, weight: .black)]
    }

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Text("NavigationBar Background")
                Text("Standard title font & color")
            }
            .navigationTitle("FioriStyle")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    FioriButton(action: { _ in
                        self.dismiss()
                    }, label: { _ in
                        FioriIcon.actions.decline
                    })
                    .fioriButtonStyle(FioriNavigationButtonStyle())
                }
                
                ToolbarItem(placement: .principal) {
                    VStack(alignment: .center) {
                        Text("FioriStyle")
                            .font(.fiori(forTextStyle: .subheadline)).fontWeight(.black)
                        Text("Subtitle goes here")
                            .font(.fiori(forTextStyle: .caption1))
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityHint("Navigation bar title")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    FioriButton(action: { _ in
                    }, label: { _ in
                        Text("Redo")
                    })
                    .fioriButtonStyle(FioriNavigationButtonStyle())
                }
            }
        }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    NavigationBarFioriStyle()
}

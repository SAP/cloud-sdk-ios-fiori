import FioriThemeManager
import SwiftUI

struct NavigationBarFioriStyle: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.preferredFioriFont(forTextStyle: .largeTitle, weight: .black)]
    }
    
    var body: some View {
        NavigationStack {
            List {
                Text("NavigationBar Background")
                Text("Standard title font & color")
            }
            .navigationTitle("FioriStyle")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("FioriStyle")
                            .font(.fiori(forTextStyle: .subheadline)).fontWeight(.black)
                        Text("Subtitle goes here")
                            .font(.fiori(forTextStyle: .caption1))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button(action: {}, label: {
                            Text("Redo")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "camera")
                        })
                    }
                    .font(.fiori(forTextStyle: .headline)).fontWeight(.bold)
                }
            }
        }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    NavigationBarFioriStyle()
}

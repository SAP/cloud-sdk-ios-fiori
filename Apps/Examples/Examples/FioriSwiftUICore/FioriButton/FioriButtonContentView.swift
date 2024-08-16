import Foundation
import SwiftUI

struct FioriButtonContentView: View {
    var body: some View {
        List {
            NavigationLink("FioriButton", destination: LazyView(FioriButtonExample()))
            NavigationLink("StatefulButtonStyle", destination: LazyView(StatefulButtonStyleExample()))
            NavigationLink("Button Tests", destination: LazyView(FioriButtonTestsExample()))
            NavigationLink("Button Style Toggle", destination: LazyView(FioriButtonStyleToggleExample()))
            NavigationLink("Button In List", destination: LazyView(FioriButtonInListExample()))
            NavigationLink("Button In List - Multiple Lines", destination: LazyView(FioriButtonInListMultipleLineExample()))
            NavigationLink("Custom Button", destination: LazyView(FioriButtonCustomButtonExample()))
            NavigationLink("In-Place Loading Button", destination: LazyView(InPlaceLoadingContentView()))
        }
        .navigationTitle("FioriButton")
    }
}

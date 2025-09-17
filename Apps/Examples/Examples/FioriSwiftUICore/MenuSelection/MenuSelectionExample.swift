import FioriSwiftUICore
import Foundation
import SwiftUI

struct MenuSelectionExample: View {
    @State var isExpanded = false
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            ScrollViewReader { scrollView in
                ScrollView {
                    MenuSelection(isExpanded: self.$isExpanded) {
                        ForEach(0 ..< 50) { i in
                            MenuSelectionItem(icon: Image(systemName: "square"), title: AttributedString("Menu Item \(i)")) {
                                print("select item \(i)")
                            }
                        }
                    }
                    .maxNumberOfItems(5)
                    .id("MenuSelection")
                    .environment(\.isLoading, self.isLoading)
                }
                .toolbar(content: {
                    Button("ScrollToBottom") {
                        withAnimation {
                            scrollView.scrollTo("MenuSelection", anchor: .bottom)
                        }
                    }
                    Button("Loading") {
                        self.isLoading.toggle()
                    }
                })
                .onChange(of: self.isExpanded) {
                    withAnimation {
                        scrollView.scrollTo("MenuSelection", anchor: .bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuSelectionExample()
}

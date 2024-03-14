import FioriSwiftUICore
import SwiftUI

struct TabViewExample: View {
    @State var isPresented: Bool = false
    @State var numberOfTabs: Int = 4
    @State var isModalPresentation: Bool = false
    @State var isCustomColor: Bool = false
    @State var isCustomSelectionIndicatorImage: Bool = false
    @State var isCustomBackgroundImage: Bool = false

    var body: some View {
        Form {
            if self.isModalPresentation {
                HStack {
                    Text("Selecte to Test")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.isPresented.toggle()
                }
                .sheet(isPresented: self.$isPresented) {
                    TabViewDetailView(numberOfTabs: self.$numberOfTabs,
                                      isCustomColor: self.$isCustomColor,
                                      isCustomSelectionIndicatorImage: self.$isCustomSelectionIndicatorImage,
                                      isCustomBackgroundImage: self.$isCustomBackgroundImage)
                }
            } else {
                NavigationLink {
                    TabViewDetailView(numberOfTabs: self.$numberOfTabs,
                                      isCustomColor: self.$isCustomColor,
                                      isCustomSelectionIndicatorImage: self.$isCustomSelectionIndicatorImage,
                                      isCustomBackgroundImage: self.$isCustomBackgroundImage)
                } label: {
                    Text("Selecte to Test")
                }
            }
            
            Picker("Number of Tabs", selection: self.$numberOfTabs) {
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
                Text("6").tag(6)
            }
            
            Toggle("Modal Presentation", isOn: self.$isModalPresentation)
            Toggle("Custom Colors", isOn: self.$isCustomColor)
            Toggle("Custom Selection Indicator Image", isOn: self.$isCustomSelectionIndicatorImage)
            Toggle("Custom Background Image", isOn: self.$isCustomBackgroundImage)
        }
        .navigationTitle("TabView Example")
    }
}

#Preview {
    NavigationStack {
        TabViewExample()
    }
}

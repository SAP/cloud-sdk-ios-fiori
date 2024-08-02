import FioriSwiftUICore
import SwiftUI

struct TabViewExample: View {
    @State var isPresented: Bool = false
    @State var numberOfTabs: Int = 4
    @State var isModalPresentation: Bool = false
    @State var isCustomColor: Bool = false
    @State var isCustomSelectionIndicatorImage: Bool = false
    @State var isCustomBackgroundImage: Bool = false
    @State var isSystemTabView: Bool = false

    var body: some View {
        Form {
            if self.isModalPresentation {
                HStack {
                    Text("Select to Test")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.isPresented.toggle()
                }
                .sheet(isPresented: self.$isPresented) {
                    TabViewDetailView(numberOfTabs: self.numberOfTabs,
                                      isCustomColor: self.isCustomColor,
                                      isCustomSelectionIndicatorImage: self.isCustomSelectionIndicatorImage,
                                      isCustomBackgroundImage: self.isCustomBackgroundImage,
                                      isSystemTabView: self.isSystemTabView)
                }
            } else {
                NavigationLink {
                    TabViewDetailView(numberOfTabs: self.numberOfTabs,
                                      isCustomColor: self.isCustomColor,
                                      isCustomSelectionIndicatorImage: self.isCustomSelectionIndicatorImage,
                                      isCustomBackgroundImage: self.isCustomBackgroundImage,
                                      isSystemTabView: self.isSystemTabView)
                } label: {
                    Text("Select to Test")
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
            Toggle("Custom Colors and Font Size", isOn: self.$isCustomColor)
            Toggle("Custom Selection Indicator Image", isOn: self.$isCustomSelectionIndicatorImage)
            Toggle("Custom Background Image", isOn: self.$isCustomBackgroundImage)
            Toggle("SwiftUI TabView", isOn: self.$isSystemTabView)
        }
        .navigationTitle("TabView Options")
    }
}

#Preview {
    NavigationStack {
        TabViewExample()
    }
}

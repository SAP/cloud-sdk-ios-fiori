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
            if isModalPresentation {
                HStack {
                    Text("Selecte to Test")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    isPresented.toggle()
                }
                .sheet(isPresented: $isPresented) {
                    TabViewDetailView(numberOfTabs: $numberOfTabs,
                                      isCustomColor: $isCustomColor,
                                      isCustomSelectionIndicatorImage: $isCustomSelectionIndicatorImage,
                                      isCustomBackgroundImage: $isCustomBackgroundImage)
                }
            } else {
                NavigationLink {
                    TabViewDetailView(numberOfTabs: $numberOfTabs,
                                      isCustomColor: $isCustomColor,
                                      isCustomSelectionIndicatorImage: $isCustomSelectionIndicatorImage,
                                      isCustomBackgroundImage: $isCustomBackgroundImage)
                } label: {
                    Text("Selecte to Test")
                }
            }
            
            Picker("Number of Tabs", selection: $numberOfTabs) {
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
                Text("6").tag(6)
            }
            
            Toggle("Modal Presentation", isOn: $isModalPresentation)
            Toggle("Custom Colors", isOn: $isCustomColor)
            Toggle("Custom Selection Indicator Image", isOn: $isCustomSelectionIndicatorImage)
            Toggle("Custom Background Image", isOn: $isCustomBackgroundImage)
        }
        .navigationTitle("TabView Example")
    }
}

#Preview {
    NavigationStack {
        TabViewExample()
    }
}

import FioriSwiftUICore
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
            NavigationLink("Misc Tests", destination: LazyView(MiscTestsView()))
        }
        .navigationTitle("FioriButton")
    }
}

typealias Action = () -> Void

struct ButtonView: View {
    @Environment(\.isInMenu) private var isInMenu
    
    var title: String
    var action: Action
    init(title: String, action: @escaping Action) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        FioriButton { _ in
            print("ButtonView \"\(self.title)\" tappeded, isInMenu: \(self.isInMenu)")
            if self.isInMenu {
                self.action()
            }
        } label: { _ in
            Text(self.title)
        }.highPriorityGesture(TapGesture().onEnded {
            print("ButtonView \"\(self.title)\" tapped and triggered highPriorityGesture(TapGesture()), isInMenu: \(self.isInMenu)")
            if !self.isInMenu {
                self.action()
            }
        })
    }
}

struct MiscTestsView: View {
    var body: some View {
        List {
            ButtonView(title: "Button") {
                print("ButtonView action called")
            }
            
            Menu {
                ButtonView(title: "Button in a Menu") {
                    print("ButtonView action called")
                }.environment(\.isInMenu, true)
            } label: {
                Text("Menu Button Test")
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Card {
                    Text("Title")
                } subtitle: {
                    Text("Subtitle that goes to multiple lines before truncating just like that")
                } icons: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundColor(.preferredColor(.negativeLabel))
                    Image(systemName: "paperclip")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundColor(.preferredColor(.quaternaryLabel))
                    Text("1")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundColor(.preferredColor(.quaternaryLabel))
                } headerAction: {
                    ButtonView(title: "Button in the card") {
                        print("ButtonView action called")
                    }
                } counter: {
                    Text("1 of 3")
                }
                
                .onTapGesture {
                    print("Card tapped")
                }
                
                CardFooter {
                    ButtonView(title: "Primary") {
                        print("ButtonView action called")
                    }
                } secondaryAction: {
                    ButtonView(title: "Secondary") {
                        print("ButtonView action called")
                    }
                } tertiaryAction: {
                    ButtonView(title: "Tertiary") {
                        print("ButtonView action called")
                    }
                }
            }
        }
        .listRowSpacing(16)
    }
}

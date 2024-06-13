import FioriSwiftUICore
import SwiftUI

struct BannerMessageModifierExample: View {
    @State var show: Bool = true
    @State var pushContentDown: Bool = false
    @State var withLink: Bool = false
    @State var withAttachedAction: Bool = false

    @ViewBuilder
    var titleView: some View {
        if self.withAttachedAction {
            HStack {
                Spacer()
                self.messageContent
                Button(action: {
                    print("Custom button tapped in title")
                }, label: {
                    Text("Action")
                        .foregroundStyle(Color.preferredColor(.tintColor))
                })
                Spacer()
            }
        } else {
            self.messageContent
        }
    }
    
    @ViewBuilder
    var messageContent: some View {
        if self.withLink {
            Text("This is a banner message with [link](https://www.sap.com)")
        } else {
            Text("This is a banner message")
        }
    }
    
    var body: some View {
        List {
            ForEach(0 ..< 6) { index in
                Text("cell at index: \(index)")
            }
            Button {
                withAnimation(.linear) {
                    self.show.toggle()
                }
            } label: {
                Text("Show / Hide")
            }
            
            Toggle("Push Content Down", isOn: self.$pushContentDown)
            Toggle("With Link", isOn: self.$withLink)
            Toggle("With Attached Action", isOn: self.$withAttachedAction)
        }
        .bannerMessageView(isPresented: self.$show,
                           pushContentDown: self.$pushContentDown,
                           title: {
                               self.titleView
                           }, bannerTapped: {
                               print("banner is tapped")
                           })
        .navigationTitle("Banner Message")
    }
}

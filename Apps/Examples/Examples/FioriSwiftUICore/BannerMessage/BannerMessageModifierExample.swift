import FioriSwiftUICore
import SwiftUI

struct BannerMessageModifierExample: View {
    @State var show: Bool = true
    @State var pushContentDown: Bool = false
    @State var withLink: Bool = false
    @State var withAttachedAction: Bool = false
    @State var withLongText: Bool = false
    @State var bannerStyle: Int = 0
    
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
        let text = self.withLongText ? "This is a very very very very very very very very very very very long banner message" : "This is a banner message"
        if self.withLink {
            Text("\(text) with [link](https://www.sap.com)")
        } else {
            Text("\(text)")
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
            Toggle("Long Text", isOn: self.$withLongText)
            
            Picker("Banner Style", selection: self.$bannerStyle) {
                Text("Neutral").tag(0)
                Text("Positive").tag(1)
                Text("Negative").tag(2)
                Text("Information").tag(3)
            }
        }
        .bannerMessageView(isPresented: self.$show,
                           pushContentDown: self.$pushContentDown,
                           title: {
                               self.titleView
                           }, bannerTapped: {
                               print("banner is tapped")
                           })
        .bannerMessageStyle(self.style)
        .typeErased
        .navigationTitle("Banner Message")
    }
    
    var style: any BannerMessageStyle {
        switch self.bannerStyle {
        case 0:
            return BannerMessageNeutralStyle()
        case 1:
            return BannerMessagePositiveStyle()
        case 2:
            return BannerMessageNegativeStyle()
        case 3:
            return BannerMessageInformationStyle()
        default:
            return BannerMessageNeutralStyle()
        }
    }
}

// MARK: - Negative Style

struct BannerMessageNegativeStyle: BannerMessageStyle {
    func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty {
                    Image(systemName: "exclamationmark.octagon.fill")
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                } else {
                    iconConfiguration.icon
                }
            })
            .topDividerStyle(content: { topDividerConfiguration in
                topDividerConfiguration.topDivider
                    .background(Color.preferredColor(.negativeLabel))
            })
            .titleStyle(content: { titleConfiguration in
                titleConfiguration.title
                    .foregroundStyle(Color.preferredColor(.negativeLabel))
                    .font(.fiori(forTextStyle: .footnote))
            })
    }
}

// MARK: - Neutral Style

struct BannerMessageNeutralStyle: BannerMessageStyle {
    func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.preferredColor(.neutralLabel))
                } else {
                    iconConfiguration.icon
                }
            })
            .topDividerStyle(content: { topDividerConfiguration in
                topDividerConfiguration.topDivider
                    .background(Color.preferredColor(.neutralLabel))
            })
            .titleStyle(content: { titleConfiguration in
                titleConfiguration.title
                    .foregroundStyle(Color.preferredColor(.neutralLabel))
                    .font(.fiori(forTextStyle: .footnote))
            })
    }
}

// MARK: - Information Style

struct BannerMessageInformationStyle: BannerMessageStyle {
    func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.preferredColor(.informativeLabel))
                } else {
                    iconConfiguration.icon
                }
            })
            .topDividerStyle(content: { topDividerConfiguration in
                topDividerConfiguration.topDivider
                    .background(Color.preferredColor(.informativeLabel))
            })
            .titleStyle(content: { titleConfiguration in
                titleConfiguration.title
                    .foregroundStyle(Color.preferredColor(.informativeLabel))
                    .font(.fiori(forTextStyle: .footnote))
            })
    }
}

// MARK: - Positive Style

struct BannerMessagePositiveStyle: BannerMessageStyle {
    func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(content: { iconConfiguration in
                if iconConfiguration.icon.isEmpty {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.preferredColor(.positiveLabel))
                } else {
                    iconConfiguration.icon
                }
            })
            .topDividerStyle(content: { topDividerConfiguration in
                topDividerConfiguration.topDivider
                    .background(Color.preferredColor(.positiveLabel))
            })
            .titleStyle(content: { titleConfiguration in
                titleConfiguration.title
                    .foregroundStyle(Color.preferredColor(.positiveLabel))
                    .font(.fiori(forTextStyle: .footnote))
            })
    }
}

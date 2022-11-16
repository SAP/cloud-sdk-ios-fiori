import SwiftUI

/**
 `EmptyStateView`, an empty state view, conforms to the `View` protocol and is shown when the container has no data.
  */
public struct EmptyStateView: View {
    @State var title: String = "Unable to load data"
    @State var titleAttributes: [NSAttributedString.Key: Any]? = nil
    @State var image: Image? = nil
    @State var description: String? = nil
    @State var descriptionAttributes: [NSAttributedString.Key: Any]? = nil
    @State var buttonText: String? = nil
    @State var buttonAttributes: [NSAttributedString.Key: Any]? = nil
    @State var onChangedHandle: (() -> Void)? = nil
    
    public var body: some View {
        GeometryReader { proxy in
            VStack {
                // image
                if let uiImage = image {
                    uiImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160)
                        .padding(.bottom, 4)
                        .background(Color.gray)
                }

                // title
                if let title = self.title {
                    let textColor = titleAttributes?[.foregroundColor] as? Color
                    let textFont = titleAttributes?[.font] as? Font
                    Text(title)
                        .foregroundColor(textColor ?? Color.preferredColor(.primaryLabel))
                        .font(textFont ?? Font.fiori(forTextStyle: .body).weight(.medium))
                        .lineLimit(1)
                        .padding(4)
                }

                // description
                if let description = self.description {
                    let developerColor = descriptionAttributes?[.foregroundColor] as? Color
                    let developerFont = descriptionAttributes?[.font] as? Font
                    Text(description)
                        .lineLimit(3)
                        .foregroundColor(developerColor ?? Color.preferredColor(.tertiaryLabel))
                        .font(developerFont ?? Font.fiori(forTextStyle: .body))
                        .padding(.bottom, 10)
                        .multilineTextAlignment(.center)
                }

                // handle button
                if let buttonTitle = self.buttonText {
                    let developerColor = buttonAttributes?[.foregroundColor] as? Color
                    let developerFont = buttonAttributes?[.font] as? Font
                    let developerBgColor = buttonAttributes?[.backgroundColor] as? Color
                    Button(buttonTitle) {
                        if let handle = self.onChangedHandle {
                            handle()
                        }
                    }
                    .padding(EdgeInsets(top: 5, leading: 30, bottom: 5, trailing: 30))
                    .foregroundColor(developerColor ?? Color.preferredColor(.baseWhite))
                    .font(developerFont ?? Font.fiori(forTextStyle: .body))
                    .background(developerBgColor ?? Color.preferredColor(.tintColor))
                    .cornerRadius(5)
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EmptyStateView(title: "CustomTitle", image: Image("flower"), description: "CustomDescription", buttonText: "Refresh Data")
            Divider()
            EmptyStateView()
        }
    }
}

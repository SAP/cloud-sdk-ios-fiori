import SwiftUI

struct ExpHeaderView: View {
    var title: String?
    var subtitle = "Subtitle"
    var desc: String?
    var back = Color.yellow
    var textColor = Color.black

    init(_ title: String?, subtitle: String, desc: String?, back: Color = Color.yellow, textColor: Color = Color.black) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }

    var body: some View {
        VStack(spacing: 15) {
            if title != nil {
                Text(title!)
                    .font(.fiori(forTextStyle: .largeTitle))
            } else {
                EmptyView()
            }

            Text(subtitle)
                .foregroundColor(.gray)

            if let desc = desc {
                DescView(desc: desc, back: back, textColor: textColor)
            }
        }
    }
}

struct HeaderView_TitleSubtitle_Previews: PreviewProvider {
    static var previews: some View {
        ExpHeaderView("Title", subtitle: "Subtitle", desc: nil)
    }
}

struct HeaderView_TitleSubtitleDesc_Previews: PreviewProvider {
    static var previews: some View {
        ExpHeaderView("Title", subtitle: "Subtitle", desc: "Desc only")
    }
}

struct HeaderView_Subtitle_Previews: PreviewProvider {
    static var previews: some View {
        ExpHeaderView(nil, subtitle: "Subtitle", desc: nil)
    }
}

struct HeaderView_All_Previews: PreviewProvider {
    static var previews: some View {
        ExpHeaderView("Title", subtitle: "Subtitle", desc: "What does what",
                      back: .green, textColor: .white)
    }
}

struct DescView: View {
    var desc = "Use this to..."
    var back = Color.yellow
    var textColor = Color.black

    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .padding()
            .background(back)
            .foregroundColor(textColor)
    }
}

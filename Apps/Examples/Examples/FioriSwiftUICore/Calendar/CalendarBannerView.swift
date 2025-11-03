import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct CalendarBannerView: View {
    @State var title: String
    @State var bottomPadding: CGFloat = 0
    let closeAction: (() -> Void)?
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline, spacing: 6) {
                HStack {
                    Image(fioriName: "fiori.notification.3")
                        .foregroundStyle(Color.preferredColor(.negativeLabel))
                    
                    Text(self.formatCalendarViewDisplayMessage(self.title))
                        .padding([.top, .bottom], 13)
                        .foregroundStyle(Color(UIColor.white))
                }
                
                Spacer(minLength: 0)
                
                FioriButton { _ in
                    self.closeAction?()
                } label: { _ in
                    Image(fioriName: "fiori.decline")
                        .foregroundStyle(Color(UIColor.white))
                }
            }
            .frame(minHeight: 40.0)
            .padding([.leading], 16)
            .padding(.top, 4)
            .padding(.bottom, self.bottomPadding)
        }
        .background(Color.preferredColor(.tintColor))
    }
    
    /// :nodoc:
    func formatCalendarViewDisplayMessage(_ message: String) -> AttributedString {
        let substringArray = message.split(separator: " ")
        let attributedSubstringArray = NSMutableAttributedString(string: "")
        for (index, item) in substringArray.enumerated() {
            let str = NSMutableAttributedString(string: String(item))
            str.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(0 ..< str.length))
            str.addAttribute(NSAttributedString.Key.font, value: UIFont.preferredFioriFont(forTextStyle: .subheadline, weight: .regular), range: NSRange(0 ..< str.length))

            if index == 0 { //  || index == 2
                str.addAttribute(NSAttributedString.Key.font, value: UIFont.preferredFioriFont(forTextStyle: .subheadline, weight: .bold), range: NSRange(0 ..< str.length))
            }
            attributedSubstringArray.append(str)
            attributedSubstringArray.append(NSMutableAttributedString(string: " "))
        }
        return AttributedString(attributedSubstringArray)
    }
}

#Preview {
    CalendarBannerView(title: "Tap to select dates", closeAction: nil)
}

import SwiftUI

struct FootnoteIconsListView<T: FootnoteIconList>: View {
    let icons: T
    
    var count: Int {
        self.icons.count
    }
    
    var maxCount: Int {
        self.icons.maxCount
    }

    var size: CGSize {
        self.icons.size
    }

    var isCircular: Bool {
        self.icons.isCircular
    }

    var spacing: CGFloat {
        self.icons.spacing
    }

    var text: (any View)? {
        self.icons.text
    }

    var textPosition: TextPosition {
        self.icons.textPosition
    }

    @State var totalHeight: CGFloat = 3000
    
    // This condition check if for handle recursive builder issue.
    func checkIsNestingIcons() -> Bool {
        let typeString = String(describing: T.self)
        return typeString.contains("SingleFootnoteIcon<SingleFootnoteIcon") || typeString.contains("SingleFootnoteIcon<PairFootnoteIcon") || typeString.contains("PairFootnoteIcon<")
    }
    
    var body: some View {
        if self.count == 1, self.checkIsNestingIcons() {
            self.icons.view(at: 0)
        } else {
            Group {
                switch self.textPosition {
                case .top:
                    VStack(spacing: 6) {
                        self.textView
                        self.avatarsView()
                    }
                case .bottom:
                    VStack(spacing: 6) {
                        self.avatarsView()
                        self.textView
                    }
                case .leading, .trailing:
                    self.avatarsView(withText: true)
                }
            }
        }
    }
    
    @ViewBuilder
    var textView: some View {
        if self.text != nil {
            self.text?.typeErased
                .frame(idealWidth: 10)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func avatarsView(withText: Bool = false) -> some View {
        GeometryReader { geo in
            HStack(spacing: 6) {
                if withText, self.textPosition == .leading {
                    self.textView
                }
                HStack(spacing: self.spacing) {
                    let itemsCount = maxCount <= 0 ? self.count : min(self.count, maxCount)
                    let textRetainedWidth: CGFloat = self.text == nil ? 0 : 60
                    let maxCount = Int((geo.size.width - textRetainedWidth + self.spacing) / (self.size.width + self.spacing))
                    let countToShow = min(max(maxCount, 0), max(itemsCount, 0))
                    ForEach(0 ..< countToShow, id: \.self) { index in
                        self.icons.view(at: index)
                            .frame(width: self.size.width, height: self.size.height)
                            .ifApply(self.isCircular) {
                                $0.clipShape(Capsule())
                            }
                            .overlay {
                                Group {
                                    if self.isCircular {
                                        Capsule()
                                            .inset(by: 0.33 / 2.0)
                                            .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
                                    } else {
                                        Rectangle()
                                            .inset(by: 0.33 / 2.0)
                                            .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
                                    }
                                }
                            }
                    }
                }
                if withText, self.textPosition == .trailing {
                    self.textView
                }
            }.background(
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        self.totalHeight = geo.size.height
                    }
                    return Color.clear
                }
            )
        }.frame(height: self.totalHeight)
    }
}

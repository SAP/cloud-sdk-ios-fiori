import SwiftUI

struct ItemView: View {
    let dataItem: TableDataItem
    
    var dropVerticalShadow: Bool = false
    
    @State var value: String = ""
    @EnvironmentObject var layoutManager: TableLayoutManager
    @EnvironmentObject var dataManager: TableDataManager

    let isHeader: Bool
    let index: (Int, Int)
    
    init(_ dataItem: TableDataItem, _ index: (Int, Int), _ isHeader: Bool = false, dropShadow: Bool) {
        self.dataItem = dataItem
        self.index = index
        self.isHeader = isHeader
        self.dropVerticalShadow = dropShadow
    }
    
    var body: some View {
        //        Rectangle()
        //            .fill(Color.preferredColor(.headerBlended))
        //            .blur(radius: 10)
        //            .frame(width: dataItem.size.width * self.layoutManager.scaleX, height: dataItem.rowHeight * self.layoutManager.scaleY, alignment: .leading)
        makeBody()
    }
    
    func makeBody() -> some View {
        let contentInset = TableViewLayout.contentInset(sizeClass: self.layoutManager.sizeClass)
        let tapGesture = TapGesture()
            .onEnded { _ in
                guard self.dataItem.rowIndex >= 0 else {
                    return
                }
                print("Tapped on row: \(self.dataItem.rowIndex)")
                if let handler = self.layoutManager.model.didSelectRowAt {
                    handler(self.dataItem.rowIndex)
                }
                if self.layoutManager.isEditing {
                    if !self.dataManager.selectedIndexes.contains(self.dataItem.rowIndex) {
                        self.dataManager.selectedIndexes.append(self.dataItem.rowIndex)
                    } else {
                        self.dataManager.selectedIndexes.removeAll { (target) -> Bool in
                            target == self.dataItem.rowIndex
                        }
                    }
                }
            }
        let backgroundColor: Color = self.isHeader ? Color.preferredColor(.headerBlended) : Color.preferredColor(.cellBackground)
        return
            ZStack {
                Group {
                    switch dataItem.value {
                    case .image(let image):
                        image
                            .frame(width: 45 * self.layoutManager.scaleX, height: 45 * self.layoutManager.scaleY)
                    case .text(let value):
                        let fontSize: CGFloat = self.isHeader ? UIFont.preferredFont(from: .subheadline).pointSize : UIFont.preferredFont(from: .body).pointSize
                        let font: Font = isHeader ? .subheadline : .body
                        let textColor: Color = self.isHeader ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.primaryLabel)
                        Text(value)
                            .font(.system(size: fontSize * self.layoutManager.scaleX))
                            .foregroundColor(textColor)
                            .multilineTextAlignment(dataItem.textAlignment)
                            .frame(width: dataItem.size.width * self.layoutManager.scaleX, height: dataItem.rowHeight * self.layoutManager.scaleY, alignment: dataItem.textAlignment.toTextFrameAlignment())
                    }
                }
                .frame(width: (dataItem.size.width + contentInset * 2) * self.layoutManager.scaleX, height: dataItem.rowHeight * self.layoutManager.scaleY, alignment: .center)
                .background(backgroundColor)
                
                if index == (0, 0) && self.layoutManager.model.firstColumnSticky {
                    let offsetX: CGFloat = self.dataItem.size.width / 2 + contentInset
                    verticalDivider(offsetX: offsetX)
                }
            }
            .gesture(tapGesture)
    }
    
    func verticalDivider(offsetX: CGFloat) -> some View {
        HStack {
            Divider()
                .frame(height: UIScreen.main.bounds.height * self.layoutManager.scaleY)
                .offset(x: offsetX * self.layoutManager.scaleX, y: (UIScreen.main.bounds.height - self.dataItem.rowHeight) / 2)
                .dropShadow(isVertical: true, show: self.dropVerticalShadow)
        }
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {}
}

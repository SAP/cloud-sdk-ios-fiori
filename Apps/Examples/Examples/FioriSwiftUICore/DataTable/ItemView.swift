import SwiftUI

struct ItemView: View {
    let dataItem: TableDataItem
    
    var dropVerticalShadow: Bool = false
    
    @State var value: String = ""
    @EnvironmentObject var layoutManager: TableLayoutManager
    
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
            }
        
        return
            ZStack {
                Group {
                    switch dataItem.value {
                    case .image(let image):
                        image
                            .frame(width: 45, height: 45)
                    case .text(let value):
                        let fontSize: CGFloat = self.isHeader ? UIFont.preferredFont(from: .subheadline).pointSize : UIFont.preferredFont(from: .body).pointSize
                        let font: Font = isHeader ? .subheadline : .body
                        let textColor: Color = self.isHeader ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.primaryLabel)
                        Text(value)
                            .font(.system(size: fontSize * self.layoutManager.scaleX))
                            .foregroundColor(textColor)
                            .multilineTextAlignment(.leading)
                            .frame(width: dataItem.size.width, height: dataItem.rowHeight, alignment: .leading)
                            .background(Color.red)
                    }
                }
                .frame(width: dataItem.size.width + contentInset * 2, height: dataItem.rowHeight, alignment: .center)
                .background(Color.yellow)
                
                if index.0 == 0 && index.1 == 0 && self.layoutManager.model.isFirstColumnSticky {
                    let offsetX: CGFloat = self.dataItem.size.width / 2 + contentInset
                    verticalDivider(offsetX: offsetX)
                }
            }
            .gesture(tapGesture)
    }
    
    func verticalDivider(offsetX: CGFloat) -> some View {
        HStack {
            Divider()
                .frame(height: UIScreen.main.bounds.height)
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

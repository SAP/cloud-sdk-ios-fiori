import SwiftUI

struct BackgroundForRow: View {
    var model: TableModel
    let rowHeight: CGFloat
    let index: Int
    
    init(model: TableModel, rowHeight: CGFloat, index: Int) {
        self.model = model
        self.rowHeight = rowHeight
        self.index = index
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> AnyView {
        guard let firstItem = self.model.allDataItems[self.index].first else {
            return AnyView(EmptyView())
        }
        guard let lastItem = self.model.allDataItems[self.index].last else {
            return AnyView(EmptyView())
        }
        
        guard let displayingItem = self.model.displayingItems[self.index].first else {
            return AnyView(EmptyView())
        }
        let defaultWidth = rect.size.width
        let y = displayingItem.pos.y
        
        return AnyView(
            Rectangle()
                .fill(Color.white)
                .frame(width: defaultWidth + lastItem.size.width * 2, height: self.rowHeight)
                .position(x: defaultWidth / 2 - firstItem.size.width / 2, y: y - 1)
        )
    }
}

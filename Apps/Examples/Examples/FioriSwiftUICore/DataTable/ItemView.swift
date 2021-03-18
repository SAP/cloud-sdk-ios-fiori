import SwiftUI

struct ItemView: View {
    let dataItem: TableDataItem
    let scale: CGFloat
    @State var value: String = ""
    @EnvironmentObject var model: TableModel
    
    let isHeader: Bool
    let index: (Int, Int)
    
    init(_ dataItem: TableDataItem, _ scale: CGFloat, _ index: (Int, Int), _ isHeader: Bool = false) {
        self.dataItem = dataItem
        self.scale = scale
        self.index = index
        self.isHeader = isHeader
    }
    
    var body: some View {
        Group {
            switch dataItem.value {
            case .image(let image):
                image
                    .frame(width: 45, height: 45)
            case .text(let value):
                let fontSize: CGFloat = self.isHeader ? UIFont.preferredFont(from: .subheadline).pointSize : UIFont.preferredFont(from: .body).pointSize
                let textColor: Color = self.isHeader ? .gray : .black
                let backGroundHeight = isHeader ? dataItem.rowHeight : dataItem.size.height
                Text(value)
                    .font(.system(size: fontSize * self.scale))
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.leading)
                    .frame(width: dataItem.size.width, height: dataItem.size.height, alignment: .leading)
            }
        }
        .background(makeBackground())
    }
    
    func makeBackground() -> some View {
        Rectangle()
            .fill(Color.white)
    }
}

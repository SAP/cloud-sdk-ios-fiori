import Foundation
import SwiftUI

struct TrailingAccessoryView: View {
    let rowIndex: Int
    @EnvironmentObject var layoutManager: TableLayoutManager

    init(rowIndex: Int) {
        self.rowIndex = rowIndex
    }
    
    var body: some View {
        Group {
            if self.layoutManager.layoutData != nil, rowIndex < self.layoutManager.numberOfRows() {
                makeBody(layoutData: self.layoutManager.layoutData!)
            } else {
                EmptyView()
            }
        }
    }
    
    func makeBody(layoutData: LayoutData) -> some View {
        let trailingItem: AccessoryItem? = layoutData.rowData[self.rowIndex].trailingAccessory
        
        return Group {
            if let item = trailingItem {
                switch item {
                case .button(let button):
                    Button(action: {
                        button.action()
                    }) {
                        button.image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(8 * self.layoutManager.scaleX)
                    }
                    .frame(width: TableViewLayout.buttonSize * self.layoutManager.scaleX, height: TableViewLayout.buttonSize * self.layoutManager.scaleY, alignment: .center)
                    .padding(.leading, TableViewLayout.rightPaddingForLeadingAccessoryView(self.layoutManager.sizeClass) * self.layoutManager.scaleX)
                case .icon(let image):
                    image
                        .resizable()
                        .imageScale(.large)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(TableViewLayout.defaultForegroundColor)
                        .frame(width: TableViewLayout.iconSize * self.layoutManager.scaleX, height: TableViewLayout.iconSize * self.layoutManager.scaleY, alignment: .center)
                        .padding(.leading, TableViewLayout.rightPaddingForLeadingAccessoryView(self.layoutManager.sizeClass) * self.layoutManager.scaleX)
                }
            } else {
                EmptyView()
            }
        }
    }
    
    func applyBlur(height: CGFloat) -> some View {
        self.layoutManager.model.backgroundColor
            .frame(width: 44 * self.layoutManager.scaleX, height: height, alignment: .center)
            .blur(radius: 8)
    }
}

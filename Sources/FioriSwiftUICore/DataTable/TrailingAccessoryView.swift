import Foundation
import SwiftUI

struct TrailingAccessoryView: View {
    let rowIndex: Int
    let layoutManager: TableLayoutManager
    let layoutData: LayoutData
    
    init(rowIndex: Int, layoutManager: TableLayoutManager, layoutData: LayoutData) {
        self.rowIndex = rowIndex
        self.layoutManager = layoutManager
        self.layoutData = layoutData
    }
    
    var body: some View {
        let trailingItem: AccessoryItem? = self.layoutData.rowData[self.rowIndex].trailingAccessory
        
        return Group {
            if let item = trailingItem {
                switch item {
                case .button(let button):
                    Button(action: {
                        self.layoutManager.saveEditingTextChange()
                        
                        button.action()
                    }) {
                        button.image?
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(8 * self.layoutManager.scaleX)
                    }
                    .frame(width: TableViewLayout.buttonSize * self.layoutManager.scaleX, height: TableViewLayout.buttonSize * self.layoutManager.scaleY, alignment: .center)
                    .padding(.leading, TableViewLayout.rightPaddingForLeadingAccessoryView(self.layoutManager.sizeClass) * self.layoutManager.scaleX)
                case .icon(let image):
                    image
                        .renderingMode(.template)
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
        .onTapGesture {
            // save text changes
            self.layoutManager.saveEditingTextChange()
        }
    }
}

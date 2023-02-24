import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let rowIndex: Int
    @EnvironmentObject var layoutManager: TableLayoutManager
    
    init(rowIndex: Int) {
        self.rowIndex = rowIndex
    }
    
    var body: some View {
        Group {
            if self.layoutManager.layoutData != nil, self.layoutManager.layoutWorkItem == nil, rowIndex < self.layoutManager.numberOfRows() {
                makeBody(layoutData: self.layoutManager.layoutData!)
            } else {
                EmptyView()
            }
        }
    }
    
    func makeBody(layoutData: LayoutData) -> some View {
        let rowItem = layoutData.rowData[self.rowIndex]
        let items: [AccessoryItem] = rowItem.leadingAccessories
        
        return HStack(alignment: .center, spacing: TableViewLayout.accessorySpacing) {
            makeSectionButton(layoutData: layoutData)
            ForEach(0 ..< items.count, id: \.self) { index in
                switch items[index] {
                case .button(let button):
                    Button(action: {
                        button.action()
                    }) {
                        button.image?
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(8 * self.layoutManager.scaleX)
                    }
                    .frame(width: TableViewLayout.buttonSize * self.layoutManager.scaleX, height: TableViewLayout.buttonSize * self.layoutManager.scaleY)
                    
                case .icon(let image):
                    image
                        .renderingMode(.template)
                        .resizable()
                        .imageScale(.large)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(TableViewLayout.defaultForegroundColor)
                        .frame(width: TableViewLayout.iconSize * self.layoutManager.scaleX, height: TableViewLayout.iconSize * self.layoutManager.scaleY, alignment: .center)
                }
            }
            
            Spacer(minLength: 0)
        }
        .frame(width: layoutData.leadingAccessoryViewWidth * self.layoutManager.scaleX,
               height: layoutData.rowHeights[self.rowIndex] * self.layoutManager.scaleY)
        .background(self.layoutManager.model.backgroundColor)
    }
    
    func makeSectionButton(layoutData: LayoutData) -> some View {
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        let rowItem = layoutData.rowData[self.rowIndex]
        let selectionIndex: Int = self.rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)

        let isSelected = self.layoutManager.selectedIndexes.contains(selectionIndex)
        let selectedImage = rowItem.selectedImage ?? Image(systemName: "checkmark.circle.fill")
        let deSelectedImage = rowItem.deSelectedImage ?? Image(systemName: "circle")
        
        return Group {
            if self.layoutManager.model.editMode == .select, !isHeader {
                Button(action: {
                    if !self.layoutManager.selectedIndexes.contains(selectionIndex) {
                        self.layoutManager.selectedIndexes.append(selectionIndex)
                        self.layoutManager.model.selectedIndexes.append(selectionIndex)
                    } else {
                        self.layoutManager.selectedIndexes.removeAll { (target) -> Bool in
                            target == selectionIndex
                        }
                        self.layoutManager.model.selectedIndexes.removeAll { (target) -> Bool in
                            target == selectionIndex
                        }
                    }
                }) {
                    if isSelected {
                        selectedImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(8 * self.layoutManager.scaleX)
                    } else {
                        deSelectedImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(8 * self.layoutManager.scaleX)
                    }
                }
                .frame(width: TableViewLayout.buttonSize * self.layoutManager.scaleX, height: TableViewLayout.buttonSize * self.layoutManager.scaleY)
            } else {
                AnyView(EmptyView())
            }
        }
    }
}

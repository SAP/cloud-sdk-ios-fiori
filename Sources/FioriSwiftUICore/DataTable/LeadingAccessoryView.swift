import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let rowIndex: Int
    let layoutManager: TableLayoutManager
    let layoutData: LayoutData
    let selectionIndex: Int
    let isSelected: Bool
    
    init(rowIndex: Int, layoutManager: TableLayoutManager, layoutData: LayoutData) {
        self.rowIndex = rowIndex
        self.layoutManager = layoutManager
        self.layoutData = layoutData
        self.selectionIndex = rowIndex - (layoutManager.model.hasHeader ? 1 : 0)
        self.isSelected = layoutManager.selectedIndexes.contains(self.selectionIndex)
    }
    
    var body: some View {
        let rowItem = self.layoutData.rowData[self.rowIndex]
        let items: [AccessoryItem] = rowItem.leadingAccessories
        let isHeader: Bool = self.rowIndex == 0 && self.layoutManager.model.hasHeader
        /// row index starts from 1 for voice over
        let rowIndexForVoiceOver = self.rowIndex + (self.layoutManager.model.hasHeader ? 0 : 1)
        let cellType = NSLocalizedString("leading accessory", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let rowFormat = NSLocalizedString("row %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let rowLabel = String.localizedStringWithFormat(rowFormat, rowIndexForVoiceOver)
        
        return HStack(alignment: .center, spacing: TableViewLayout.accessorySpacing) {
            if self.layoutManager.model.editMode == .select, !isHeader {
                self.makeSectionButton(layoutData: self.layoutData)
            }
            
            ForEach(0 ..< items.count, id: \.self) { index in
                switch items[index] {
                case .button(let button):
                    Button(action: {
                        // save text changes
                        self.layoutManager.saveEditingTextChange()
                        
                        button.action()
                    }) {
                        button.image?
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(8 * self.layoutManager.scaleX)
                    }
                    .frame(width: TableViewLayout.buttonSize * self.layoutManager.scaleX, height: TableViewLayout.buttonSize * self.layoutManager.scaleY)
                    .accessibilityLabel("\(rowLabel), \(cellType)")
                    
                case .icon(let image):
                    image
                        .renderingMode(.template)
                        .resizable()
                        .imageScale(.large)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(TableViewLayout.defaultForegroundColor)
                        .frame(width: TableViewLayout.iconSize * self.layoutManager.scaleX, height: TableViewLayout.iconSize * self.layoutManager.scaleY, alignment: .center)
                        .accessibilityLabel("\(rowLabel), \(cellType)")
                }
            }
            
            Spacer(minLength: 0)
        }
        .frame(width: self.layoutData.leadingAccessoryViewWidth * self.layoutManager.scaleX,
               height: self.layoutData.rowHeights[self.rowIndex] * self.layoutManager.scaleY)
        .background(self.layoutManager.model.editMode == .select && self.isSelected ? Color.preferredColor(.informationBackground) : Color.clear)
        .background(self.layoutManager.model.backgroundColor)
        .onTapGesture {
            // save text changes
            self.layoutManager.saveEditingTextChange()
        }
    }
    
    func makeSectionButton(layoutData: LayoutData) -> some View {
        let rowItem = layoutData.rowData[self.rowIndex]
        let selectedImage = rowItem.selectedImage ?? Image(systemName: "checkmark.circle.fill")
        let deSelectedImage = rowItem.deSelectedImage ?? Image(systemName: "circle")
        /// row index starts from 1 for voice over
        let rowIndexForVoiceOver = self.rowIndex + (self.layoutManager.model.hasHeader ? 0 : 1)
        let rowFormat = NSLocalizedString("row %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let rowLabel = String.localizedStringWithFormat(rowFormat, rowIndexForVoiceOver)
        let isSelectedLabel = self.isSelected ? NSLocalizedString("selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : NSLocalizedString("not selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        return Button(action: {
            if !self.layoutManager.selectedIndexes.contains(self.selectionIndex) {
                self.layoutManager.selectedIndexes.append(self.selectionIndex)
                self.layoutManager.model.selectedIndexes.append(self.selectionIndex)
            } else {
                self.layoutManager.selectedIndexes.removeAll { target -> Bool in
                    target == self.selectionIndex
                }
                self.layoutManager.model.selectedIndexes.removeAll { target -> Bool in
                    target == self.selectionIndex
                }
            }
        }) {
            if self.isSelected {
                selectedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(8 * self.layoutManager.scaleX)
            } else {
                deSelectedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.preferredColor(.separatorOpaque))
                    .padding(8 * self.layoutManager.scaleX)
            }
        }
        .frame(width: TableViewLayout.buttonSize * self.layoutManager.scaleX, height: TableViewLayout.buttonSize * self.layoutManager.scaleY)
        .accessibilityLabel("\(rowLabel)")
        .accessibilityValue("\(isSelectedLabel)")
        .accessibilityAddTraits(.isButton)
    }
}

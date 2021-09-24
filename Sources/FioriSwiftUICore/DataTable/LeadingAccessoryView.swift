import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let items: [AccessoryItem]
    let selectionIndex: Int
    let layoutIndex: Int
    let isHeader: Bool
    let isEditing: Bool
    let selectedImage: Image?
    let deSelectedImage: Image?
    
    @State var selected: Bool = false
    
    @EnvironmentObject var dataManager: TableDataManager
    @EnvironmentObject var layoutManager: TableLayoutManager
    @Environment(\.backgroundColor) var backgroundColor

    init(items: [AccessoryItem], index: Int, isHeader: Bool, isEditing: Bool, selectedImage: Image? = nil, deSelectedImage: Image? = nil) {
        self.items = items
        self.isHeader = isHeader
        self.layoutIndex = index
        self.selectionIndex = index - (isHeader ? 0 : 1)
        self.isEditing = isEditing
        self.selectedImage = selectedImage
        self.deSelectedImage = deSelectedImage
    }
    
    var body: some View {
        Group {
            makeBody(items: self.items)
        }
    }
    
    func makeBody(items: [AccessoryItem]) -> AnyView {
        guard self.layoutIndex < self.layoutManager.rowHeights.count else {
            return AnyView(EmptyView())
        }

        let totalWidth = self.layoutManager.leadingItemsWidths[self.layoutIndex]
        let offset = totalWidth / 2

        return AnyView(
            HStack(alignment: .center, spacing: 4) {
                makeSectionButton()
                ForEach(0 ..< items.count, id: \.self) { index in
                    switch items[index] {
                    case .button(let button):
                        makeButton(button: button)
                    case .icon(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(TableViewLayout.defaultForegroundColor)
                            .frame(width: 16 * self.layoutManager.scaleX, height: 16 * self.layoutManager.scaleY, alignment: .center)
                    case .text(let string):
                        Text(string)
                    }
                }
            }
            .frame(height: self.layoutManager.rowHeights[self.layoutIndex] * self.layoutManager.scaleY)
            .offset(x: offset * self.layoutManager.scaleX)
            .background(self.backgroundColor)
        )
    }
    
    func makeButton(button: AccessoryButton) -> some View {
        Group {
            if self.layoutManager.isEditing {
                Button(action: {
                    print("Left Icon button was tapped")
                    
                    button.action()
                }) {
                    button.image
                }
                .frame(width: 44 * self.layoutManager.scaleX, height: 44 * self.layoutManager.scaleY)
            } else {
                AnyView(EmptyView())
            }
        }
    }
    
    func makeSectionButton() -> some View {
        DispatchQueue.main.async {
            self.selected = self.dataManager.selectedIndexes.contains(self.selectionIndex)
        }
        let selectedImage = self.selectedImage ?? Image(systemName: "checkmark.circle.fill")
        let deSelectedImage = self.deSelectedImage ?? Image(systemName: "circle")
        return
            Group {
                if self.layoutManager.isEditing, !isHeader {
                    Button(action: {
                        print("Left Icon button was tapped")
                        
                        if !self.dataManager.selectedIndexes.contains(self.selectionIndex) {
                            self.dataManager.selectedIndexes.append(self.selectionIndex)
                            self.layoutManager.model.selectedIndexes.append(self.selectionIndex)
                        } else {
                            self.dataManager.selectedIndexes.removeAll { (target) -> Bool in
                                target == self.selectionIndex
                            }
                            self.layoutManager.model.selectedIndexes.removeAll { (target) -> Bool in
                                target == self.selectionIndex
                            }
                        }
                        
                    }) {
                        self.selected ? AnyView(selectedImage.imageScale(.large)) : AnyView(deSelectedImage.imageScale(.large).foregroundColor(TableViewLayout.defaultForegroundColor))
                    }
                    .frame(width: 44 * self.layoutManager.scaleX, height: 44 * self.layoutManager.scaleY)
                } else {
                    AnyView(EmptyView())
                }
            }
    }
}

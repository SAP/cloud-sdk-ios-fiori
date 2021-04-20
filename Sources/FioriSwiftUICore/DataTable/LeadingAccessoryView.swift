import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let items: [AccessoryItem]
    let index: Int
    let isHeader: Bool
    let isEditing: Bool
    let selectedImage: Image?
    let deSelectedImage: Image?
    
    @State var selected: Bool = false
    
    @EnvironmentObject var dataManager: TableDataManager
    @EnvironmentObject var layoutManager: TableLayoutManager
    
    init(items: [AccessoryItem], index: Int, isHeader: Bool, isEditing: Bool, selectedImage: Image? = nil, deSelectedImage: Image? = nil) {
        self.items = items
        self.isHeader = isHeader
        self.index = index - (isHeader ? 0 : 1)
        self.isEditing = isEditing
        self.selectedImage = selectedImage
        self.deSelectedImage = deSelectedImage
    }
    
    var body: some View {
        Group {
            makeBody(items: self.items)
                .offset(x: self.layoutManager.leadingAccessoryViewWidth / 2)
        }
    }
    
    func makeBody(items: [AccessoryItem]) -> some View {
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
                        .frame(width: 12, height: 12, alignment: .center)
                case .text(let string):
                    Text(string)
                }
            }
        }
        .frame(height: self.layoutManager.rowHeights[self.index] * self.layoutManager.scaleY)
        .background(Color.white)
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
            self.selected = self.dataManager.selectedIndexes.contains(self.index)
        }
        let selectedImage = self.selectedImage ?? Image(systemName: "checkmark.circle.fill")
        let deSelectedImage = self.deSelectedImage ?? Image(systemName: "checkmark.circle")
        return
            Group {
                if self.layoutManager.isEditing, !isHeader {
                    Button(action: {
                        print("Left Icon button was tapped")
                        
                        if !self.dataManager.selectedIndexes.contains(self.index) {
                            self.dataManager.selectedIndexes.append(self.index)
                            self.layoutManager.model.selectedIndexes.append(self.index)
                        } else {
                            self.dataManager.selectedIndexes.removeAll { (target) -> Bool in
                                target == self.index
                            }
                            self.layoutManager.model.selectedIndexes.removeAll { (target) -> Bool in
                                target == self.index
                            }
                        }
                        
                    }) {
                        self.selected ? selectedImage : deSelectedImage
                    }
                    .frame(width: 44 * self.layoutManager.scaleX, height: 44 * self.layoutManager.scaleY)
                } else {
                    AnyView(EmptyView())
                }
            }
    }
}

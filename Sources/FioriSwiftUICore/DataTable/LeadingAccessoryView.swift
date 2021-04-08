import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let items: [AccessoryItem]
    let index: Int
    let isHeader: Bool
    let isEditing: Bool
    
    @State var selected: Bool = false

    @EnvironmentObject var dataManager: TableDataManager
    @EnvironmentObject var layoutManager: TableLayoutManager

    init(items: [AccessoryItem], index: Int, isHeader: Bool, isEditing: Bool) {
        self.items = items
        self.index = index
        self.isHeader = isHeader
        self.isEditing = isEditing
    }
    
    var body: some View {
        Group {
            makeBody(items: self.items)
                .offset(x: self.layoutManager.leadingAccessoryViewWidth / 2)
        }
    }
    
    func makeBody(items: [AccessoryItem]) -> some View {
        HStack(alignment: .center, spacing: 4) {
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
        .background(Color.preferredColor(.headerBlended))
    }
    
    func makeButton(button: AccessoryButton) -> some View {
        DispatchQueue.main.async {
            self.selected = self.dataManager.selectedIndexes.contains(self.index)
        }
        return Group {
            if self.layoutManager.isEditing {
                Button(action: {
                    print("Left Icon button was tapped")
                        
                    button.action()
                        
                    if !self.dataManager.selectedIndexes.contains(self.index) {
                        self.dataManager.selectedIndexes.append(self.index)
                    } else {
                        self.dataManager.selectedIndexes.removeAll { (target) -> Bool in
                            target == self.index
                        }
                    }

                }) {
                    self.selected ? button.image_selected : button.image_deSelected
                }
                .frame(width: 44 * self.layoutManager.scaleX, height: 44 * self.layoutManager.scaleY)
            } else {
                AnyView(EmptyView())
            }
        }
    }
}

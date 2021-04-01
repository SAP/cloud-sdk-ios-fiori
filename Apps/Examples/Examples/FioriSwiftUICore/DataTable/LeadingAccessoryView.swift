import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let items: [AccessoryItem]
    let index: Int
    let isHeader: Bool
    @State var selected: Bool = false
    
    @EnvironmentObject var dataManager: TableDataManager
    @EnvironmentObject var layoutManager: TableLayoutManager

    init(items: [AccessoryItem], index: Int, isHeader: Bool) {
        self.items = items
        self.index = index
        self.isHeader = isHeader
    }
    
    var body: some View {
        if self.items.isEmpty {
            let height = self.layoutManager.rowHeights[self.index] * self.layoutManager.scaleY
            let width = self.layoutManager.layoutLeadingMargin + self.layoutManager.contentInset
            Rectangle()
                .fill(Color.green)
                .frame(width: width, height: height)
                .offset(x: width / 2)
                .background(Color.blue.edgesIgnoringSafeArea([.leading, .trailing]))
        } else {
            makeBody(items: self.items)
                .background(Color.red.edgesIgnoringSafeArea([.leading, .trailing]))
        }
    }
    
    func makeBody(items: [AccessoryItem]) -> some View {
        let leftPadding: CGFloat = self.layoutManager.isEditing ? 44 + 22 : 7
        return
            HStack(alignment: .center, spacing: 4) {
                ForEach(0 ..< items.count, id: \.self) { index in
                    switch items[index] {
                    case .button(let button):
                        makeButton(button: button)
                    case .icon(let image):
                        image
                            .resizable()
                            .frame(width: 14, height: 12, alignment: .center)
                    case .text(let text):
                        text
                    }
                }
            }
            .frame(height: self.layoutManager.rowHeights[self.index] * self.layoutManager.scaleY)
            .background(Color.preferredColor(.cellBackground))
            .padding(.leading, leftPadding)
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

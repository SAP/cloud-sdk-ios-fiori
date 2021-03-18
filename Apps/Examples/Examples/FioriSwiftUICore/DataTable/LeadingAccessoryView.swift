import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let items: [AccessoryItem]
    let index: Int
    @State var selected: Bool = false
    @State var isEditing: Bool = true
    
    @EnvironmentObject var dataManager: TableDataManager

    init(items: [AccessoryItem], index: Int) {
        self.items = items
        self.index = index
    }
    
    var body: some View {
        makeBody(items: self.items)
            .background(Color.white.edgesIgnoringSafeArea([.leading, .trailing]))
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
                        .frame(width: 14, height: 12, alignment: .center)
                case .text(let text):
                    text
                }
            }
        }
        .padding(.leading, 66)
    }
    
    func makeButton(button: AccessoryButton) -> some View {
        DispatchQueue.main.async {
            self.selected = self.dataManager.selectedIndexes.contains(self.index)
        }
        return Group {
            if self.isEditing {
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
                .frame(width: 44, height: 44)
            } else {
                AnyView(EmptyView())
            }
        }
    }
}

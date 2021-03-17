import Foundation
import SwiftUI

struct LeadingAccessoryView: View {
    let items: [AccessoryItem]
    let index: Int
    @State var selected: Bool = false
    
    @EnvironmentObject var layoutManager: TableLayoutManager

    init(items: [AccessoryItem], index: Int) {
        self.items = items
        self.index = index
    }
    
    var body: some View {
        makeBody(items: self.items)
            .background(Color.yellow.edgesIgnoringSafeArea([.leading, .trailing]))
    }
    
    func makeBody(items: [AccessoryItem]) -> some View {
        HStack(alignment: .center, spacing: 4) {
            ForEach(0 ..< items.count, id: \.self) { index in
                switch items[index] {
                case .button(let button):
                    makeButton(button: button)
                        .padding(.leading, 58)
                case .icon(let image):
                    image
                        .resizable()
                        .frame(width: 14, height: 12, alignment: .center)
                case .text(let text):
                    text
                }
            }
        }
    }
    
    func makeButton(button: AccessoryButton) -> some View {
//        DispatchQueue.main.async {
//            self.selected = self.layoutManager.model.selectedIndex.contains(self.index)
//        }
        
        Button(action: {
            print("Left Icon button was tapped")
                
            button.action()
                
//                if !self.layoutManager.model.selectedIndex.contains(self.index) {
//                    self.layoutManager.model.selectedIndex.append(self.index)
//                } else {
//                    self.layoutManager.model.selectedIndex.removeAll { (target) -> Bool in
//                        return target == self.index
//                    }
//                }

        }) {
            self.selected ? button.image_selected : button.image_deSelected
        }
        .frame(width: 44, height: 44)
    }
}

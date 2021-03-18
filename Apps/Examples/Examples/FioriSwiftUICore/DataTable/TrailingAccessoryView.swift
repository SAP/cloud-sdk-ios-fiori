import Foundation
import SwiftUI

struct TrailingAccessoryView: View {
    let item: AccessoryItem
    let selected: Bool = false
    
    init(item: AccessoryItem) {
        self.item = item
    }
    
    var body: some View {
        applyBlur()
            .padding(.trailing, 44)
        
        switch self.item {
        case .button(let button):
            Button(action: {
                print("Right Icon button was tapped")
                button.action()
            }) {
                self.selected ? button.image_selected : button.image_deSelected
            }
            .frame(width: 44, height: 44, alignment: .center)
            .padding(.trailing, 44)
            .background(Color.white
                .edgesIgnoringSafeArea([.leading, .trailing]))
        default:
            AnyView(EmptyView())
        }
    }

    func applyBlur() -> some View {
        Color.white
            .frame(width: 96, height: 44, alignment: .center)
            .edgesIgnoringSafeArea([.leading, .trailing])
            .blur(radius: 8)
    }
}

import Foundation
import SwiftUI

struct TrailingAccessoryView: View {
    let item: AccessoryItem?
    let selected: Bool = false
    let rowIndex: Int
    
    init(item: AccessoryItem?, rowIndex: Int) {
        self.item = item
        self.rowIndex = rowIndex
    }
    
    var body: some View {
        Group {
            applyBlur()
                .padding(.trailing, 44)
            
            if let item = self.item {
                switch item {
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
            } else {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 44, height: 44, alignment: .center)
                    .padding(.trailing, 44)
                    .background(Color.white
                        .edgesIgnoringSafeArea([.leading, .trailing]))
            }
        }
        .zIndex(Double(600 - self.rowIndex))
    }
    
    func applyBlur() -> some View {
        Color.white
            .frame(width: 96, height: 44, alignment: .center)
            .edgesIgnoringSafeArea([.leading, .trailing])
            .blur(radius: 8)
    }
}

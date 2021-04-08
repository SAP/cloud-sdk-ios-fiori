import Foundation
import SwiftUI

struct TrailingAccessoryView: View {
    let item: AccessoryItem?
    let selected: Bool = false
    let rowIndex: Int
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    
    init(item: AccessoryItem?, rowIndex: Int) {
        self.item = item
        self.rowIndex = rowIndex
    }
    
    var body: some View {
        Group {
            if let item = self.item {
//                applyBlur()
//                    .padding(.trailing, 44)
                
                switch item {
                case .button(let button):
                    Button(action: {
                        print("Right Icon button was tapped")
                        button.action()
                    }) {
                        self.selected ? button.image_selected : button.image_deSelected
                    }
                    .frame(width: 44, height: self.layoutManager.rowHeights[self.rowIndex], alignment: .center)
                    .padding(.trailing, 44)
                    .background(Color.preferredColor(.headerBlended)
                        .edgesIgnoringSafeArea([.leading, .trailing]))
                default:
                    AnyView(EmptyView())
                }
            } else {
                Rectangle()
                    .fill(Color.preferredColor(.cellBackground))
                    .frame(width: 44, height: self.layoutManager.rowHeights[self.rowIndex], alignment: .center)
                    .padding(.trailing, 44)
                    .background(Color.preferredColor(.headerBlended)
                        .edgesIgnoringSafeArea([.leading, .trailing]))
            }
        }
        .background(BlurView(style: .light).blur(radius: 2))
    }
    
    func applyBlur() -> some View {
        Color.white
            .frame(width: 96, height: 44, alignment: .center)
            .edgesIgnoringSafeArea([.leading, .trailing])
            .blur(radius: 8)
    }
}

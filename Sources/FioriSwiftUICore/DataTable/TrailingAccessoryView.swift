import Foundation
import SwiftUI

struct TrailingAccessoryView: View {
    let item: AccessoryItem?
    let selected: Bool = false
    let rowIndex: Int
    let isHeader: Bool
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    
    init(item: AccessoryItem?, rowIndex: Int, isHeader: Bool) {
        self.item = item
        self.rowIndex = rowIndex
        self.isHeader = isHeader
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
                        button.image
                    }
                    .frame(width: 44 * self.layoutManager.scaleX, height: self.layoutManager.rowHeights[self.rowIndex] * self.layoutManager.scaleY, alignment: .center)
                    .padding(.trailing, 44)
                    .background(Color.white)
                    .edgesIgnoringSafeArea([.leading, .trailing])
                default:
                    AnyView(EmptyView())
                }
            } else {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 44 * self.layoutManager.scaleX, height: self.layoutManager.rowHeights[self.rowIndex] * self.layoutManager.scaleY, alignment: .center)
                    .padding(.trailing, 44)
                    .background(Color.white)
                    .edgesIgnoringSafeArea([.leading, .trailing])
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

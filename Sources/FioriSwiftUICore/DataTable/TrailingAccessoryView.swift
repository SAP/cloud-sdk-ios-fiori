import Foundation
import SwiftUI

struct TrailingAccessoryView: View {
    let item: AccessoryItem?
    let selected: Bool = false
    let height: CGFloat
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    @Environment(\.backgroundColor) var backgroundColor

    init(item: AccessoryItem?, height: CGFloat) {
        self.item = item
        self.height = height
    }
    
    var body: some View {
        Group {
            let _height = self.height * self.layoutManager.scaleY
                                
            if let item = self.item {
                switch item {
                case .button(let button):
                    Button(action: {
                        print("Right Icon button was tapped")
                        button.action()
                    }) {
                        button.image.aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 44 * self.layoutManager.scaleX, height: _height, alignment: .center)
                    .padding(.trailing, 44 * self.layoutManager.scaleX)
//                    .foregroundColor(Tablel)
                    .background(self.backgroundColor)
                    .edgesIgnoringSafeArea(.trailing)
                default:
                    AnyView(EmptyView())
                }
            } else {
                Rectangle()
                    .fill(self.backgroundColor)
                    .frame(width: 44 * self.layoutManager.scaleX, height: _height, alignment: .center)
                    .padding(.trailing, 44 * self.layoutManager.scaleX)
                    .edgesIgnoringSafeArea(.trailing)
            }
        }
    }
    
    func applyBlur(height: CGFloat) -> some View {
        self.backgroundColor
            .frame(width: 44 * self.layoutManager.scaleX, height: height, alignment: .center)
            .blur(radius: 8)
    }
}

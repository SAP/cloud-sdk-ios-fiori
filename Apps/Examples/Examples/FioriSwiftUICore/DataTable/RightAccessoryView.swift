import Foundation
import SwiftUI

struct RightAccessoryView: View {
    let pos: CGPoint
    let action: (() -> Void)?
    let rightPadding: CGFloat = 16
    
    private let _editIconName: String = "square.and.pencil"
    private let _drillDownIconName: String = "chevron.forward"
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        ZStack {
            extenedToRight()
            Button(action: {
                print("Right Icon button was tapped")
                if let _action = self.action {
                    _action()
                }
            }) {
                Image(systemName: "chevron.forward")
                    .foregroundColor(.gray)
            }
            .frame(width: 44, height: 44, alignment: .center)
            .padding(.trailing, rightPadding)
            .background(
                applyBlur()
            )
        }
        .position(x: self.pos.x, y: self.pos.y)
    }
    
    func extenedToRight() -> some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 80, alignment: .leading)
            .offset(x: 44, y: 0)
    }
    
    func applyBlur() -> some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 40, height: 40, alignment: .center)
//            .offset(x: -40)
//            .shadow(color: Color.white, radius: 20, x: 0, y: 0).blur(radius: 2)
    }
}

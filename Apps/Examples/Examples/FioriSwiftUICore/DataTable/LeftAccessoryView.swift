import Foundation
import SwiftUI

struct LeftAccessoryView: View {
    enum Style {
        case sync
        case checkmark
    }
    
    let pos: CGPoint
    let action: (() -> Void)?
    let leftPadding: CGFloat
    let style: Style
    @State var checked: Bool = false
    
    private let _checkmarkFilled: String = "checkmark.circle.fill"
    private let _checkmarkCircle: String = "checkmark.circle"
    private let _sync: String = "arrow.triangle.2.circlepath"
    
    init(_ pos: CGPoint, _ action: (() -> Void)? = nil, _ leftPadding: CGFloat = 12, _ style: Style = .checkmark, _ checked: Bool = false) {
        self.pos = pos
        self.action = action
        self.leftPadding = leftPadding
        self.style = style
        self.checked = checked
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        Group {
            switch self.style {
            case .sync:
                iconStack()
            case .checkmark:
                makeButton()
            }
        }
        .padding(.leading, self.leftPadding)
        .background(
            Color.white
        )
        .position(x: self.pos.x, y: self.pos.y)
    }
    
    func makeButton() -> some View {
        Button(action: {
            print("Left Icon button was tapped")
            if let _action = self.action {
                _action()
            }
            if self.style == .checkmark {
                self.checked = !self.checked
            }
        }) {
            Image(systemName: self.checked ? _checkmarkFilled : _checkmarkCircle)
        }
        .frame(width: 44, height: 44, alignment: .center)
        .background(
            Color.white
        )
    }
    
    func iconStack() -> some View {
        Group {
            Image(systemName: _sync)
                .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 12))
        }
    }
    
    func applyBlur() -> some View {
        Rectangle()
            .fill(Color.white)
            .shadow(color: Color.white, radius: 8, x: -5, y: 0).blur(radius: 2)
    }
}

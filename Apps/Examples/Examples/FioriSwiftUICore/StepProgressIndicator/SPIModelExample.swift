import FioriSwiftUICore
import SwiftUI

struct CustomModelStyleExample: StepStyle {
    var isLast: Bool
    
    func makeNode(configuration: Self.Configuration) -> some View {
        let background = configuration.isPressed ? Color.red : configuration.isSelected ? Color.cyan : Color.gray
        configuration.node
            .foregroundColor(Color.black)
            .background(background.clipShape(Circle()))
    }

    func makeLine(configuration: Configuration) -> some View {
        configuration.line.foregroundColor(self.isLast ? Color.clear : Color.blue)
    }
}

import Foundation
import SwiftUI

public struct ModifiedStyle<Style, Modifier: ViewModifier>: DynamicProperty {
    var style: Style
    var modifier: Modifier
}

extension ModifiedStyle: DemoViewStyle where Style: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .demoViewStyle(self.style)
            .modifier(self.modifier)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SubmitActionBaseStyle: SubmitActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SubmitActionConfiguration) -> some View {
        // Add default layout here
        configuration.submitAction
    }
}

// Default fiori styles
public struct SubmitActionFioriStyle: SubmitActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SubmitActionConfiguration) -> some View {
        SubmitAction(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

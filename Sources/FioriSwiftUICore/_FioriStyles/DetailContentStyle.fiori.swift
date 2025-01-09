import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DetailContentBaseStyle: DetailContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DetailContentConfiguration) -> some View {
        configuration.detailContent
    }
}

// Default fiori styles
public struct DetailContentFioriStyle: DetailContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DetailContentConfiguration) -> some View {
        DetailContent(configuration)
    }
}

import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

@ComponentStyle
public protocol DetailImageStyle: DynamicProperty {}

public extension DetailImageStyle where Self == DetailImageBaseStyle {
    static var base: DetailImageBaseStyle {
        DetailImageBaseStyle()
    }
}

public extension DetailImageStyle where Self == DetailImageFioriStyle {
    static var fiori: DetailImageFioriStyle {
        DetailImageFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct DetailImageBaseStyle: DetailImageStyle {
    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        configuration.detailImage
    }
}

// Default fiori styles
public struct DetailImageFioriStyle: DetailImageStyle {
    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        DetailImage(configuration)
    }
}

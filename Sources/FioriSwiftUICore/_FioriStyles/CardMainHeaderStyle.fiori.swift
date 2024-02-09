import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct CardMainHeaderBaseStyle: CardMainHeaderStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        // Add default layout here
        configuration.title
        configuration.subtitle
        configuration.detailImage
        configuration.counter
    }
}
    
// Default fiori styles
extension CardMainHeaderFioriStyle {
    struct ContentFioriStyle: CardMainHeaderStyle {
        func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
            CardMainHeader(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style for Title
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
            // Add default style for Subtitle
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
            // Add default style for DetailImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct CounterFioriStyle: CounterStyle {
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
            // Add default style for Counter
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

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
public struct CardBaseStyle: CardStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        // Add default layout here
        configuration.mediaImage
        configuration.description
        configuration.title
        configuration.subtitle
        configuration.detailImage
        configuration.counter
        configuration.row1
        configuration.row2
        configuration.row3
        configuration.cardBody
        configuration.action
        configuration.secondaryAction
    }
}
    
// Default fiori styles
extension CardFioriStyle {
    struct ContentFioriStyle: CardStyle {
        func makeBody(_ configuration: CardConfiguration) -> some View {
            Card(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct MediaImageFioriStyle: MediaImageStyle {
        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
            // Add default style for MediaImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style for Description
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
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

    struct Row1FioriStyle: Row1Style {
        func makeBody(_ configuration: Row1Configuration) -> some View {
            Row1(configuration)
            // Add default style for Row1
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct Row2FioriStyle: Row2Style {
        func makeBody(_ configuration: Row2Configuration) -> some View {
            Row2(configuration)
            // Add default style for Row2
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct Row3FioriStyle: Row3Style {
        func makeBody(_ configuration: Row3Configuration) -> some View {
            Row3(configuration)
            // Add default style for Row3
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct CardBodyFioriStyle: CardBodyStyle {
        func makeBody(_ configuration: CardBodyConfiguration) -> some View {
            CardBody(configuration)
            // Add default style for CardBody
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct ActionFioriStyle: ActionStyle {
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
            // Add default style for Action
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            SecondaryAction(configuration)
            // Add default style for SecondaryAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct CardHeaderFioriStyle: CardHeaderStyle {
        func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
            CardHeader(configuration)
            // Add default style for CardHeader
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct CardFooterFioriStyle: CardFooterStyle {
        func makeBody(_ configuration: CardFooterConfiguration) -> some View {
            CardFooter(configuration)
            // Add default style for CardFooter
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WhatsNewPageBaseStyle: WhatsNewPageStyle {
    public func makeBody(_ configuration: WhatsNewPageConfiguration) -> some View {
        VStack(spacing: 28) {
            configuration.detailImage
            configuration.title
            configuration.description
            Spacer()
        }
    }
}

// Default fiori styles
extension WhatsNewPageFioriStyle {
    struct ContentFioriStyle: WhatsNewPageStyle {
        func makeBody(_ configuration: WhatsNewPageConfiguration) -> some View {
            WhatsNewPage(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        let whatsNewPageConfiguration: WhatsNewPageConfiguration

        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
            // Add default style for DetailImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let whatsNewPageConfiguration: WhatsNewPageConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                // .foregroundStyle(Color.preferredColor(<#fiori color#>))
                .font(.fiori(forTextStyle: .title1))
                .multilineTextAlignment(.center)
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        let whatsNewPageConfiguration: WhatsNewPageConfiguration

        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                // Add default style for Description
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .body))
                .multilineTextAlignment(.center)
        }
    }
}

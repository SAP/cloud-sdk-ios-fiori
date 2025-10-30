import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WhatsNewListItemBaseStyle: WhatsNewListItemStyle {
    public func makeBody(_ configuration: WhatsNewListItemConfiguration) -> some View {
        HStack(alignment: .top, spacing: 8) {
            configuration.detailImage
                .scaledToFill()
                .frame(width: 66, height: 66)
                .clipped()
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 4) {
                configuration.title
                configuration.subtitle
            }
        }
    }
}

// Default fiori styles
extension WhatsNewListItemFioriStyle {
    struct ContentFioriStyle: WhatsNewListItemStyle {
        func makeBody(_ configuration: WhatsNewListItemConfiguration) -> some View {
            WhatsNewListItem(configuration)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .contentShape(Rectangle())
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        let whatsNewListItemConfiguration: WhatsNewListItemConfiguration

        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let whatsNewListItemConfiguration: WhatsNewListItemConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline, weight: .semibold))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let whatsNewListItemConfiguration: WhatsNewListItemConfiguration
    
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                // Add default style for Subtitle
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .subheadline))
        }
    }
}

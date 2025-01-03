import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ContactItemBaseStyle: ContactItemStyle {
    @Environment(\.splitPercent) var splitPercent
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var mainViewSize: CGSize = .zero
    
    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        Group {
            if self.horizontalSizeClass == .some(.regular) {
                self.bodyInRegular(configuration)
            } else {
                self.bodyInCompact(configuration)
            }
        }
        .background(Color.preferredColor(.secondaryGroupedBackground))
    }
    
    func bodyInRegular(_ configuration: ContactItemConfiguration) -> some View {
        HStack {
            configuration.detailImage
            if !configuration.detailImage.isEmpty {
                Spacer().frame(width: 8)
            }

            if self.splitPercent == nil {
                self.titleSubtitleDescription(configuration)
            } else {
                self.titleSubtitleDescriptionWithSplitPercent(configuration)
            }
            configuration.activityItems
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
    
    func titleSubtitleDescription(_ configuration: ContactItemConfiguration) -> some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer().frame(width: 4)
            VStack(alignment: .leading, spacing: 3) {
                configuration.title
                configuration.subtitle
            }
            
            Spacer().frame(width: 24)
            
            configuration.description
            
            Spacer().frame(width: 24)
            
            Spacer(minLength: 0)
        }
    }
    
    func titleSubtitleDescriptionWithSplitPercent(_ configuration: ContactItemConfiguration) -> some View {
        HStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Spacer().frame(width: 4)
                VStack(alignment: .leading, spacing: 3) {
                    configuration.title
                    configuration.subtitle
                }
                
                Spacer(minLength: 24)
            }
            .frame(width: self.mainViewSize.width * self.splitPercent!)
            
            HStack(alignment: .center, spacing: 0) {
                configuration.description
                
                Spacer(minLength: 24)
            }.frame(width: self.mainViewSize.width * (1 - self.splitPercent!))
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .modifier(SizeModifier())
        .onPreferenceChange(SizePreferenceKey.self) { size in
            DispatchQueue.main.async {
                self.mainViewSize = size
            }
        }
    }
    
    func bodyInCompact(_ configuration: ContactItemConfiguration) -> some View {
        HStack {
            configuration.detailImage
            if !configuration.detailImage.isEmpty {
                Spacer().frame(width: 8)
            }
            
            self.titleSubtitle(configuration)
            
            Spacer(minLength: 0)
            
            configuration.activityItems
        }
    }
    
    func titleSubtitle(_ configuration: ContactItemConfiguration) -> some View {
        HStack(spacing: 0) {
            Spacer().frame(width: 4)
            VStack(alignment: .leading, spacing: 3) {
                configuration.title
                configuration.subtitle
            }
            Spacer().frame(width: 24)
        }
    }
}

// Default fiori styles
extension ContactItemFioriStyle {
    struct ContentFioriStyle: ContactItemStyle {
        func makeBody(_ configuration: ContactItemConfiguration) -> some View {
            ContactItem(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let contactItemConfiguration: ContactItemConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline))
                .foregroundColor(.preferredColor(.primaryLabel))
                .lineLimit(2)
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let contactItemConfiguration: ContactItemConfiguration

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .lineLimit(1)
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        let contactItemConfiguration: ContactItemConfiguration

        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .lineLimit(3)
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        let contactItemConfiguration: ContactItemConfiguration

        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                .frame(width: 45, height: 45, alignment: .center)
                .clipShape(Circle())
        }
    }

    struct ActivityItemsFioriStyle: ActivityItemsStyle {
        let contactItemConfiguration: ContactItemConfiguration

        func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
            ActivityItems(configuration)
            // Add default style for ActivityItems
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

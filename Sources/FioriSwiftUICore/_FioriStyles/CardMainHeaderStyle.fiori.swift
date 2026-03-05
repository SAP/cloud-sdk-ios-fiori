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

/// Enumeration defining the vertical insertion positions of a `FlexItem` within a view hierarchy.
public enum FlexItemPositionType {
    /// Inserts the flex item above the main header component.
    case aboveMainHeader

    /// Inserts the flex item above the title, but below the main header (if present).
    case aboveTitle

    /// Inserts the flex item between the title and subtitle, at the top of the subtitle section.
    /// Equivalent to "below the title" in vertical layout.
    case betweenTitleAndSubtitle

    /// Inserts the flex item below the subtitle.
    case belowSubtitle
}

// Base Layout style
public struct CardMainHeaderBaseStyle: CardMainHeaderStyle {
    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeaderView(configuration: configuration)
    }
}

private struct CardMainHeaderView: View {
    let configuration: CardMainHeaderConfiguration
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        let isLargeFont = self.sizeCategory >= .accessibilityExtraLarge
            && !self.configuration.flexItem.isEmpty
            && self.configuration.flexItemPosition == .belowSubtitle
        
        VStack(alignment: .leading, spacing: 0) {
            if !self.configuration.flexItem.isEmpty,
               case .aboveMainHeader = self.configuration.flexItemPosition
            {
                self.configuration.flexItem
            }

            HStack(alignment: .top, spacing: 0) {
                HStack(spacing: 8) {
                    if !self.configuration.icons.isEmpty {
                        self.configuration.icons
                            .accessibilityHidden(true)
                    }
                    self.configuration.detailImage
                        .accessibilityHidden(true)
                }

                VStack(alignment: .leading, spacing: 0) {
                    if !self.configuration.flexItem.isEmpty,
                       case .aboveTitle = self.configuration.flexItemPosition
                    {
                        self.configuration.flexItem
                    }
                    
                    self.configuration.title
                    
                    if !self.configuration.flexItem.isEmpty,
                       case .betweenTitleAndSubtitle = self.configuration.flexItemPosition
                    {
                        self.configuration.flexItem
                    }
                    
                    self.configuration.subtitle
                        .lineLimit(self.configuration.title.isEmpty ? 3 : 2)
                    
                    if !isLargeFont {
                        if !self.configuration.flexItem.isEmpty,
                           case .belowSubtitle = self.configuration.flexItemPosition
                        {
                            self.configuration.flexItem
                        }
                    }
                }
                .accessibilitySortPriority(2)

                if !self.configuration.headerAction.isEmpty || !self.configuration.counter.isEmpty {
                    Spacer(minLength: 12)
                    VStack(alignment: .trailing) {
                        self.configuration.headerAction
                        self.configuration.counter
                    }
                    .accessibilitySortPriority(1)
                }
            }

            if isLargeFont {
                HStack(spacing: 8) {
                    if !self.configuration.icons.isEmpty {
                        self.configuration.icons.hiddenButInLayout()
                    }
                    self.configuration.detailImage.hiddenButInLayout()
                    self.configuration.flexItem
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 4)
                .accessibilitySortPriority(2)
            }
        }
    }
}

// MARK: - Helper Extension

extension View {
    func hiddenButInLayout() -> some View {
        self.opacity(0).disabled(true)
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

    struct FlexItemFioriStyle: FlexItemStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration

        func makeBody(_ configuration: FlexItemConfiguration) -> some View {
            FlexItem(configuration)
            // Add default style for FlexItem
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .primaryLabel))
                .font(.fiori(forTextStyle: .title3, weight: .bold))
                .multilineTextAlignment(.leading)
                .environment(\.numberOfLines, 3)
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                // Add default style for Subtitle
                .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .secondaryLabel))
                .font(.fiori(forTextStyle: .body))
                .multilineTextAlignment(.leading)
                .environment(\.numberOfLines, 2)
        }
    }
    
    struct IconsFioriStyle: IconsStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
                .ifApply(self.isLoading) {
                    $0.foregroundStyle(Color.preferredColor(.separator))
                }
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 16, maxWidth: 60, minHeight: 16, maxHeight: 60)
                .clipped()
                .ifApply(self.isLoading) {
                    $0.foregroundStyle(Color.preferredColor(.separator))
                }
        }
    }
    
    struct HeaderActionFioriStyle: HeaderActionStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        
        func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
            HeaderAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle())
                .frame(minWidth: 44, minHeight: 44)
        }
    }
    
    struct CounterFioriStyle: CounterStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
                // Add default style for Counter
                .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
                .environment(\.numberOfLines, 1)
        }
    }
}

#Preview("Empty Header") {
    CardMainHeader {
        EmptyView()
    }
    .border(Color.green)
}

#Preview("Title") {
    CardMainHeader {
        Text("Title that goes to multiple lines before truncating just like that")
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
        }
    }.border(Color.gray)
}

#Preview("Model") {
    CardMainHeader(title: "Title")
}

#Preview("Model") {
    CardMainHeader(title: "Title",
                   subtitle: "Subtitle that goes to multiple lines be a truncating just like that",
                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("2")],
                   detailImage: Image("ProfilePic"))
        .border(Color.gray)
}

#Preview("TitleStyle") {
    CardMainHeader(title: "Title",
                   subtitle: "Subtitle",
                   detailImage: Image(systemName: "person.crop.circle"),
                   counter: "1 of 3")
        .cardMainHeaderStyle(.titleStyle(content: { config in
            Title(config).foregroundColor(.green)
        }))
        .cardMainHeaderStyle(.titleStyle(content: { config in
            Title(config).foregroundColor(.blue)
        }))
        .border(Color.gray)
}

#Preview("") {
    CardMainHeader(title: "Title",
                   subtitle: "Subtitle",
                   detailImage: Image(systemName: "person.crop.circle"),
                   headerAction: FioriButton(title: "long long button"))
        .frame(width: 300)
        .border(Color.gray)
}

#Preview("Icons") {
    CardMainHeader {
        Text("Title that goes to two lines before truncating just like that long")
    } subtitle: {
        Text("Subtitle that goes to two lines before truncating just like that long long")
    } icons: {
        IconStack(icons: [TextOrIcon.text("1"), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("2"), TextOrIcon.text("3"), TextOrIcon.text("4"), TextOrIcon.text("5")])
    } detailImage: {
        Image("ProfilePic")
            .resizable()
            .frame(width: 160, height: 160)
            .clipShape(Circle())
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").tint(Color.gray)
        }
    } counter: {
        Text("1 of 3")
    }
    .environment(\.numberOfLines, 6)
    .border(Color.gray)
}

#Preview("") {
    CardMainHeader {
        Text("Title that goes to two lines before truncating just like that")
    } subtitle: {
        Text("Subtitle that goes to two lines before truncating just like that")
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Text("Long long long button")
        }
    } counter: {
        Text("1 of 3")
    }
    .border(Color.gray)
}

#Preview() {
    CardMainHeader {
        Text("Title that goes to two lines before truncating just like that")
    } detailImage: {
        Image("productThumbnail")
            .resizable()
//            .frame(width: 60, height: 60)
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Text("Long long long button")
        }
    } counter: {
        Text("1 of 3")
    }
    .border(Color.gray)
}

#Preview("Wild") {
    CardMainHeader {
        Image(systemName: "figure.elliptical")
            .frame(width: 120, height: 80)
            .background(Color.gray)
    } subtitle: {
        Image(systemName: "person.crop.circle")
            .frame(width: 120, height: 120)
            .background(Color.gray)
    } icons: {
        IconStack(icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("2")])
    } detailImage: {
        Text("Not an image")
    } counter: {
        Color.blue
            .frame(width: 60, height: 60)
            .cornerRadius(16)
    }
    .border(Color.gray)
}

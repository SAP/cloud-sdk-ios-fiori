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
    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        HStack(alignment: .top, spacing: 0) {
            HStack(spacing: 8) {
                if !configuration.icons.isEmpty {
                    configuration.icons
                        .accessibilityHidden(true)
                }
                
                configuration.detailImage
                    .accessibilityHidden(true)
                
                VStack(alignment: .leading) {
                    configuration.title
                    
                    configuration.subtitle
                        .lineLimit(configuration.title.isEmpty ? 3 : 2)
                }
                .accessibilitySortPriority(2)
            }
            
            if !configuration.headerAction.isEmpty || !configuration.counter.isEmpty {
                Spacer(minLength: 12)
            }
            
            VStack(alignment: .trailing) {
                configuration.headerAction
                
                configuration.counter
            }
            .accessibilitySortPriority(1)
        }
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
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .title3, weight: .semibold))
                .environment(\.numberOfLines, 3)
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                // Add default style for Subtitle
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .body))
                .environment(\.numberOfLines, 2)
        }
    }
    
    struct IconsFioriStyle: IconsStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
            // Add default style for Icons
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let cardMainHeaderConfiguration: CardMainHeaderConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 16, maxWidth: 60, minHeight: 16, maxHeight: 60)
                .clipped()
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
        
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
                // Add default style for Counter
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
                .environment(\.numberOfLines, 1)
        }
    }
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
        Image("attachment009")
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

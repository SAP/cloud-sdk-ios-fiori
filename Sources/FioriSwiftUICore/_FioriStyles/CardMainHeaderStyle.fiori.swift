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
        HStack(spacing: 0) {
            configuration.detailImage
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                configuration.title
                    .lineLimit(configuration.subtitle.isEmpty ? 3 : 2)
                
                configuration.subtitle
                    .lineLimit(configuration.title.isEmpty ? 3 : 2)
            }
            
            Spacer(minLength: 0)
            
            VStack(alignment: .trailing) {
                configuration.headerAction
                    .frame(minWidth: 44, minHeight: 44)
                
                configuration.counter
            }
            .padding(.leading, 12)
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
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .title3))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                // Add default style for Subtitle
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .body))
        }
    }
    
    struct IconsFioriStyle: IconsStyle {
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
            // Add default style for Icons
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
    
    struct HeaderActionFioriStyle: HeaderActionStyle {
        func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
            HeaderAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle())
        }
    }
    
    struct CounterFioriStyle: CounterStyle {
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
                // Add default style for Counter
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
                .environment(\.numberOfLines, 1)
        }
    }
}

#Preview("Base") {
    CardMainHeader(title: "Title",
                   subtitle: "Subtitle",
                   detailImage: Image(systemName: "person.crop.circle"),
                   headerAction: FioriButton(title: "Action"),
                   counter: "1 of 3")
        //    .frame(width: 300)
        //    .fioriButtonStyle(FioriPlainButtonStyle())
        .cardMainHeaderStyle(.base)
        .border(Color.gray)
}

#Preview("Base") {
    CardMainHeader(title: "Title",
                   subtitle: "Subtitle",
                   detailImage: Image(systemName: "person.crop.circle"),
                   headerAction: FioriButton(isSelectionPersistent: false,
                                             action: { state in
                                                 print("Button \(state)")
                                             }, label: { _ in
                                                 Image(systemName: "ellipsis")
                                             }),
                   counter: "1 of 3")
    //    .fioriButtonStyle(FioriPlainButtonStyle())
}

// #Preview("") {
//    CardMainHeader(title: "Title",
//                   subtitle: "Subtitle",
//                   detailImage: Image(systemName: "person.crop.circle"),
//                   headerAction: FioriButton("long long button"))
//    .frame(width: 300)
//    .border(Color.gray)
// }

#Preview("") {
    CardMainHeader {
        Text("Title")
    } subtitle: {
        Text("Subtitle that goes to two lines before truncating just like that")
    } detailImage: {
        Image(systemName: "person.crop.circle")
            .frame(width: 60, height: 60)
            .background(Color.gray)
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").tint(Color.gray)
        }
    } counter: {
        Text("1 of 3")
    }
    .border(Color.gray)
}

#Preview("") {
    CardMainHeader {
        Text("Title that goes to two lines before truncating just like that")
    } subtitle: {
        Text("Subtitle that goes to two lines before truncating just like that")
    } detailImage: {
        Image(systemName: "person.crop.circle")
            .frame(width: 120, height: 120)
            .background(Color.gray)
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
        Image(systemName: "person.crop.circle")
            .frame(width: 120, height: 120)
            .background(Color.gray)
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
        Image(systemName: "figure.elliptical")
            .frame(width: 120, height: 80)
            .background(Color.gray)
    } subtitle: {
        Image(systemName: "person.crop.circle")
            .frame(width: 120, height: 120)
            .background(Color.gray)
    } detailImage: {
        Text("Not an image")
    } counter: {
        Color.blue
            .frame(width: 60, height: 60)
            .cornerRadius(16)
    }
    .border(Color.gray)
}

#Preview() {
    CardMainHeader {
        Text("Card title that wraps to two lines")
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
        }
    }.border(Color.gray)
}

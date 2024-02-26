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
public struct CardHeaderBaseStyle: CardHeaderStyle {
    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        // Add default layout here
        VStack(alignment: .leading, spacing: 0) {
            configuration._cardMedia
            
            configuration._cardMainHeader
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 12))
            
            configuration._cardExtHeader
                .padding(.horizontal, 16)
        }
    }
}

// Default fiori styles
extension CardHeaderFioriStyle {
    struct ContentFioriStyle: CardHeaderStyle {
        func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
            CardHeader(configuration)
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
            // Add default style for HeaderAction
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
    
    struct KpiFioriStyle: KpiStyle {
        func makeBody(_ configuration: KpiConfiguration) -> some View {
            Kpi(configuration)
            // Add default style for Kpi
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct KpiCaptionFioriStyle: KpiCaptionStyle {
        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
            // Add default style for KpiCaption
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardMediaFioriStyle: CardMediaStyle {
        func makeBody(_ configuration: CardMediaConfiguration) -> some View {
            CardMedia(configuration)
            // Add default style for CardMedia
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardMainHeaderFioriStyle: CardMainHeaderStyle {
        func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
            CardMainHeader(configuration)
            // Add default style for CardMainHeader
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardExtHeaderFioriStyle: CardExtHeaderStyle {
        func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
            CardExtHeader(configuration)
            // Add default style for CardExtHeader
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

#Preview("") {
    CardHeader(mediaImage: Image(systemName: "sportscourt"),
               description: "Title",
               title: "Title")
}

#Preview("") {
    CardHeader(mediaImage: Image(systemName: "sportscourt"),
               description: "Title",
               title: "Title",
               subtitle: "Subtitle",
               icons: [],
               detailImage: Image(systemName: "person.crop.circle"),
               headerAction: FioriButton(title: "Action"),
               counter: "1 of 3",
               row1: {
                   HStack {
                       LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                           .titleStyle { config in
                               config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                           }
                       LabelItem(title: "Critical")
                           .titleStyle { config in
                               config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                           }
                       LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                           .titleStyle { config in
                               config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                           }
                   }
               },
               row2: {
                   HStack {
                       Text("256 reviews")
                   }
               },
               row3: {
                   HStack {
                       Tag(verbatim: "Tag")
                       Tag(verbatim: "Tag")
                       Tag(verbatim: "Tag")
                   }
               },
               kpi: KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")),
                                            .unit("$"),
                                            .metric("26.9"),
                                            .unit("M")]),
               kpiCaption: "Revenue")
}

#Preview("VB") {
    CardHeader {
        Color.purple
        //            .frame(height: 145)
    } description: {
        Text("Title")
    } title: {
        Text("Title")
    } subtitle: {
        Text("Subtitle")
    } icons: {
        Text("1")
    } detailImage: {
        Image(systemName: "person.crop.circle")
    } headerAction: {
        FioriButton(title: "Action")
    } counter: {
        Text("1 of 3")
    } row1: {
        HStack {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                }
        }
    } row2: {
        HStack {
            Text("256 reviews")
        }
    } row3: {
        HStack {
            Tag(verbatim: "Tag")
            Tag(verbatim: "Tag")
            Tag(verbatim: "Tag")
        }
    } kpi: {
        KPIItem(KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")),
                                        .unit("$"),
                                        .metric("26.9"),
                                        .unit("M")]))
    } kpiCaption: {
        Text("Revenue")
    }
}

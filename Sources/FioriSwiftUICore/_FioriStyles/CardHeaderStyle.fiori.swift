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
        CardLayout(lineSpacing: 0, useProposedHeight: false) {
            configuration._cardMedia
                .clipped()
            
            if !configuration._cardMainHeader.isEmpty {
                configuration._cardMainHeader
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 6, trailing: 16))
            }
            
            if !(configuration._cardExtHeader.row1.isEmpty &&
                configuration._cardExtHeader.row2.isEmpty &&
                configuration._cardExtHeader.row3.isEmpty &&
                configuration._cardExtHeader.kpi.isEmpty &&
                configuration._cardExtHeader.kpiCaption.isEmpty)
            {
                configuration._cardExtHeader
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
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
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
            // Add default style for MediaImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style for Description
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style for Title
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
            // Add default style for Subtitle
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct IconsFioriStyle: IconsStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
            // Add default style for Icons
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
            // Add default style for DetailImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct HeaderActionFioriStyle: HeaderActionStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
            HeaderAction(configuration)
            // Add default style for HeaderAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CounterFioriStyle: CounterStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
            // Add default style for Counter
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row1FioriStyle: Row1Style {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: Row1Configuration) -> some View {
            Row1(configuration)
            // Add default style for Row1
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row2FioriStyle: Row2Style {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: Row2Configuration) -> some View {
            Row2(configuration)
            // Add default style for Row2
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row3FioriStyle: Row3Style {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: Row3Configuration) -> some View {
            Row3(configuration)
            // Add default style for Row3
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct KpiFioriStyle: KpiStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: KpiConfiguration) -> some View {
            Kpi(configuration)
            // Add default style for Kpi
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct KpiCaptionFioriStyle: KpiCaptionStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
            // Add default style for KpiCaption
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardMediaFioriStyle: CardMediaStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: CardMediaConfiguration) -> some View {
            CardMedia(configuration)
            // Add default style for CardMedia
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardMainHeaderFioriStyle: CardMainHeaderStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
            CardMainHeader(configuration)
            // Add default style for CardMainHeader
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardExtHeaderFioriStyle: CardExtHeaderStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        
        func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
            CardExtHeader(configuration)
            // Add default style for CardExtHeader
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

// Default nss styles
extension CardHeaderNSSStyle {
    struct ContentNSSStyle: CardHeaderStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
            CardHeader(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct MediaImageNSSStyle: MediaImageStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for MediaImage
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct DescriptionNSSStyle: DescriptionStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Description
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct SubtitleNSSStyle: SubtitleStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Subtitle
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct IconsNSSStyle: IconsStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Icons
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct DetailImageNSSStyle: DetailImageStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for DetailImage
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct HeaderActionNSSStyle: HeaderActionStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
            HeaderAction(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for HeaderAction
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct CounterNSSStyle: CounterStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Counter
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct Row1NSSStyle: Row1Style {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: Row1Configuration) -> some View {
            Row1(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Row1
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct Row2NSSStyle: Row2Style {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: Row2Configuration) -> some View {
            Row2(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Row2
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct Row3NSSStyle: Row3Style {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: Row3Configuration) -> some View {
            Row3(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Row3
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct KpiNSSStyle: KpiStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: KpiConfiguration) -> some View {
            Kpi(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Kpi
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct KpiCaptionNSSStyle: KpiCaptionStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for KpiCaption
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct CardMediaNSSStyle: CardMediaStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: CardMediaConfiguration) -> some View {
            CardMedia(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for CardMedia
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct CardMainHeaderNSSStyle: CardMainHeaderStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
            CardMainHeader(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for CardMainHeader
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct CardExtHeaderNSSStyle: CardExtHeaderStyle {
        let cardHeaderConfiguration: CardHeaderConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
            CardExtHeader(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for CardExtHeader
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

#Preview("Empty main header") {
    CardHeader {
        EmptyView()
    } row1: {
        HStack {
            Text("256 reviews")
        }
    }
    .border(Color.green)
}

#Preview("") {
    CardHeader(mediaImage: Image(systemName: "sportscourt"),
               description: "Title",
               title: "Title")
}

#Preview("") {
    CardHeader(mediaImage: Image("ProfilePic"),
               description: "Media title",
               title: "Title",
               subtitle: "Subtitle",
               icons: [],
               detailImage: Image(systemName: "person.crop.circle"),
               headerAction: FioriButton(title: "Action"),
               counter: "1 of 3")
        .mediaImageStyle { config in
            config.mediaImage
                .aspectRatio(contentMode: .fill)
                .frame(height: 145)
        }
}

#Preview("") {
    CardHeader(mediaImage: Image("attachment009"),
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
            .frame(height: 145)
    } description: {
        Text("Title")
    } title: {
        Text("Title")
    } subtitle: {
        Text("Subtitle")
    } icons: {
        Text("1")
    } detailImage: {
        Image("ProfilePic")
            .resizable()
            .clipShape(Circle())
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

#Preview("") {
    CardHeader(mediaImage: Image("attachment009"),
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

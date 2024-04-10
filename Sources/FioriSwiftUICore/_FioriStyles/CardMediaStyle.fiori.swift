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
public struct CardMediaBaseStyle: CardMediaStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        // Add default layout here
        ZStack(alignment: .bottomLeading) {
            configuration.mediaImage
            
            configuration.description
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
    }
}

// Default fiori styles
extension CardMediaFioriStyle {
    struct ContentFioriStyle: CardMediaStyle {
        func makeBody(_ configuration: CardMediaConfiguration) -> some View {
            CardMedia(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct MediaImageFioriStyle: MediaImageStyle {
        let cardMediaConfiguration: CardMediaConfiguration
        
        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let cardMediaConfiguration: CardMediaConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                // Add default style for Description
                .font(.fiori(forTextStyle: .title1, weight: .bold))
                .foregroundColor(.preferredColor(.primaryLabel, background: .darkConstant))
                .lineLimit(3)
        }
    }
}

#Preview("Image") {
    ZStack(alignment: .bottomLeading) {
        Image("card_image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            //            .frame(height: 125)
        
            .frame(maxWidth: .infinity, maxHeight: 145)
            .clipped()
        
        Text("Title")
            .font(.fiori(forTextStyle: .title1, weight: .bold))
            .foregroundColor(.preferredColor(.primaryLabel))
            .lineLimit(3)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }
}

#Preview("Image2") {
    ZStack(alignment: .bottomLeading) {
        Image("attachment009")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 745)
            //            .frame(maxWidth: .infinity, minHeight: 72, maxHeight: 442)
            .clipped()
        
        Text("Title")
            .font(.fiori(forTextStyle: .title1, weight: .bold))
            .foregroundColor(.preferredColor(.primaryLabel))
            .lineLimit(3)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }.border(Color.green)
}

#Preview("Header") {
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
        .mediaImageStyle { config in
            config.mediaImage
                .aspectRatio(contentMode: .fill)
                .frame(height: 145)
        }
}

#Preview("Data SF") {
    CardMedia(mediaImage: Image(systemName: "sportscourt"), description: "Title")
        .border(Color.green)
}

#Preview("Data Image") {
    CardMedia(mediaImage: Image("attachment009"), description: "Title")
        .border(Color.green)
        .mediaImageStyle { config in
            config.mediaImage
                .aspectRatio(contentMode: .fill)
                .frame(height: 145)
                .clipped()
        }
}

#Preview("VB") {
    CardMedia {
        Image("attachment009")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: 245)
            .border(Color.blue, width: 3)
    } description: {
        Text("Title")
    }
    .border(Color.green)
}

#Preview {
    CardMedia {
        Image("card_image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: 145)
    } description: {
        Text("Subtitle that goes to multiple lines before truncating just like that")
    }
}

#Preview("Color") {
    CardMedia {
        Color.purple
            .frame(height: 145)
    } description: {
        Text("Title")
    }
    .border(Color.green)
}

#Preview("M") {
    Text("hello")
        .foregroundColor(Color.blue)
        .foregroundColor(Color.red)
        .font(.largeTitle)
        .font(.footnote)
        .frame(height: 500)
        .frame(width: 200)
        .frame(height: 200)
        .frame(height: 70)
        .border(Color.black)
        .border(Color.green)
}

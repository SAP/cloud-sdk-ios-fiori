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
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        // Add default layout here
        VStack(alignment: .leading, spacing: 12) {
            configuration._cardHeader
            
            if !configuration.cardBody.isEmpty {
                configuration.cardBody
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
            
            if !(configuration._cardFooter.action.isEmpty && configuration._cardFooter.secondaryAction.isEmpty) {
                configuration._cardFooter
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

// Default fiori styles
extension CardFioriStyle {
    struct ContentFioriStyle: CardStyle {
        func makeBody(_ configuration: CardConfiguration) -> some View {
            Card(configuration)
                // Add default style for its content
                .background(Color.preferredColor(.secondaryGroupedBackground))
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
            // Add default style for NewAction
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

public struct CardCardStyle: CardStyle {
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .background(Color.preferredColor(.secondaryGroupedBackground))
            //            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.3)
                    .stroke(Color.preferredColor(.tertiaryLabel).opacity(0.24), lineWidth: 0.3)
            )
            .shadow(color: Color.preferredColor(.cardShadow).opacity(0.92), radius: 8, x: 0, y: 2)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

public extension CardStyle where Self == CardCardStyle {
    static var card: Self {
        CardCardStyle()
    }
}

let row1 = TableRowItem(data: [DataTextItem("Need Attention", Font.subheadline.weight(.medium), Color.preferredColor(.criticalLabel)), DataTextItem("Yesterday", Font.caption, Color.preferredColor(.tertiaryLabel))])
let row2 = TableRowItem(data: [DataTextItem("Stable", Font.subheadline), DataTextItem("Jul 5, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])
let row3 = TableRowItem(data: [DataTextItem("Need Attention", Font.subheadline), DataTextItem("Jul 4, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])

let tableCard = TableModel(headerData: nil,
                           rowData: [row1, row2, row3],
                           isHeaderSticky: false,
                           isFirstColumnSticky: false,
                           columnAttributes: [ColumnAttribute(textAlignment: .leading, width: .flexible), ColumnAttribute(textAlignment: .trailing, width: .infinity)],
                           rowAlignment: .baseline,
                           isPinchZoomEnable: false,
                           showRowDivider: false,
                           showColoumnDivider: false,
                           dataCellPadding: EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4),
                           minRowHeight: 20,
                           backgroundColor: .clear)

#Preview("Header only") {
    Card(mediaImage: Image(systemName: "sun.snow"), title: "Title")
}

#Preview("Base") {
    Card(mediaImage: Image("card_image"),
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
         kpiCaption: "Revenue",
         cardBody: {
             Text("Body")
         },
         action: FioriButton(title: "Primary"),
         secondaryAction: FioriButton(title: "Secondary"))
        .padding()
        .cardStyle(.card)
}

#Preview("VB") {
    Card {
        Color.purple
            .frame(height: 84)
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
        HStack(spacing: 8) {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive", alignment: .trailing)
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
    } cardBody: {
        Text("Body")
    } action: {
        FioriButton(title: "Primary")
    } secondaryAction: {
        FioriButton(title: "Secondary")
    }
    .padding()
    .cardStyle(.card)
}

#Preview("MainHeader + KPI") {
    Card {
        Text("Title")
    } subtitle: {
        Text("Timestamp")
    } cardBody: {
        VStack(alignment: .center) {
            KPIItem(data: .components([.metric("10"), .unit("h")]), subtitle: "").cornerRadius(8)
        }.frame(maxWidth: .infinity)
    }
    .padding()
    .cardStyle(.card)
}

#Preview("Main & Ext Header + DataTable + Footer") {
    Card {
        Text("Title that goes to two lines before truncating just like that")
    } detailImage: {
        Image(systemName: "person.crop.circle")
            .frame(width: 90, height: 90)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(45)
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Text("Long button")
        }
    } counter: {
        Text("1 of 3")
    } row1: {
        HStack(spacing: 8) {
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
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star")
            Image(systemName: "star")
            Image(systemName: "star")
        }
    } row3: {
        HStack {
            Tag("Tag")
            Tag("Tag").tagStyle(DarkTagStyle())
            Tag("Tag")
        }
    } kpi: {
        KPIItem(data: .components([.unit("$"), .metric("8,888"), .unit("M")]), subtitle: "").cornerRadius(8)
    } cardBody: {
        VStack(alignment: .leading, spacing: 4) {
            DataTable(model: tableCard)
                .frame(height: 80)
            
            Divider()
            
            HStack {
                Tag("Tag")
                Tag("Tag").tagStyle(DarkTagStyle())
                Tag("Tag")
            }
        }
    } action: {
        FioriButton(title: "Approve")
    } secondaryAction: {
        FioriButton(title: "Decline")
    }
}

#Preview("") {
    Card {
        Image(systemName: "photo.artframe")
            .foregroundColor(Color.blue)
            .frame(maxWidth: .infinity)
            .frame(height: 145)
            .background(Color.gray.opacity(0.3))
    } description: {
        Text("Title")
    } title: {
        Text("Title that goes to two lines before truncating just like that")
    } detailImage: {
        Image(systemName: "person.crop.circle")
            .frame(width: 90, height: 90)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(45)
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Text("Long long long button")
        }
    } counter: {
        Text("1 of 3")
    } row1: {
        HStack(spacing: 8) {
            LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Negative")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                }
            LabelItem(title: "Critical")
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.criticalLabel))
                }
            LabelItem(icon: Image(systemName: "checkmark.circle"), title: "Positive", alignment: .trailing)
                .titleStyle { config in
                    config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                }
        }
    } row2: {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star")
            Image(systemName: "star")
            Image(systemName: "star")
        }
    } row3: {
        HStack {
            Tag("Tag")
            Tag("Tag").tagStyle(DarkTagStyle())
            Tag("Tag")
        }
    } kpi: {
        KPIItem(data: .components([.unit("$"), .metric("8,888"), .unit("M")]), subtitle: "").cornerRadius(8)
    } cardBody: {
        VStack(alignment: .leading, spacing: 4) {
            DataTable(model: tableCard)
                .frame(height: 80)
            
            HStack {
                Tag("Tag")
                Tag("Tag").tagStyle(DarkTagStyle())
                Tag("Tag")
            }
        }
    } action: {
        FioriButton(title: "Approve")
    } secondaryAction: {
        FioriButton(title: "Decline")
    }
}

#Preview("Date") {
    Card {
        Image(systemName: "photo.artframe")
            .frame(maxWidth: .infinity, maxHeight: 145)
            .background(Color.gray.opacity(0.3))
    } title: {
        Text("Card title that wraps to two lines Card title that wraps to two lines Card title that wraps to two lines")
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
        }
    } cardBody: {
        VStack(alignment: .leading, spacing: 4) {
            DatePicker(
                "Start Date",
                selection: .constant(Date()),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
        }
    } action: {
        FioriButton(title: "Save Date")
    }
}

#Preview("ContactItem + KPI") {
    Card {
        Text("Title")
    } subtitle: {
        Text("Subtitle")
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
        }
    } row1: {
        HStack(spacing: -2) {
            Image(systemName: "person.circle")
            Image(systemName: "person.circle")
            Image(systemName: "person.circle")
            Image(systemName: "person.circle")
            Image(systemName: "person.circle")
            Text("6+")
                .background(Color.gray.opacity(0.3))
                .clipShape(Circle())
        }
    } cardBody: {
        VStack(alignment: .center, spacing: 4) {
            ContactItem(title: "Title",
                        subtitle: "Subtitle",
                        actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .email)], didSelectActivityItem: { dataType in
                            print("\(dataType)")
                        }))
            
            KPIItem(data: .components([.unit("R"), .metric("294"), .unit("L")]), subtitle: "Label")
        }
    }
}

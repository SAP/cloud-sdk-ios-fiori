import FioriCharts
import FioriThemeManager
import Foundation
import MapKit
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
        CardLayout(lineSpacing: 0) {
            if !configuration._cardHeader.isEmpty {
                configuration._cardHeader
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0))
            } else {
                Spacer().frame(width: 1, height: 10)
            }
            
            if !configuration.cardBody.isEmpty {
                configuration.cardBody
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
            
            if !(configuration._cardFooter.action.isEmpty && configuration._cardFooter.secondaryAction.isEmpty &&
                configuration._cardFooter.tertiaryAction.isEmpty)
            {
                configuration._cardFooter
                    .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
        }
        .clipped()
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

struct CardLayout: Layout {
    public struct CacheData {
        var width: CGFloat?
        var maxWidth: CGFloat
        var rows: [CGRect]
        
        mutating func clear() {
            self.width = nil
            self.maxWidth = 0
            self.rows.removeAll()
        }
    }
    
    let lineSpacing: CGFloat
    
    public init(lineSpacing: CGFloat = 8) {
        self.lineSpacing = lineSpacing
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        self.calculateLayout(for: subviews, containerWidth: proposal.width, cache: &cache)
        let finalWidth = max(proposal.width ?? 0, cache.maxWidth)
        let height: CGFloat = cache.rows.last?.maxY ?? 0
        
        return CGSize(width: finalWidth, height: height)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        self.calculateLayout(for: subviews, containerWidth: proposal.width, cache: &cache)
        
        for (i, subview) in subviews.enumerated() {
            let item = cache.rows[i]
            let pt = CGPoint(x: item.origin.x + bounds.origin.x, y: item.origin.y + bounds.origin.y)
            subview.place(at: pt, proposal: ProposedViewSize(width: item.size.width, height: nil))
        }
    }
    
    public func makeCache(subviews: Subviews) -> CacheData {
        CacheData(width: nil, maxWidth: 0, rows: [])
    }
    
    func calculateLayout(for subviews: Subviews, containerWidth: CGFloat?, cache: inout CacheData) {
        if subviews.isEmpty || (cache.width == containerWidth && !cache.rows.isEmpty) {
            return
        }
        cache.clear()
        cache.width = containerWidth
        
        let maxContainerWidth = containerWidth ?? CGFloat.greatestFiniteMagnitude
        let proposal = containerWidth == nil ? ProposedViewSize.unspecified : ProposedViewSize(width: containerWidth, height: nil)
        let sizes = subviews.map {
            $0.sizeThatFits(proposal)
        }.map {
            if $0.width > maxContainerWidth {
                return CGSize(width: maxContainerWidth, height: $0.height)
            } else {
                return $0
            }
        }
        
        var pt = CGPoint.zero
        
        for size in sizes {
            cache.rows.append(CGRect(origin: pt, size: size))
            pt.y += size.height + self.lineSpacing
            cache.maxWidth = max(cache.maxWidth, size.width)
        }
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
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
            // Add default style for MediaImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style for Description
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
            // Add default style for Title
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
            // Add default style for Subtitle
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct IconsFioriStyle: IconsStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: IconsConfiguration) -> some View {
            Icons(configuration)
            // Add default style for Icons
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
            // Add default style for DetailImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct HeaderActionFioriStyle: HeaderActionStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
            HeaderAction(configuration)
            // Add default style for HeaderAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CounterFioriStyle: CounterStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: CounterConfiguration) -> some View {
            Counter(configuration)
            // Add default style for Counter
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row1FioriStyle: Row1Style {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: Row1Configuration) -> some View {
            Row1(configuration)
            // Add default style for Row1
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row2FioriStyle: Row2Style {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: Row2Configuration) -> some View {
            Row2(configuration)
            // Add default style for Row2
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct Row3FioriStyle: Row3Style {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: Row3Configuration) -> some View {
            Row3(configuration)
            // Add default style for Row3
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct KpiFioriStyle: KpiStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: KpiConfiguration) -> some View {
            Kpi(configuration)
            // Add default style for Kpi
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct KpiCaptionFioriStyle: KpiCaptionStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
            // Add default style for KpiCaption
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardBodyFioriStyle: CardBodyStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: CardBodyConfiguration) -> some View {
            CardBody(configuration)
            // Add default style for CardBody
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
            // Add default style for NewAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            SecondaryAction(configuration)
            // Add default style for SecondaryAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct TertiaryActionFioriStyle: TertiaryActionStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: TertiaryActionConfiguration) -> some View {
            TertiaryAction(configuration)
            // Add default style for TertiaryAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct OverflowActionFioriStyle: OverflowActionStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
            OverflowAction(configuration)
            // Add default style for OverflowAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardHeaderFioriStyle: CardHeaderStyle {
        let cardConfiguration: CardConfiguration
        
        func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
            CardHeader(configuration)
            // Add default style for CardHeader
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct CardFooterFioriStyle: CardFooterStyle {
        let cardConfiguration: CardConfiguration
        
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

struct ColorTagStyle: TagStyle {
    /// text color
    var textColor: Color = .preferredColor(.secondaryLabel)
    
    /// Color inside the tag
    var fillColor: Color = .clear
    
    public init(textColor: Color, fillColor: Color) {
        self.textColor = textColor
        self.fillColor = fillColor
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .font(.fiori(forTextStyle: .footnote))
            .foregroundColor(self.textColor)
            .lineLimit(1)
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
            .background(RoundedRectangle(cornerRadius: 8).fill(self.fillColor))
    }
}

struct TagExample: View {
    var tagData: [(String, Color, Color)] = [
        ("Tag", .preferredColor(.grey9), .preferredColor(.grey2)),
        ("Tag", .preferredColor(.blue9), .preferredColor(.blue2)),
        ("Tag", .preferredColor(.teal8), .preferredColor(.teal2)),
        ("Tag", .preferredColor(.green9), .preferredColor(.green2)),
        ("taggggggggg", .preferredColor(.accentLabel1), .preferredColor(.accentBackground1))
    ]
    
    let num: Int
    let withDot: Bool
    
    init(num: Int = 4, withDot: Bool = false) {
        self.num = num
        self.withDot = withDot
        if self.tagData.count < num {
            for _ in 0 ..< num - self.tagData.count {
                self.tagData.append(("", .black, .black))
            }
        }
    }
    
    var body: some View {
        HStack(spacing: self.withDot ? 4 : 8) {
            ForEach(0 ..< self.num, id: \.self) { i in
                if self.tagData[i].0 == "" {
                    Tag("Tag")
                } else {
                    Tag(self.tagData[i].0)
                        .tagStyle(ColorTagStyle(textColor: self.tagData[i].1, fillColor: self.tagData[i].2))
                }
                
                if self.withDot, i < self.num - 1 {
                    Circle()
                        .foregroundColor(.preferredColor(.tertiaryLabel))
                        .frame(width: 2, height: 2)
                }
            }
        }
    }
}

struct RattingViewExample: View {
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star")
            Image(systemName: "star")
            Image(systemName: "star")
        }
    }
}

/// Card Tests
public enum CardTests {
    static let region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.766_241,
                                       longitude: -121.961_579),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    
    static let row1 = TableRowItem(data: [DataTextItem("Need Attention", Font.subheadline.weight(.medium), Color.preferredColor(.criticalLabel)), DataTextItem("Yesterday", Font.caption, Color.preferredColor(.tertiaryLabel))])
    static let row2 = TableRowItem(data: [DataTextItem("Stable", Font.subheadline), DataTextItem("Jul 5, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])
    static let row3 = TableRowItem(data: [DataTextItem("Need Attention", Font.subheadline), DataTextItem("Jul 4, 2021", Font.caption, Color.preferredColor(.tertiaryLabel))])
    
    static let tableCard = TableModel(headerData: nil,
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
    
    static let baseLine = ChartBaselineAttributes(color: .preferredColor(.secondaryLabel), isHidden: true)
    static let gridLine = ChartGridlineAttributes(color: .preferredColor(.secondaryLabel), isHidden: true)
    static let numAxis = ChartNumericAxisAttributes(baseline: baseLine, formatter: nil, abbreviatedFormatter: nil)
    static let chartModel = ChartModel(chartType: .column,
                                       data: [[30, 22, 80, 70, 60, 64, 50, 20, 90, 80, 50, 16],
                                              [22, 30, 90, 80, 70, 32, 28, 36, 84, 70, 30, 32]],
                                       titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]],
                                       userInteractionEnabled: false,
                                       readableScaleEnabled: false,
                                       categoryAxis: ChartCategoryAxisAttributes(gridlines: gridLine, formatter: nil, abbreviatedFormatter: nil, labelLayoutStyle: .range),
                                       numericAxis: ChartNumericAxisAttributes(baseline: baseLine, formatter: nil, abbreviatedFormatter: nil))
    
    static let sampleCard1 = Card {
        Image("card_image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 145)
    } title: {
        Text("Project Tioga")
    } subtitle: {
        Text("Assignment")
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "bookmark")
                .foregroundColor(.preferredColor(.tertiaryLabel))
        }
    } row1: {
        HStack(spacing: 4) {
            Tag("Project").tagStyle(ColorTagStyle(textColor: .preferredColor(.blue9), fillColor: .preferredColor(.blue2)))
            Circle().frame(width: 2).foregroundColor(Color.preferredColor(.tertiaryLabel).opacity(0.9))
            LabelItem(icon: Image(systemName: "calendar"), title: "1 Oct 2023 - 31 Oct 2023", alignment: .leading)
        }
    }
    
    static let sampleCard2 = Card {
        Text("Standard Room, 2 Single Beds")
    } subtitle: {
        Text("Gbt")
    } row1: {
        HStack {
            RattingViewExample()
            LabelItem(title: "Free Breakfast")
        }
    } row2: {
        Tag("Business Rate")
            .tagStyle(ColorTagStyle(textColor: .preferredColor(.grey9), fillColor: .preferredColor(.grey2)))
    } kpi: {
        KPIItem(data: .components([.unit("$"), .metric("90")]), subtitle: "avg. per night")
            .frame(height: 20)
    } action: {
        FioriButton(title: "Reserve")
    } secondaryAction: {
        FioriButton(title: "Save for Later")
    }
    
    static let sampleCard3 = Card {
        Text("Top Products")
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
        }
    } cardBody: {
        HStack(alignment: .center, spacing: 4) {
            ChartView(CardTests.chartModel).frame(height: 168)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Circle()
                        .fill(Color.preferredColor(.chart1))
                        .frame(width: 16)
                    
                    Text("Single Beds").font(.footnote)
                }
                
                HStack {
                    Circle()
                        .fill(Color.preferredColor(.chart2))
                        .frame(width: 16)
                    
                    Text("Double Beds").font(.footnote)
                }
                
                Spacer()
            }
        }.fixedSize(horizontal: false, vertical: true)
    }
    
    static let sampleCard4 = Card {
        Text("Alex Kilgo").font(.fiori(forTextStyle: .title2, weight: .semibold)).lineSpacing(25)
    } subtitle: {
        Text("UX Designer")
    } detailImage: {
        Image("ProfilePic")
            .resizable()
            .clipShape(Circle())
    } cardBody: {
        DataTable(model: CardTests.tableCard)
            .frame(height: 70)
    } action: {
        Button {
            print("Tapped")
        } label: {
            Text("Approve")
                .font(Font.fiori(forTextStyle: .body).weight(.semibold))
                .foregroundColor(Color.preferredColor(.tintColor2))
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .frame(minWidth: 44, maxWidth: .infinity, minHeight: 44)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.preferredColor(.informationBackground)))
                .contentShape(Rectangle())
        }
    } secondaryAction: {
        Text("Decline")
            .font(Font.fiori(forTextStyle: .body).weight(.semibold))
            .foregroundColor(Color.preferredColor(.negativeLabel))
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(minWidth: 44, maxWidth: .infinity, minHeight: 44)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.preferredColor(.negativeBackground)))
            .contentShape(Rectangle())
    }
    
    static let sampleCard5 = Card(title: "Title",
                                  subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                  icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                  detailImage: Image("ProfilePic"),
                                  headerAction: FioriButton(title: "..."),
                                  counter: "1 of 3",
                                  action: FioriButton(title: "Primary"),
                                  secondaryAction: FioriButton(title: "Secondary"))
    
    static let sampleCard6 = Card(title: "Title", subtitle: "Subtitle that goes to multiple lines before truncating just like that", headerAction: FioriButton(title: "..."), counter: "1 of 3", action: FioriButton(title: "Primary"))
    
    static let sampleCard7 = Card {
        Text("Bad Schoenborn, Sued").font(.fiori(forTextStyle: .title2, weight: .semibold)).lineSpacing(25)
    } subtitle: {
        Text("Local Public Transport")
    } detailImage: {
        Circle()
            .strokeBorder(.gray, lineWidth: 1)
            .background(Circle().fill(Color.gray.opacity(0.3)))
            .frame(width: 60, height: 60)
            .overlay {
                Image(systemName: "bus.fill")
                    .font(.title)
            }
    } cardBody: {
        VStack(alignment: .leading) {
            Text("Mannheim Hauptbahnbof").font(.fiori(forTextStyle: .headline, weight: .semibold))
            HStack(spacing: 4) {
                Text("04:19").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("04:57").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("05:07").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("05:14").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("05:34").foregroundColor(.preferredColor(.secondaryLabel))
            }
            
            Divider()
            
            Text("Heidelberg Hauptbahnbof").font(.fiori(forTextStyle: .headline, weight: .semibold))
            HStack(spacing: 4) {
                Text("04:37").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("04:15").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("--").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("05:39").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("--").foregroundColor(.preferredColor(.secondaryLabel))
            }
            
            Divider()
            
            Text("Wiesloch - Walldorf").font(.fiori(forTextStyle: .headline, weight: .semibold))
            HStack(spacing: 4) {
                Text("04:37").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("04:15").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("--").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("05:39").foregroundColor(.preferredColor(.secondaryLabel))
                Circle().foregroundColor(.gray).frame(width: 4)
                Text("--").foregroundColor(.preferredColor(.secondaryLabel))
            }
        }
    }
    
    static let sampleCard8 = Card {
        Image("attachment009")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 145)
    } title: {
        Text("Card title that wraps to two lines")
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
    
    static let sampleCard9 = Card {
        Text("Coyote Hill Rd").font(.fiori(forTextStyle: .title1, weight: .bold))
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
        }
    } cardBody: {
        VStack(alignment: .leading, spacing: 4) {
            ContactItem(title: "Title",
                        subtitle: "Subtitle",
                        actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .email)], didSelectActivityItem: { dataType in
                            print("\(dataType)")
                        }))
            
            Map(coordinateRegion: .constant(CardTests.region))
                .frame(height: 200)
        }
    }
    
    static let sampleCard10 = Card {
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
    
    static let sampleCard11 = Card {
        Image("attachment009")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 345)
    } description: {
        Text("Title")
    } title: {
        Text("Title that goes to two lines before truncating just like that")
    } detailImage: {
        Image("ProfilePic")
            .resizable()
            .cornerRadius(8)
    } headerAction: {
        Button {
            print("tapped")
        } label: {
            Text("Long long long button")
                .foregroundColor(.preferredColor(.secondaryLabel))
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color.preferredColor(.secondaryFill))
                .cornerRadius(8)
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
        RattingViewExample()
    } row3: {
        TagExample(num: 3)
    } kpi: {
        KPIItem(data: .components([.unit("$"), .metric("8,888"), .unit("M")]), subtitle: "").cornerRadius(8)
    } cardBody: {
        VStack(alignment: .leading, spacing: 4) {
            DataTable(model: CardTests.tableCard.copy())
                .frame(height: 80)
            
            Divider()
            
            TagExample(num: 4, withDot: true)
        }
    } action: {
        FioriButton(title: "Approve")
    }
    
    static let vbCard = Card {
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
    
    static let fullCard = Card {
        Image("card_image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 145)
    } description: {
        Text("Title")
    } title: {
        Text("Title that goes to three lines before truncating just like that")
    } subtitle: {
        Text("Subtitle that goes to two lines before truncating just like that")
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
        FlowLayout(spacing: 8, lineSpacing: 2, lineLimit: 3) {
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
            Image(systemName: "star")
            LabelItem(title: "Long long long label")
            Image(systemName: "star.fill")
            LabelItem(title: "Multiple lines row1")
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
        TagExample(num: 8, withDot: true)
    } cardBody: {
        VStack(alignment: .leading, spacing: 4) {
            DataTable(model: CardTests.tableCard)
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
    
    static let headerOnly = Card(mediaImage: Image("card_image"), title: "Title")
    
    static let titleOnly = Card(title: "Title")
    
    static let sampleCard12 = Card(title: "Title",
                                   subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                   headerAction: FioriButton(title: "..."),
                                   counter: "1 of 3",
                                   action: FioriButton(title: "Primary"),
                                   secondaryAction: FioriButton(title: "Secondary"))
    
    static let sampleCard13 = Card(title: "Title",
                                   subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                   headerAction: FioriButton(title: "..."),
                                   counter: "1 of 3",
                                   action: FioriButton(title: "Primary"),
                                   secondaryAction: FioriButton(title: "Secondary"), tertiaryAction: FioriButton(title: "Tertiary"))
    
    static let sampleCard14 = Card(title: "Title",
                                   subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                   headerAction: FioriButton(title: "..."),
                                   counter: "1 of 3",
                                   action: FioriButton(title: "Primary long long long long long"),
                                   secondaryAction: FioriButton(title: "Secondary"), tertiaryAction: FioriButton(title: "Tertiary"))
    
    static let sampleCard15 = Card(title: "Title",
                                   subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                   headerAction: FioriButton(title: "..."),
                                   counter: "1 of 3",
                                   action: FioriButton(title: "Primary"),
                                   secondaryAction: FioriButton(title: "Secondary long long long long long a b c long long long long"), tertiaryAction: FioriButton(title: "Tertiary"),
                                   overflowAction: FioriButton(title: "Overflow"))

    static let sampleCard20 = Card(title: "Title",
                                   subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                   headerAction: FioriButton(title: "..."),
                                   counter: "1 of 3",
                                   action: FioriButton(title: "Primary long long long long long long long long"),
                                   secondaryAction: FioriButton(title: "Secondary long long long long long long long long long long long"), tertiaryAction: FioriButton(title: "Tertiary"),
                                   overflowAction: FioriButton(title: "Overflow"))
    
    static let sampleCard16 = Card(title: "Title",
                                   subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                   headerAction: FioriButton(title: "..."),
                                   counter: "1 of 3",
                                   secondaryAction: FioriButton(title: "Secondary"))
    
    static let sampleCard17 = Card(title: "Title",
                                   subtitle: "Subtitle that goes to multiple lines before truncating just like that",
                                   icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")],
                                   headerAction: FioriButton(title: "..."),
                                   counter: "1 of 3",
                                   tertiaryAction: FioriButton(title: "Tertiary"),
                                   overflowAction: FioriButton(title: "Overflow"))
    
    static let sampleCard18 = Card {
        Text("Standard Room, 2 Single Beds")
    } subtitle: {
        Text("Gbt")
    } row1: {
        HStack {
            RattingViewExample()
            LabelItem(title: "Free Breakfast")
        }
    } row2: {
        Tag("Business Rate")
            .tagStyle(ColorTagStyle(textColor: .preferredColor(.grey9), fillColor: .preferredColor(.grey2)))
    } kpi: {
        KPIItem(data: .components([.unit("$"), .metric("90")]), subtitle: "avg. per night")
            .frame(height: 20)
    } action: {
        FioriButton { state in
            print("primaryAction \(state)")
        } label: { _ in
            HStack {
                Image(systemName: "tray")
                Text("Reserve")
            }
        }
    } secondaryAction: {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.purple)
            .frame(width: 120, height: 80)
            .onTapGesture {
                print("secondaryAction tapped")
            }
    } tertiaryAction: {
        Image(systemName: "doc")
            .onTapGesture {
                print("tertiaryAction tapped")
            }
    } overflowAction: {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.green)
            .frame(width: 40, height: 40)
            .onTapGesture {
                print("overflowAction tapped")
            }
    }
    
    static let sampleCard19 = Card {
        Text("Standard Room, 2 Single Beds")
    } subtitle: {
        Text("Gbt")
    } row1: {
        HStack {
            RattingViewExample()
            LabelItem(title: "Free Breakfast")
        }
    } row2: {
        Tag("Business Rate")
            .tagStyle(ColorTagStyle(textColor: .preferredColor(.grey9), fillColor: .preferredColor(.grey2)))
    } kpi: {
        KPIItem(data: .components([.unit("$"), .metric("90")]), subtitle: "avg. per night")
            .frame(height: 20)
    } action: {
        Button {
            print("Tapped")
        } label: {
            Text("Save")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
    } secondaryAction: {
        Image(systemName: "doc")
            .onTapGesture {
                print("secondaryAction tapped")
            }
    } tertiaryAction: {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.purple)
            .frame(width: 200, height: 80)
            .onTapGesture {
                print("tertiaryAction tapped")
            }
    } overflowAction: {
        FioriButton(title: "Overflow")
    }

    static let noHeader = Card {
        EmptyView()
    } cardBody: {
        Text("Single Beds").font(.footnote)
    }
    
    /// Sample cards for testing
    public static let cardSamples = [sampleCard1, sampleCard13, sampleCard2, sampleCard3, sampleCard4, sampleCard5, sampleCard6, sampleCard7, sampleCard9, sampleCard10, vbCard, sampleCard11, sampleCard8, fullCard]
    public static let cardFooterSamples = [sampleCard6, sampleCard16, sampleCard17, sampleCard12, sampleCard13, sampleCard14, sampleCard15, sampleCard20, sampleCard18, sampleCard19]
    static let previewCardSamples = [sampleCard1, sampleCard2, sampleCard3, sampleCard4, sampleCard5, sampleCard6, sampleCard7, sampleCard8, sampleCard9, sampleCard10, sampleCard11, vbCard, fullCard, headerOnly, titleOnly, noHeader]
}

struct CardPreview: PreviewProvider {
    static var previews: some View {
        ForEach(0 ..< CardTests.previewCardSamples.count, id: \.self) { i in
            CardTests.previewCardSamples[i]
        }
    }
}

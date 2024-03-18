import FioriCharts
import FioriSwiftUICore
import MapKit
import SwiftUI

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
            ForEach(0 ..< self.num) { i in
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

#Preview("Tags") {
    TagExample()
}

#Preview("Tags") {
    TagExample(num: 6, withDot: true)
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

struct MobileCardExample: View {
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
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.766_241,
                                       longitude: -121.961_579),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    
    var chartModel = {
        let numAxis = ChartNumericAxisAttributes(baseline: ChartBaselineAttributes(width: 1, dashPatternLength: 1, dashPatternGap: 0, isHidden: true, value: nil, position: nil), formatter: nil, abbreviatedFormatter: nil)
        numAxis.labels.isHidden = true
        numAxis.gridlines.width = 1
        numAxis.gridlines.color = Color.preferredColor(.secondaryLabel)
        let catAxis = ChartCategoryAxisAttributes()
        catAxis.baseline.color = Color.preferredColor(.secondaryLabel)
        catAxis.labelLayoutStyle = .range
        catAxis.gridlines.isHidden = true
        let model = ChartModel(chartType: .line,
                               data: [[30, 22, 80, 70, 60, 64, 50, 20, 90, 80, 50, 16],
                                      [22, 30, 90, 80, 70, 32, 28, 36, 84, 70, 30, 32]],
                               titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]],
                               userInteractionEnabled: false,
                               readableScaleEnabled: false,
                               categoryAxis: catAxis,
                               numericAxis: numAxis)
        
        model.chartType = .column
        
        return model
    }()
    
    var body: some View {
        List {
            Card {
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
            
            Card {
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
            
            Card {
                Text("Top Products")
            } headerAction: {
                Button {
                    print("tapped")
                } label: {
                    Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
                }
            } cardBody: {
                HStack(alignment: .center, spacing: 4) {
                    ChartView(self.chartModel).frame(height: 168)
                    
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
                }
            }

            Card {
                Text("Alex Kilgo").font(.fiori(forTextStyle: .title2, weight: .bold)).lineSpacing(25)
            } subtitle: {
                Text("UX Designer")
            } detailImage: {
                Image("ProfilePic")
                    .resizable()
                    .clipShape(Circle())
            } cardBody: {
                DataTable(model: self.tableCard)
                    .frame(height: 70)
            } action: {
                Button {
                    print("Tapped")
                } label: {
                    Text("Approve")
                        .font(Font.fiori(forTextStyle: .body).weight(.bold))
                        .foregroundColor(Color.preferredColor(.tintColor2))
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .frame(minWidth: 44, maxWidth: .infinity, minHeight: 44)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.preferredColor(.informationBackground)))
                        .contentShape(Rectangle())
                }
            } secondaryAction: {
                Text("Decline")
                    .font(Font.fiori(forTextStyle: .body).weight(.bold))
                    .foregroundColor(Color.preferredColor(.negativeLabel))
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .frame(minWidth: 44, maxWidth: .infinity, minHeight: 44)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.preferredColor(.negativeBackground)))
                    .contentShape(Rectangle())
            }
            
            Card(title: "Title", subtitle: "Subtitle that goes to multiple lines before truncating just like that", icons: [TextOrIcon.icon(Image(systemName: "circle.fill")), TextOrIcon.icon(Image(systemName: "paperclip")), TextOrIcon.text("1")], detailImage: Image("ProfilePic"), headerAction: FioriButton(title: "..."), counter: "1 of 3", action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Secondary"))
                .cardStyle(.detailImageStyle { config in
                    config.detailImage
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .border(Color.green, width: 2)
                })
            
            Card(title: "Title", subtitle: "Subtitle that goes to multiple lines before truncating just like that", headerAction: FioriButton(title: "..."), counter: "1 of 3", action: FioriButton(title: "Primary"))
            
            Card {
                Text("Bad Schoenborn, Sued").font(.fiori(forTextStyle: .title2, weight: .bold)).lineSpacing(25)
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
                    Text("Mannheim Hauptbahnbof").font(.fiori(forTextStyle: .headline, weight: .bold))
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
                    
                    Text("Heidelberg Hauptbahnbof").font(.fiori(forTextStyle: .headline, weight: .bold))
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
                    
                    Text("Wiesloch - Walldorf").font(.fiori(forTextStyle: .headline, weight: .bold))
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
            
            Card {
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
            
            Card {
                Text("Coyote Hill Rd").font(.fiori(forTextStyle: .title1, weight: .black))
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
                    
                    Map(coordinateRegion: self.$region).frame(height: 200)
                }
            }
            
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
            
            Card {
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
                    DataTable(model: self.tableCard.copy())
                        .frame(height: 80)
                    
                    Divider()
                    
                    TagExample(num: 4, withDot: true)
                }
            } action: {
                FioriButton(title: "Approve")
            }
        }
        .navigationBarTitle("Cards", displayMode: .inline)
        .cardStyle(.card)
        .listStyle(.plain)
    }
}

struct MobileCardExample_Previews: PreviewProvider {
    static var previews: some View {
        MobileCardExample()
    }
}

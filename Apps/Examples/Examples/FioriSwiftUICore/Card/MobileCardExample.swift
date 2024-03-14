import FioriCharts
import FioriSwiftUICore
import MapKit
import SwiftUI

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
    
    // SAP
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.766_241,
                                       longitude: -121.961_579),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    
    var chartModel = {
        let model = Tests.lineModels[1]
        model.chartType = .column
        
        return model
    }()
    
    var body: some View {
        List {
            NavigationLink {
                Card {
                    Text("Bad Schoenborn, Sued").font(.fiori(forTextStyle: .title2, weight: .bold))
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
            } label: {
                Text("Labels")
            }
            
            NavigationLink {
                Card(title: "Title", subtitle: "Timestamp", kpi: KPIItemData.components([.metric("10"), .unit("h")]))
                //                Card {
                //                    CardHeader {
                //                        CardMainHeader(title: "Title", subtitle: "Timestamp")
                //                    }
                //                } bodyContent: {
                //                    CardBody {
                //                        KPIItem(data: .components([.metric("10"), .unit("h")])).frame(maxWidth: .infinity)
                //                    }
                //                }
            } label: {
                Text("KPI")
            }
            
            NavigationLink {
                Card {
                    Image("attachment009")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 145)
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
            } label: {
                Text("Calendar")
            }
            
            NavigationLink {
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
            } label: {
                Text("Map")
            }
            
            NavigationLink {
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
            } label: {
                Text("ContactItem + KPI")
            }
            
            NavigationLink {
                Card {
                    Text("Sales Revenue by Channel")
                } subtitle: {
                    Text("DDfGWG")
                } headerAction: {
                    Button {
                        print("tapped")
                    } label: {
                        Image(systemName: "ellipsis").foregroundColor(.preferredColor(.primaryLabel))
                    }
                } row1: {
                    Text("dewF").foregroundColor(.preferredColor(.primaryLabel))
                } cardBody: {
                    VStack(alignment: .center, spacing: 4) {
                        HStack(alignment: .bottom, spacing: 4) {
                            KPIItem(data: .components([.unit("P"), .metric("294"), .unit("S")]))
                                .frame(width: 100)
                            
                            Image(systemName: "triangle.fill")
                                .foregroundColor(.green)
                            
                            Text("daJND").foregroundColor(.green)
                            Spacer(minLength: 0)
                        }
                        
                        ChartView(self.chartModel).frame(height: 200)
                        
                        HStack(alignment: .center, spacing: 8) {
                            HStack {
                                Circle()
                                    .fill(Color.preferredColor(.chart1))
                                    .frame(width: 16)
                                
                                Text("FF").font(.footnote)
                            }
                            
                            HStack {
                                Circle()
                                    .fill(Color.preferredColor(.chart2))
                                    .frame(width: 16)
                                
                                Text("LaRQel").font(.footnote)
                            }
                            
                            Spacer()
                        }
                    }
                }
            } label: {
                Text("Chart")
            }
            
            NavigationLink {
                Card {
                    Image("attachment009")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } title: {
                    Text("Title that goes to two lines before truncating just like that")
                } detailImage: {
                    Image("ProfilePic")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .cornerRadius(45)
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
                        DataTable(model: self.tableCard)
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
            } label: {
                Text("Main & Ext Header + Body + Footer")
            }
            
            NavigationLink {
                Card {
                    Image("attachment009")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 145)
                } title: {
                    Text("Title that goes to two lines before truncating just like that")
                } subtitle: {
                    Text("Subtitle")
                } detailImage: {
                    Image("ProfilePic")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .cornerRadius(45)
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
                        LabelItem(icon: Image(systemName: "checkmark.circle.fill"), title: "Status")
                        LabelItem(icon: Image(systemName: "clock.fill"), title: "Status")
                            .titleStyle { config in
                                config.title.foregroundStyle(Color.preferredColor(.positiveLabel))
                            }
                        LabelItem(icon: Image(systemName: "exclamationmark.triangle.fill"), title: "Status", alignment: .trailing)
                            .titleStyle { config in
                                config.title.foregroundStyle(Color.preferredColor(.negativeLabel))
                            }
                    }
                } row2: {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
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
                    KPIItem(data: .components([.unit("$"), .metric("8,888"), .unit("M")]), subtitle: "").frame(width: 140)
                } cardBody: {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 4) {
                            // List {
                            DataTable(model: self.tableCard)
                                .frame(height: 76)
                            
                            HStack {
                                Tag("Tag")
                                Tag("Tag").tagStyle(DarkTagStyle())
                                Tag("Tag")
                            }
                            
                            ChartView(self.chartModel).frame(height: 200)
                            
                            ContactItem(title: "Title",
                                        subtitle: "Subtitle",
                                        actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .email)], didSelectActivityItem: { dataType in
                                            print("\(dataType)")
                                        }))
                            
                            DatePicker(
                                "Start Date",
                                selection: .constant(Date()),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.graphical)
                            
                            HStack {
                                Spacer()
                                KPIItem(data: .components([.unit("R"), .metric("294"), .unit("L")]), subtitle: "Label")
                                Spacer()
                            }
                            
                            Map(coordinateRegion: self.$region).frame(height: 200)
                        }
                    }
                } action: {
                    FioriButton(title: "Approve")
                } secondaryAction: {
                    FioriButton(title: "Decline")
                }
            } label: {
                Text("A lot of UI Components in Card Body")
            }
            
            NavigationLink {
                Card {
                    KPIItem(data: .components([.unit("$"), .metric("8,888"), .unit("M")]), subtitle: "").frame(width: 200, alignment: .trailing)
                } subtitle: {
                    DataTable(model: self.tableCard)
                        .frame(height: 76)
                } detailImage: {
                    Map(coordinateRegion: self.$region).frame(width: 100, height: 100).border(Color.gray)
                } cardBody: {
                    CardFooter(action: FioriButton(title: "Approve"), secondaryAction: FioriButton(title: "Decline"))
                } action: {
                    VStack(alignment: .leading, spacing: 4) {
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
                        
                        HStack {
                            Tag("Tag")
                            Tag("Tag").tagStyle(DarkTagStyle())
                            Tag("Tag")
                        }
                    }
                }
            } label: {
                Text("Crazy Card")
            }
        }.navigationBarTitle("Cards", displayMode: .inline)
    }
}

struct MobileCardExample_Previews: PreviewProvider {
    static var previews: some View {
        MobileCardExample()
    }
}

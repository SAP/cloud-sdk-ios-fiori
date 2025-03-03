import FioriSwiftUICore
import SwiftUI

struct BannerMessageCustomInitExample: View {
    enum BannerHeader {
        case object
        case kpi
    }
    
    @State var show: Bool = true
    @State var isCustomStyle: Bool = false
    @State var headerSelection: BannerHeader = .object
    
    let customColor = Color.preferredColor(.blue7)
    
    var bannerView: some View {
        BannerMessage {
            Image(systemName: "info.circle")
        } title: {
            Text("This is a banner message")
        } closeAction: {
            Button(action: {
                withAnimation {
                    self.show.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
            })
        }
        .ifApply(self.isCustomStyle, content: { v in
            v.topDividerStyle { c in
                c.topDivider.background(self.customColor)
            }
            .iconStyle { c in
                c.icon.foregroundStyle(self.customColor)
            }
            .titleStyle { c in
                c.title.foregroundStyle(self.customColor)
            }
            .closeActionStyle { c in
                c.closeAction.foregroundStyle(self.customColor)
            }
        })
    }
    
    var body: some View {
        List {
            self.header
            if self.show {
                Section {
                    self.bannerView
                        .listRowInsets(EdgeInsets())
                        .ignoresSafeArea()
                }
            }
            Section {
                ForEach(0 ..< 3) { index in
                    Text("cell at index: \(index)")
                }
                Button {
                    withAnimation {
                        self.show.toggle()
                    }
                } label: {
                    Text("Show / Hide").foregroundStyle(Color.preferredColor(.tintColor))
                }
                
                Toggle("With Custom Style", isOn: self.$isCustomStyle)
                
                Picker("Header Type", selection: self.$headerSelection) {
                    Text("Object Header").tag(BannerHeader.object)
                    Text("KPI Header").tag(BannerHeader.kpi)
                }
            } header: {}
        }.listStyle(.plain)
            .navigationTitle("Custom Creation")
    }
    
    @ViewBuilder
    var header: some View {
        switch self.headerSelection {
        case .object:
            self.objectHeader
        case .kpi:
            _KPIItem(data: .components([.icon(Image(systemName: "heart.fill")), .metric("2K"), .icon(Image(systemName: "hand.thumbsup")), .metric("7.5K")]), subtitle: "Likes & Thumbs-Up")
        }
    }
    
    var objectHeader: some View {
        ObjectHeader(title: {
            Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
        }, subtitle: {
            Text("Job 819701")
        }, tags: {
            Tag("Started")
            
            Tag("PM01")
            
            Text("LongLongLongTag")
                .font(.fiori(forTextStyle: .footnote))
                .padding()
                .border(Color.green, width: 1)
            
            Image(systemName: "person")
            
            Tag("103-Repair")
            
        }, bodyText: {
            Text("1000-Hamburg, MECHANIK")
        }, footnote: {
            Text("Due on 12/31/16")
        }, descriptionText: {
            Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
        }, status: {
            Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
        }, substatus: {
            Text("High Priority")
        }, detailImage: {
            Image("attachment009").resizable()
        }, detailContent: {
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            })
        })
    }
}

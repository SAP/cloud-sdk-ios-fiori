import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct ObjectHeaderDeveloperExample: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            return 1
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Tags"

        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        let chartModel = ChartModel(chartType: .line,
                                    data: [[10, 30, 45, 55, 40, 70, 80]],
                                    titlesForCategory: [["9AM", nil, nil, nil, nil, nil, "9PM"]],
                                    categoryAxis: ChartCategoryAxisAttributes(labelLayoutStyle: .range))
        chartModel.numericAxis.labels.isHidden = true
        chartModel.categoryAxis.gridlines.isHidden = true
        chartModel.seriesAttributes[0].point.isHidden = true
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let oh = ObjectHeader(title: "Transformer Overheating",
                                  subtitle: "Three Phase Pad Mounted Transformer (533423)",
                                  tags: ["I am selected", "PM01", "103-Repair", "tag 4", "tag 5", "tag 6", "Tag 9898232323", "Tagoweioaifoewif"],
                                  footnote: "1000 - Hamburg, MECHANIK",
                                  descriptionText: "Customer noticed that the transformer started",
                                  status: TextOrIcon.text("High"),
                                  substatus: TextOrIcon.text("Scheduled"),
                                  detailContent: {
                                      HeaderChart(title: {
                                          Text("Temperature")
                                      }, subtitle: {
                                          Text("20 min ago")
                                      }, chart: {
                                          ChartView(chartModel)
                                      })
                                  })
            
            return AnyView(oh)
            
        case (0, 1):
            let oh = ObjectHeader(title: {
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
                }, chart: {
                    ChartView(chartModel)
                })
            })
            
            return AnyView(oh)
            
        case (0, 2):
            let oh = ObjectHeader(title: "Transformer Overheating",
                                  subtitle: "Three Phase Pad Mounted Transformer (533423)",
                                  tags: ["I am selected", "PM01", "103-Repair", "tag 4", "tag 5", "tag 6", "Tag 9898232323", "Tagoweioaifoewif"],
                                  footnote: "1000 - Hamburg, MECHANIK",
                                  descriptionText: "Customer noticed that the transformer started",
                                  status: TextOrIcon.text("High"),
                                  substatus: TextOrIcon.text("Scheduled"),
                                  detailContent: {
                                      HeaderChart(title: {
                                          Text("Temperature")
                                      }, subtitle: {
                                          Text("20 min ago")
                                      }, chart: {
                                          ChartView(chartModel)
                                      })
                                  }).tagLimit(3)
            
            return AnyView(oh)
            
        case (0, 3):
            let tags = MHStack(spacing: 40, lineSpacing: 10) {
                Tag("Started")
                
                Tag("PM01")
                
                Image(systemName: "person")
                
                Tag("103-Repair")
                
                Tag("Tag5")
                
                Tag("Tag6")
                
                Tag("Tag7")
                
                Tag("Tag8")
                
                Tag("Tag9")
                
                Tag("Tag10")
            }
            
            return AnyView(tags)
            
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor"))
        }
    }
}

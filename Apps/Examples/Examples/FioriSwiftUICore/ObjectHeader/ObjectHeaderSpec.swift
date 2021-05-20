import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct ObjectHeaderSpec: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        6
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 6
        default:
            return 4
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Page 6: Object Header Content Priority - Regular"
        case 1:
            return "Page 7: Object Header - Regular(1)"
        case 2:
            return "Page 8: Object Header - Regular(2)"
        case 3:
            return "Page 9: Object Header - Regular(3)"
        case 4:
            return "Page 10: Object Header - Regular(4)"
        case 5:
            return "Page 11: Object Header - Regular(5)"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
    
    let df: DateComponentsFormatter = {
        let df = DateComponentsFormatter()
        df.maximumUnitCount = 2
        df.allowedUnits = [.day, .hour, .minute, .second]
        df.unitsStyle = .abbreviated
        return df
    }()
    
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
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
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
        case (0, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
            
        case (0, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            })
            
            return AnyView(oh)
            
        case (0, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            })
            
            return AnyView(oh)
            
        case (0, 4):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines Accessibility Settings Testing")
            }, subtitle: {
                Text("Job 819701 Accessibility Settings Testing")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            })
            
            return AnyView(oh)
            
        case (0, 5):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines Accessibility Settings Testing")
            }, subtitle: {
                Text("Job 819701 Accessibility Settings Testing")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            }, detailContent: {
                HeaderChart(title: {
                    Text("Temperature")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                }, kpi: {
                    KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
                })
            })
            
            return AnyView(oh)
            
        case (1, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("High").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable()
            }, detailContent: {
                HeaderChart(title: {
                    Text("Temperature")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                }, kpi: {
                    KPIItem(data: .components([.unit("$"), .metric("8,888.88"), .unit("M")]), subtitle: "").disabled(true)
                }, chart: {
                    ChartView(chartModel)
                })
            })
            
            return AnyView(oh)
            
        case (1, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, detailImage: {
                Image("attachment009").resizable()
            }, detailContent: {
                HeaderChart(title: {
                    Text("Temperature")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                }, kpi: {
                    KPIItem(data: .components([.unit("$"), .metric("8,888.88"), .unit("M")]), subtitle: "").disabled(true)
                }, chart: {
                    ChartView(chartModel)
                })
            })
            
            return AnyView(oh)
            
        case (1, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example One Line Extending Left")
            }, tags: {
                Tag("Started")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK Functional Location")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High")
            }, detailContent: {
                HeaderChart(title: {
                    Text("")
                }, kpi: {
                    KPIItem(data: .duration(22500, df), subtitle: "Working Hours").disabled(true)
                })
            })
            
            return AnyView(oh)
            
        case (1, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, detailContent: {
                HeaderChart(title: {
                    Text("Total Sales Q2")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                })
            })
            
            return AnyView(oh)
            
        case (1, 4):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, status: {
                Text("High").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("attachment009").resizable()
            }, detailContent: {
                HeaderChart(title: {
                    Text("Temperature")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                }, kpi: {
                    KPIItem(data: .components([.unit("$"), .metric("8888.88"), .unit("M")]), subtitle: "").disabled(true)
                }, chart: {
                    ChartView(chartModel)
                })
            })
            
            return AnyView(oh)
            
        case (2, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Very High Priority")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
            
        case (2, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job Number 819701203855-really long number")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
            
        case (2, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating High failure in 4 days.")
            }, status: {
                Text("High")
            }, substatus: {
                Text("Scheduled")
            })
            
            return AnyView(oh)
            
        case (2, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor")
            }, subtitle: {
                Text("Job Number 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK Functional Location Extra Long Text That Extends")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            })
            
            return AnyView(oh)
            
        case (3, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("Very High Priority")
            }, detailImage: {
                Image("attachment009").resizable()
            }, detailContent: {
                HeaderChart(title: {
                    Text("Total Sales Q2")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                })
            })
            
            return AnyView(oh)
            
        case (3, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
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
        case (3, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("High Priority")
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
        case (3, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, detailContent: {
                HeaderChart(title: {
                    Text("Total Sales Q2")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%").foregroundColor(.green)
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.green)
                })
            })
            
            return AnyView(oh)
            
        case (4, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK Functional Location")
            }, footnote: {
                Text("Due on 12/31/16")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
           
        case (4, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High Priority")
            })
            
            return AnyView(oh)
           
        case (4, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Extending")
            }, subtitle: {
                Text("Job 819701")
            }, detailImage: {
                Image("attachment009").resizable()
            }, detailContent: {
                HeaderChart(title: {
                    Text("Total Sales Q2")
                }, subtitle: {
                    Text("20 min ago")
                }, kpi: {
                    KPIItem(data: .components([.unit("$"), .metric("8,278.75"), .unit("USD")]), subtitle: "").disabled(true)
                })
            })
            
            return AnyView(oh)
            
        case (4, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Will Not Truncate")
            }, subtitle: {
                Text("Job Number 819701203855-really long number")
            }, tags: {
                Tag("Started")
                Tag("PM01")
                Tag("103-Repair")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK Functional Location")
            }, footnote: {
                Text("Due on 12/31/16")
            })
            
            return AnyView(oh)
            
        case (5, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Inspect Electric Pump Motor Long Job Title Wrapping Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High Priority")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
         
        case (5, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High Priority")
            })
            
            return AnyView(oh)
         
        case (5, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Inspect Electric Pump Motor Long Job Title Wrapping Two Lines")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
          
        case (5, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor")
            }, subtitle: {
                Text("Job Number 819701203855-really long number")
            })
            
            return AnyView(oh)
            
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor", status: "Available"))
        }
    }
}

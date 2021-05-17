import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct ObjectHeaderSpecCompact: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        5
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 4
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Page 13: Object Header Accessibility - Compact"
        case 1:
            return "Page 14: Object Header - Compact(1)"
        case 2:
            return "Page 15: Object Header - Compact(2)"
        case 3:
            return "Page 16: Object Header - Compact(3)"
        case 4:
            return "Page 17: Object Header - Compact(4)"
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
        chartModel.seriesAttributes[0].point.isHidden = true
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
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
                Text("High")
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
        case (0, 1):
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
                Text("High")
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
            
        case (1, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Title Will Wrap Three Lines Example With Attribute")
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
                Text("High")
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
                Text("Inspect Electric Pump")
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
                Text("High")
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
                Text("Inspect Electric Pump Title Will Wrap Three Lines Example With Attribute")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK Functional Location")
            }, footnote: {
                Text("Due on 12/31/16")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
            
        case (1, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Title Will Not Truncate Three Lines Example Inspect Electric Motor")
            }, tags: {
                Tag("Started")
            }, detailContent: {
                HeaderChart(title: {
                    Text("")
                }, kpi: {
                    KPIItem(data: .duration(22500, df), subtitle: "Working Hours").disabled(true)
                })
            })
            
            return AnyView(oh)
            
        case (2, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Title Will Wrap Three Lines Example With Attribute")
            }, subtitle: {
                Text("Job 819701")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High")
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
            
        case (2, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump")
            }, subtitle: {
                Text("Job 819701103857592-493487987")
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
            
        case (2, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High")
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
            
        case (2, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days.")
            }, detailContent: {
                HeaderChart(title: {
                    Text("")
                }, kpi: {
                    KPIItem(data: .duration(22500, df), subtitle: "Working Hours").disabled(true)
                })
            })
            
            return AnyView(oh)
            
        case (3, 0):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Title Will Wrap Three Lines Example With Attribute")
            }, subtitle: {
                Text("Job 819701")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High")
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
            
        case (3, 1):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump")
            }, subtitle: {
                Text("Job 819701")
            }, status: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable()
            }, detailContent: {
                HeaderChart(title: {
                    Text("")
                }, kpi: {
                    KPIItem(data: .duration(22500, df), subtitle: "Working Hours").disabled(true)
                })
            })
            
            return AnyView(oh)
        case (3, 2):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Title Will Wrap Two Lines Example With Attribute")
            }, subtitle: {
                Text("Job 819701")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("Delayed")
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
        case (3, 3):
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Title Will Wrap and Never Truncates")
            }, subtitle: {
                Text("ob 81970120384747 very long job number")
            }, detailContent: {
                HeaderChart(title: {
                    Text("")
                }, kpi: {
                    KPIItem(data: .duration(22500, df), subtitle: "Working Hours").disabled(true)
                })
            })
            
            return AnyView(oh)
            
        case (4, 0):
            let oh = ObjectHeader(title: {
                Text(" Inspect Electric Pump Title Will Wrap Three Lines Example With Attribute")
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
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
           
        case (4, 1):
            let oh = ObjectHeader(title: {
                Text(" Inspect Electric Pump Title Will Wrap Three Lines Example With Attribute")
            }, subtitle: {
                Text("Job 819701")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
           
        case (4, 2):
            let oh = ObjectHeader(title: {
                Text(" Inspect Electric Pump")
            }, subtitle: {
                Text("Job 819701")
            }, tags: {
                Tag("Started")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negative))
            }, substatus: {
                Text("High Priority")
            })
            
            return AnyView(oh)
            
        case (4, 3):
            let oh = ObjectHeader(title: {
                Text(" Inspect Electric Pump Title Will Wrap Three Lines Example With Attribute")
            }, subtitle: {
                Text("Job 819701")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days. Temperature sensor predicts overheating failure in 4 days.")
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
            
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor", status: "Available"))
        }
    }
}

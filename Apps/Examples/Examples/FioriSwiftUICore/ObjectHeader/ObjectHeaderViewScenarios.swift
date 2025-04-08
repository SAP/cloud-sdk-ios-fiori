import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct ObjectHeaderViewScenarios: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 6
        case 1, 2, 3, 4, 5:
            return 5
        default:
            return 0
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Page 5: Regular"
        case 1:
            return "Page 6: Regular(1)"
        case 2:
            return "Page 7: Regular(2)"
        case 3:
            return "Page 8: Regular(3)"
        case 4:
            return "Pages 16-18: IMAGE/ICON STACK"
        case 5:
            return "Pages 19-20: DESCRIPTION"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
//        let objectHeader = tableView.dequeueReusableCell(withIdentifier: ObjectHeaderViewTestCell.reuseIdentifier, for: indexPath) as! ObjectHeaderViewTestCell
//        let transformerLong: Test.Object = .transformerLong
//        objectHeader.isApplyingSplitPercent = false
//        objectHeader._innerView.backgroundColorScheme = backgroundColorScheme
//
//        let chart: FUIObjectHeaderChartView = FUIObjectHeaderChartView()
//        chart.isEnabled = false
//        chart.backgroundColorScheme = backgroundColorScheme
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
//            objectHeader.detailImage = Test.Object.transformer.detailImage?.glyphImage
//            objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Will Wrap Two Lines"
//            objectHeader.subheadlineText = "Job 819701"
//            objectHeader.bodyLabel.text = "Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention."
//            objectHeader.statusImage = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
//            objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
//            objectHeader.substatusText = "High Priority"
//            chart.title.text = "Temperature"
//            chart.subtitle.text = "20 min ago"
//            chart.chartView.series.strokeColors = [[UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)]]
//            chart.chartView.dataSource = Test.ChartCard.tempAndDollars.dataSeries
//
//            objectHeader._innerView.detailContentView = chart
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Will Wrap Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, bodyText: {
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
                    ChartView(ChartModel(chartType: .line,
                                         data: [[200, 170, 165, 143, 166, 82, 110]],
                                         titlesForCategory: [["Jan", nil, nil, nil, nil, nil, "Jul"]]))
                })
            })
            
            return AnyView(oh)
        
        case (0, 1):
//            objectHeader.detailImage = Test.Object.transformer.detailImage?.glyphImage
//            objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Will Wrap Two Lines"
//            objectHeader.subheadlineText = "Job 819701"
//            objectHeader.bodyLabel.text = "Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention."
//            objectHeader.statusText = "Very High Priority"
//            objectHeader.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
//            objectHeader._innerView.isContentCopyable = false
            
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Will Wrap Two Lines")
            }, subtitle: {
                Text("Job 819701")
            }, bodyText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negativeLabel))
            }, detailImage: {
                Image("attachment009").resizable()
            })
            
            return AnyView(oh)
            
        case (0, 2):
//            objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Two Lines Example"
//            objectHeader.subheadlineText = "Job 819701"
//            objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK"
//            objectHeader.footnoteLabel.text = "Due on 12/31/16"
//            objectHeader.statusText = "Very High Priority"
//            objectHeader.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
//            objectHeader.substatusText = "Scheduled"
//            objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
//            objectHeader.descriptionText = "Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention."
            
            /*
             let oh = ObjectHeader(title: {
                 Text("Inspect Electric Pump Motor Long Job Title Example Will Wrap Two Lines")
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
             */
 
            let oh = ObjectHeader(title: "Inspect Electric Pump Motor Long Job Title Example Will Wrap Two Lines",
                                  subtitle: "Job 819701",
                                  tags: ["Started", "PM01", "103-Repair"],
                                  bodyText: "1000-Hamburg, MECHANIK",
                                  footnote: "Due on 12/31/16",
                                  descriptionText: "Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days Urgent and need attention.",
                                  status: TextOrIcon.text("Very High Priority"),
                                  substatus: TextOrIcon.both("Time", Image(systemName: "clock")),
                                  detailContent: {}).environment(\.iconHorizontalAlignment, .trailing)
                .substatusStyle(.negativeLabel)
            
            return AnyView(oh)
        
        case (0, 3):
//            objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Two Lines Example"
//            objectHeader.subheadlineText = "Job 819701"
//            objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Functional Location"
//            objectHeader.footnoteLabel.text = "Due on 12/31/16"
//            objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
//
            let oh = ObjectHeader(title: "Inspect Electric Pump Motor Long Job Title Two Lines Example",
                                  subtitle: "Job 819701",
                                  tags: ["Started", "PM01", "103-Repair"],
                                  bodyText: "1000-Hamburg, MECHANIK Functional Location",
                                  footnote: "Due on 12/31/16",
                                  detailContent: {})
            
            return AnyView(oh)
            
        case (0, 4):
//            objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Accessibility Settings Testing"
//            objectHeader.subheadlineText = "Job 819701 Accessibility Settings Testing"
//            objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days."
//            objectHeader.statusImage = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
//            objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
//            objectHeader.substatusText = "Very High Priority"
        
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Accessibility Settings Testing")
            }, subtitle: {
                Text("Job 819701 Accessibility Settings Testing")
            }, descriptionText: {
                Text("Temperature sensor predicts overheating failure in 4 days Urgent and needs attention sensor predicts overheating failure in 4 days.")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Very High Priority")
            })
            
            return AnyView(oh)
            
        case (0, 5):
//            objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Accessibility Settings Testing"
//            objectHeader.subheadlineText = "Job 819701 Accessibility Settings Testing"
//            objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Long"
//            objectHeader.footnoteLabel.text = "Due on 12/31/16"
//            objectHeader.statusText = "Very High Priority"
//            objectHeader.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
//            objectHeader.substatusText = "Scheduled"
//            chart.title.text = "Temperature"
//            chart.subtitle.text = "20 min ago"
//            chart.trend.text = "11.5%"
//            chart.trendImage = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
//            chart.trendSemanticColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
//            let metric = FUIKPIMetricItem(string: "79")
//            let unit = FUIKPIUnitItem(string: "°F")
//            chart.kpiItems = [metric, unit]
//            objectHeader._innerView.detailContentView = chart
        
            let oh = ObjectHeader(title: {
                Text("Inspect Electric Pump Motor Long Job Title Example Accessibility Settings Testing")
            }, subtitle: {
                Text("Job 819701 Accessibility Settings Testing")
            }, bodyText: {
                Text("1000-Hamburg, MECHANIK Long")
            }, footnote: {
                Text("Due on 12/31/16")
            }, status: {
                Text("Very High Priority").foregroundColor(.preferredColor(.negativeLabel))
            }, substatus: {
                Text("Scheduled")
            }, detailContent: {
                HeaderChart(title: {
                    Text("Temperature")
                }, subtitle: {
                    Text("20 min ago")
                }, trend: {
                    Text("11.5%")
                }, trendImage: {
                    Image(systemName: "triangle.fill").foregroundColor(.preferredColor(.negativeLabel))
                }, kpi: {
                    _KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "")
                })
            })
            
            return AnyView(oh)
        /*
         case (1, 0):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK"
             objectHeader.footnoteText = "Due on 05/12/2018"
         
             chart.title.text = "Temperature"
             chart.subtitle.text = "20 min ago"
             chart.trend.text = "11.5%"
             chart.trendImage = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
             chart.trendSemanticColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             let dollars = FUIKPIUnitItem(string: "$")
             let metric = FUIKPIMetricItem(string: "8,888.8")
             let unit = FUIKPIUnitItem(string: "M")
             chart.kpiItems = [dollars, metric, unit]
             chart.chartView.dataSource = Test.ChartCard.tempAndDollars.dataSeries
             chart.isEnabled = false
             objectHeader._innerView.detailContentView = chart
             objectHeader.statusText = "High"
             objectHeader.statusLabel.textColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "Scheduled"
         case (1, 1):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK"
             objectHeader.footnoteText = "Due on 05/12/2018"
         
             chart.title.text = "Temperature"
             chart.subtitle.text = "20 min ago"
             chart.trend.text = "11.5%"
             chart.trendImage = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
             chart.trendSemanticColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             let dollars = FUIKPIUnitItem(string: "$")
             let metric = FUIKPIMetricItem(string: "8,888.8")
             let unit = FUIKPIUnitItem(string: "M")
             chart.kpiItems = [dollars, metric, unit]
             chart.chartView.dataSource = Test.ChartCard.tempAndDollars.dataSeries
             chart.isEnabled = false
             objectHeader._innerView.detailContentView = chart
         case (1, 2):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines"
             objectHeader.tags = ["Started"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Functional Location"
         
             let kpiView = FUIKPIView()
             let h = FUIKPIMetricItem(string: "6")
             let hh = FUIKPIUnitItem(string: "h")
             let m = FUIKPIMetricItem(string: "15")
             let mm = FUIKPIUnitItem(string: "m")
             kpiView.items = [h, hh, m, mm]
             kpiView.captionlabel.text = Utils.localizedString("Working Hours")
             objectHeader._innerView.detailContentView = kpiView
             kpiView.isEnabled = false
             kpiView.colorScheme = backgroundColorScheme
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "High"
         case (1, 3):
             objectHeader.headlineText = "Inspect Electric Pump Motor"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
         
             chart.title.text = "Total Sales Q2"
             chart.subtitle.text = "20 min ago"
             chart.trend.text = "11.5%"
             chart.trendImage = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
             chart.trendSemanticColor = UIColor.preferredFioriColor(forStyle: .positive, background: backgroundColorScheme)
         
             objectHeader._innerView.detailContentView = chart
         case (1, 4):
             objectHeader.headlineText = "Inspect Electric Pump Motor Two Lines Example"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Long"
             objectHeader.footnoteLabel.text = "Due on 12/31/16"
         
             chart.title.text = "Temperature"
             chart.subtitle.text = "20 min ago"
             chart.trend.text = "11.5%"
             chart.trendImage = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
             chart.trendSemanticColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             let dollars = FUIKPIUnitItem(string: "$")
             let metric = FUIKPIMetricItem(string: "8,888.88")
             let unit = FUIKPIUnitItem(string: "M")
             chart.kpiItems = [dollars, metric, unit]
             objectHeader._innerView.detailContentView = chart
         
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "High"
         case (2, 0):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Two Lines Example"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK"
             objectHeader.footnoteLabel.text = "Due on 12/31/16"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "Very High Priority"
         case (2, 1):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Wrapping Two Lines"
             objectHeader.subheadlineText = "Job Number 819701203855-really long number"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Functional Location that is very long"
             objectHeader.footnoteLabel.text = "Due on 12/31/16"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
         case (2, 2):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title  Example"
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK"
             objectHeader.footnoteLabel.text = "Due on 12/31/16"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days."
             objectHeader.statusText = "High"
             objectHeader.substatusLabel.text = "Scheduled"
         case (2, 3):
             objectHeader.headlineText = "Inspect Electric Pump Motor"
             objectHeader.subheadlineText = "Job Number 819701"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Functional Location Extra Long Text That Extends"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention.  Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention."
         case (2, 4):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Two Lines Example"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Long"
             objectHeader.footnoteText = "Due on 12/31/16"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "High"
         case (3, 0):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
             chart.title.text = "Total Sales Q2"
             chart.subtitle.text = "20 min ago"
             chart.trend.text = "11.5%"
             chart.trendImage = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
             chart.trendSemanticColor = UIColor.preferredFioriColor(forStyle: .positive, background: backgroundColorScheme)
         
             objectHeader._innerView.detailContentView = chart
         case (3, 1):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
             chart.title.text = "Temperature"
             chart.subtitle.text = "20 min ago"
             chart.chartView.dataSource = Test.ChartCard.tempAndDollars.dataSeries
             objectHeader._innerView.detailContentView = chart
         case (3, 2):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
             chart.title.text = "Temperature"
             chart.subtitle.text = "20 min ago"
             chart.chartView.dataSource = Test.ChartCard.tempAndDollars.dataSeries
             objectHeader._innerView.detailContentView = chart
             objectHeader.statusText = "High Priority"
         case (3, 3):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
             chart.title.text = "Total Sales Q2"
             chart.subtitle.text = "20 min ago"
             chart.trend.text = "11.5%"
             chart.trendImage = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
             chart.trendSemanticColor = UIColor.preferredFioriColor(forStyle: .positive, background: backgroundColorScheme)
             objectHeader._innerView.detailContentView = chart
         case (3, 4):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Wrapping Two Lines"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
             chart.title.text = "Temperature"
             chart.subtitle.text = "20 min ago"
             chart.chartView.dataSource = Test.ChartCard.tempAndDollars.dataSeries
             objectHeader._innerView.detailContentView = chart
             objectHeader.statusText = "Very High Priority"
         case (4, 0):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Functional Location"
             objectHeader.footnoteLabel.text = "Due on 05/12/2018"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "High"
         case (4, 1):
             objectHeader.headlineText = "Inspect Electric Pump Motor"
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "High Priority"
             objectHeader.descriptionLabel.text = "Temperature sensor predicts overheating failure in 4 days.  Urgent and needs attention sensor predicts overheating failure in 4 days.  Urgent and needs attention."
         case (4, 2):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Example Extending"
             objectHeader.subheadlineText = "Job 819701"
             chart.title.text = "Total Sales Q2"
             chart.subtitle.text = "20 min ago"
             let dollars = FUIKPIUnitItem(string: "$")
             let metric = FUIKPIMetricItem(string: "8,278.7")
             let unit = FUIKPIUnitItem(string: "USD")
             chart.kpiItems = [dollars, metric, unit]
             objectHeader._innerView.detailContentView = chart
         case (4, 3):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Will Not Truncate"
             objectHeader.subheadlineText = "Job Number 819701203855-really long number"
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Functional Location"
             objectHeader.footnoteLabel.text = "Due on 05/12/2018"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
         case (4, 4):
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Will Not Truncate"
             objectHeader.subheadlineText = "Job Number 819701203855-really long number"
             objectHeader.tags = ["Started", "PM01", "103-Repair"].map { return FUITag(stringLiteral: $0) }
             objectHeader.bodyLabel.text = "1000-Hamburg, MECHANIK Functional Location"
             objectHeader.footnoteText = "Due on 12/31/16"
         case (5, 0):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Inspect Electric Pump Motor Long Job Title Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "High Priority"
         case (5, 1):
             objectHeader.headlineText = "Inspect Electric Pump Motor"
             objectHeader.statusImageView.image = FUIIconLibrary.indicator.veryHighPriority.withRenderingMode(.alwaysTemplate)
             objectHeader.statusImageView.tintColor = UIColor.preferredFioriColor(forStyle: .negative, background: backgroundColorScheme)
             objectHeader.substatusLabel.text = "High Priority"
         case (5, 2):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Inspect Electric Pump Motor Long Job Title Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
         case (5, 3):
             objectHeader.headlineText = "Inspect Electric Pump Motor"
             objectHeader.subheadlineText = "Job Number 819701203855-really long number"
         case (5, 4):
             objectHeader.detailImageView.image = transformerLong.detailImage?.glyphImage
             objectHeader.headlineText = "Inspect Electric Pump Motor Long Job Title Wrapping Two Lines Inspect Electric Pump Motor Long Job Title Wrapping Two Lines"
             objectHeader.subheadlineText = "Job 819701"
             objectHeader.statusText = "High Priority"
             objectHeader.substatusLabel.text = "Ready"
             objectHeader.substatusLabel.textColor = UIColor.preferredFioriColor(forStyle: .positive, background: backgroundColorScheme)
             */
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor"))
        }
    }
}

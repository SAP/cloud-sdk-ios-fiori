import SwiftUI

/**
 SwiftUI View's wrapper for all charts

 ## Usage

 ```
 let model = ChartModel(chartType: .line,
            data: [[nil, 220, nil, 250, 200, nil, 230],
                   [160, nil, 130, 170, nil, 190, 180]],
            titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]
 )

  /// default no data view is shown if there is no data in model
  ChartView(model)
      .frame(width: 300, height: 200)
 
  /// create a chart view with customized no data view
  ChartView(self.info.1[i], noDataView: NoDataView {
      GeometryReader { proxy in
          VStack(alignment: .center) {
              Text("☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹")
              Text("Customized No Data View")
              Text("☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹☹")
          }
          .frame(width: proxy.size.width, height: proxy.size.height)
          .border(Color.primary, width: 1)
      }
  }).frame(width: 300, height: 200)
 
 ```
 */

public struct ChartView<Content: View>: View {
    @ObservedObject var chartModel: ChartModel
    
    /// a no data view is shown when there is no data in the chartModel
    let noDataView: NoDataView<Content>
    
    /**
     The constructor with a chart model and NoDataView

     - parameter chartModel: the chart model
     - parameter noDataView: this view will be shown if chartModel contains no data
     */
    public init(_ chartModel: ChartModel, noDataView: NoDataView<Content>) {
        self._chartModel = ObservedObject(initialValue: chartModel)
        self.noDataView = noDataView
    }
    
    public var body: some View {
        Group {
            if self.chartModel.data.isEmpty || self.chartModel.data.first?.isEmpty ?? true {
                self.noDataView
            } else if self.chartModel.chartType == .micro_bullet {
                BulletMicroChart(model: self.chartModel)
            } else if self.chartModel.chartType == .micro_harvey_ball {
                HarveyBallMicroChart(model: self.chartModel)
            } else if self.chartModel.chartType == .micro_radial {
                RadialMicroChart(model: self.chartModel)
            } else if self.chartModel.chartType == .micro_column {
                ColumnMicroChart(model: self.chartModel)
            } else if self.chartModel.chartType == .stock {
                StockMicroChart(model: self.chartModel)
            } else if self.chartModel.chartType == .donut {
                DonutChart(model: self.chartModel)
            } else if self.chartModel.chartType == .line {
                LineChart(model: self.chartModel)
            } else if self.chartModel.chartType == .area {
                AreaChart(model: self.chartModel)
            } else if self.chartModel.chartType == .column {
                ColumnChart(model: self.chartModel)
            } else if self.chartModel.chartType == .stackedColumn {
                StackedColumnChart(model: self.chartModel)
            } else if self.chartModel.chartType == .waterfall {
                WaterfallChart(model: self.chartModel)
            } else if self.chartModel.chartType == .combo {
                ComboChart(model: self.chartModel)
            } else if self.chartModel.chartType == .bar {
                BarChart(model: self.chartModel)
            } else if self.chartModel.chartType == .stackedBar {
                StackedBarChart(model: self.chartModel)
            } else if self.chartModel.chartType == .bubble {
                BubbleChart(model: self.chartModel)
            } else if self.chartModel.chartType == .scatter {
                ScatterChart(model: self.chartModel)
            } else {
                self.noDataView
            }
        }
    }
}

public extension ChartView where Content == EmptyView {
    /**
     The constructor with a chart model and a default NoDataView is used if there is no data

     - parameter chartModel: the chart model
     */
    init(_ chartModel: ChartModel) {
        self._chartModel = ObservedObject(initialValue: chartModel)
        self.noDataView = NoDataView()
    }
}

struct ChartSeriesShapeStyleEnvironmentKey: EnvironmentKey {
    static let defaultValue: [Int: AnyShapeStyle] = [:]
}

extension EnvironmentValues {
    var chartSeriesShapeStyle: [Int: AnyShapeStyle] {
        get {
            self[ChartSeriesShapeStyleEnvironmentKey.self]
        }
        
        set {
            self[ChartSeriesShapeStyleEnvironmentKey.self] = newValue
        }
    }
}

struct ChartCategoryShapeStyleEnvironmentKey: EnvironmentKey {
    static let defaultValue: [Int: [Int: AnyShapeStyle]] = [:]
}

extension EnvironmentValues {
    var chartCategoryShapeStyle: [Int: [Int: AnyShapeStyle]] {
        get {
            self[ChartCategoryShapeStyleEnvironmentKey.self]
        }
        
        set {
            self[ChartCategoryShapeStyleEnvironmentKey.self] = newValue
        }
    }
}

public extension View {
    /**
     Set ShapeStyle for chart series
     
     - parameter value: the dictionary is [Series Index: AnyShapeSyle].
        Key is the chart series index, Value "AnyShapeSyle" should be one of these ShapeStyle: LinearGradient, AngularGradient, RadialGradient, Color and ImagePaint. The startPoint and endPoint in LinearGradient are in the view's user space. The image in ImagePaint should not be a vector image.
     - return:  A shape filled with the color or gradient you supply.
     
     ## Usage

     ```
     let linearGradient = LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .bottom, endPoint: .top)
     
     .chartSeriesShapeStyle([1: AnyShapeStyle(linearGradient)])
     */
    func chartSeriesShapeStyle(_ value: [Int: AnyShapeStyle]) -> some View {
        environment(\.chartSeriesShapeStyle, value)
    }
    
    /**
        Set ShapeStyle for chart categories
     
     - parameter value: the dictionary is [Series Index: [Category Index: AnyShapeSyle]].
        Value "AnyShapeSyle" should be one of these ShapeStyle: LinearGradient, AngularGradient, RadialGradient, Color and ImagePaint. The startPoint and endPoint in LinearGradient are in local user space. The image in ImagePaint should not be a vector image.
     - return:  A shape filled with the color or gradient you supply.
     
     ## Usage

     ```
     let linearGradient = LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .bottom, endPoint: .top)
     let angularGradient = AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: UnitPoint(x: 0.50, y: 1.00), startAngle: Angle(degrees: 180.00), endAngle: Angle(degrees: 360.00))
     let radialGradient = RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink]), center: .center, startRadius: 0, endRadius: 50)
     let imagePaint = ImagePaint(image: Image("flower"))
     
     .chartCategoryShapeStyle([0: [0: AnyShapeStyle(linearGradient), 1: AnyShapeStyle(Color.yellow), 2: AnyShapeStyle(angularGradient)],
                               1: [3: AnyShapeStyle(radialGradient), 4: AnyShapeStyle(imagePaint)]])
     */
    func chartCategoryShapeStyle(_ value: [Int: [Int: AnyShapeStyle]]) -> some View {
        environment(\.chartCategoryShapeStyle, value)
    }
}

enum ChartViewLayout {
    /// Minimum: 20px from left edge of content area
    static let minYAxisViewWidth: CGFloat = 20
    
    /// Maximum Y Axis Width: 35% of content area
    static let maxYAxisViewWidthRatio: CGFloat = 0.35
    
    /// when the y-axis label area its at its maximum width and values are still truncated, the user can double tap the y-axis label area to expand the y-axis label area to the right. This will increase the width of the labels up to 60% of the content area.
    static let maxExpandedYAxisViewWidthRatio: CGFloat = 0.60
    
    /// Maximum secondary Y Axis Width: 20% of content area
    static let maxSecondaryYAxisViewWidthRatio: CGFloat = 0.20
    
    /// The minimum spacing bwteen y axis labels and baseline
    static let minSpacingBtwYAxisLabelAndBaseline: CGFloat = 3
    
    /// The minimum spacing between y-axis gridline labels is 3px
    static let minSpacingBtwYAxisLabels: CGFloat = 3
    
    /// A minimum of 4px padding is present on both the left and right of the x axis label if the text labels come in closely.
    static let minSpacingBtwXAxisLabels: CGFloat = 4
    
    /// Extra diameter width for selected point in line/area chart
    static let extraSelectedPointRadiusWidth: CGFloat = 2.5
    
    /// Extra white border radius width around selected point in line/area chart
    static let extraSelectedPointWhiteBoderRadiusWidth: CGFloat = 2
    
    /// Minimum unit width
    static let minUnitWidth: CGFloat = 0.0000000001
    
    ///
    static let minDataWidth: CGFloat = 20
    
    ///
    static let columnGapFraction: CGFloat = 0.333333
}

struct FUIChartView_Previews: PreviewProvider {
    static var previews: some View {
        let model1 = ChartModel(chartType: .line,
                                data: [[200, 170, 165, 143, 166, 112, 110],
                                       [150, 120, 130, 135, 120, 138, 137]],
                                titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])

        return Group {
            ChartView(model1)
                .frame(width: 300, height: 200)
        }
        .previewLayout(.sizeThatFits)
    }
}

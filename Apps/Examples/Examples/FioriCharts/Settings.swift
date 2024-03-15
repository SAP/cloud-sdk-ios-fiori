import FioriCharts
import SwiftUI

struct Settings: View {
    @EnvironmentObject var model: ChartModel
    @Binding var seriesShapeStyleEnable: Bool
    @Binding var categoryShapeStyleEnable: Bool
    
    var body: some View {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 0
        
        return NavigationView {
            Form {
                NavigationLink("Selection", destination: SettingsSelection(model: self.model))
                
                NavigationLink("Series Collection", destination: SettingsSeriesCollection())
                
                if self.model.colorsForCategory.count > 0 {
                    NavigationLink("Color for categories", destination: SettingsColorForCategory(model: self.model))
                } else {
                    Text("Color for categories: 0")
                }
                
                Section(header: Text("Axis")) {
                    NavigationLink(destination: SettingsCategoryAxis(axis: self.$model.categoryAxis)) {
                        Text("Category Axis")
                    }
                    
                    NavigationLink(destination: SettingsAxis(axis: self.$model.numericAxis)) {
                        Text("Numeric Axis")
                    }
                    
                    NavigationLink(destination: SettingsAxis(axis: self.$model.secondaryNumericAxis)) {
                        Text("Secondary Numeric Axis")
                    }
                    
                    Text("Number of Gridlines: \(nf.string(from: NSNumber(value: Double(self.model.numberOfGridlines))) ?? "")")
                    Slider(value: self.$model.numberOfGridlines.double, in: -1 ... 30, step: 1)
                    
                    Picker(selection: self.$model.xAxisLabelsPosition, label: Text("X Axis Labels Position")) {
                        Text("Dynamic").tag(XAxisLabelsPosition.dynamic)
                        Text("Fixed bottom").tag(XAxisLabelsPosition.fixedBottom)
                    }
                }
                
                if self.model.chartType == .stock || self.model.chartType == .line || self.model.chartType == .area || self.model.chartType == .combo || self.model.chartType == .waterfall {
                    Section(header: Text("Index Set")) {
                        if self.model.chartType == .stock {
                            Stepper("Index of Stock Series: \(self.model.indexOfStockSeries)", onIncrement: {
                                self.model.indexOfStockSeries = (self.model.indexOfStockSeries + 1) % max(1, self.model.numOfSeries())
                            }, onDecrement: {
                                self.model.indexOfStockSeries = (self.model.indexOfStockSeries - 1 + self.model.numOfSeries()) % max(1, self.model.numOfSeries())
                            })
                        }
                        
                        if self.model.chartType == .line || self.model.chartType == .area || self.model.chartType == .combo {
                            NavigationLink(destination: SettingsIndexSet(indexSet: self.$model.indexesOfSecondaryValueAxis, num: self.model.numOfSeries())) { Text("Indexes Of Secondary Value Axis:")
                            }
                        }
                        
                        if self.model.chartType == .combo {
                            NavigationLink(destination: SettingsIndexSet(indexSet: self.$model.indexesOfColumnSeries, num: self.model.numOfSeries())) { Text("Indexes Of Column Series")
                            }
                        }
                        
                        if self.model.chartType == .waterfall {
                            NavigationLink(destination: SettingsIndexSet(indexSet: self.$model.indexesOfTotalsCategories, num: self.model.numOfCategories(in: 0))) { Text("Indexes Of Totals Categoriess")
                            }
                        }
                    }
                }
                
                Section(header: Text("ShapeStyle")) {
                    Toggle("Series ShapeStyle", isOn: self.$seriesShapeStyleEnable)
                    Toggle("Category ShapeStyle", isOn: self.$categoryShapeStyleEnable)
                }
            }.navigationBarTitle("Configuration")
        }
    }
}

extension Int {
    var double: Double {
        get { Double(self) }
        set { self = Int(newValue) }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(seriesShapeStyleEnable: .constant(false), categoryShapeStyleEnable: .constant(false))
            .environmentObject(Tests.stockModels[0])
    }
}

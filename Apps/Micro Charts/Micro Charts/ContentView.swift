//
//  ContentView.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/2/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI
import FioriCharts

struct ContentView: View {
    var body: some View {
        //        ChartView(Tests.stockModels[1]).frame(height: 200)
        NavigationView {
            List(Tests.allCases) { model in
                NavigationLink(destination: DetailView(model: model)) {
                    ChartView(model).frame(height: 200)
                }
            }.navigationBarTitle("Micro Charts")
        }
    }
}

struct DetailView: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width <= geometry.size.height {
                VStack(spacing: 0) {
                    ChartView(self.model).padding()
                        .frame(height: geometry.size.height / 2)
                    
                    Divider().edgesIgnoringSafeArea(.all)
                    Text("Configuration").font(.headline).padding()
                    SettingView(model: self.model)
                }
            }
            else {
                HStack(spacing: 0) {
                    ChartView(self.model).padding()
                        .frame(width: geometry.size.width / 2)
                    
                    Divider().edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        Text("Configuration").font(.headline).padding()
                        SettingView(model: self.model)
                    }
                }
            }
        }.navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct SettingView: View {
    @ObservedObject var model: ChartModel
    let colors: [Color] = [.red, .green, .blue, .pink, .orange, .black, .gray]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Misc")) {
                    VStack{
                        HStack {
                            Text("Enable User Interaction")
                            Spacer()
                            Toggle(isOn: $model.userInteractionEnabled) {
                                Text(" ")
                            }
                        }
                        HStack {
                            Text("Pan chart to data point only")
                            Spacer()
                            Toggle(isOn: $model.panChartToDataPointOnly) {
                                Text(" ")
                            }
                        }
                    }
                }
                
                Section(header: Text("Series Selection").font(.subheadline)) {
                    VStack(alignment: .leading) {
                        Stepper("Series Index: \(self.model.currentSeriesIndex)", onIncrement: {
                            self.model.selectedSeriesIndex = (self.model.currentSeriesIndex + 1) % self.model.data.count
                            self.model.scale = 1.0
                            self.model.startPos = 0
                        }, onDecrement:  {
                            self.model.selectedSeriesIndex = (self.model.currentSeriesIndex - 1 + self.model.data.count) % self.model.data.count
                            self.model.scale = 1.0
                            self.model.startPos = 0
                        })
                    }
                }
                
                Section(header: Text("Scale").font(.subheadline)) {
                    VStack(alignment: .leading) {
                        Text("Scale: \(model.scale)")
                        Slider(value: $model.scale, in: 1...max(1.1, CGFloat(model.data[model.currentSeriesIndex].count - 1) / 2), step: 0.1) { (changed) in
                            if (changed) {
                                self.model.startPos = 0
                            }
                        }

                        Text("Start Position: \(model.startPos)")

//                        Stepper("Start Position: \(self.model.startPos)", onIncrement: {
//                            self.model.startPos += 10
//                        }, onDecrement: {
//                            self.model.startPos = max(0, self.model.startPos - 10)
//                        })
                    }
                }
                
                Section(header: Text("Category Axis Attributes")) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Is zero based")
                            Spacer()
                            Toggle(isOn: $model.categoryAxis.isZeroBased) {
                                Text(" ")
                            }
                        }
                        
                        Text("Baseline width: \(model.categoryAxis.baseline.width)")
                        Slider(value: $model.categoryAxis.baseline.width, in: 1...5, step: 1)
                        Picker(selection: $model.categoryAxis.baseline.color, label: Text("Baseline color: ")) {
                            Text("red").tag(Color.red)
                            Text("green").tag(Color.green)
                            Text("blue").tag(Color.blue)
                        }
                        
                        Text("Gridlines width: \(model.categoryAxis.gridlines.width)")
                        Slider(value: $model.categoryAxis.gridlines.width, in: 1...5, step: 1)
                        Picker(selection: $model.categoryAxis.gridlines.color, label: Text("Gridlines color: ")) {
                            Text("red").tag(Color.red)
                            Text("green").tag(Color.green)
                            Text("blue").tag(Color.blue)
                        }
    
                    }
                }
                
                Section(header: Text("Numeric Axis Attributes")) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Is zero based")
                            Spacer()
                            Toggle(isOn: $model.numericAxis.isZeroBased) {
                                Text(" ")
                            }
                        }
                        
                        Text("Baseline width: \(model.numericAxis.baseline.width)")
                        Slider(value: $model.numericAxis.baseline.width, in: 1...5, step: 1)
                        Picker(selection: $model.numericAxis.baseline.color, label: Text("Baseline color: ")) {
                            Text("red").tag(Color.red)
                            Text("green").tag(Color.green)
                            Text("blue").tag(Color.blue)
                        }
                        
                        Text("Gridlines width: \(model.numericAxis.gridlines.width)")
                        Slider(value: $model.numericAxis.gridlines.width, in: 1...5, step: 1)
                        Picker(selection: $model.numericAxis.gridlines.color, label: Text("Gridlines color: ")) {
                            Text("red").tag(Color.red)
                            Text("green").tag(Color.green)
                            Text("blue").tag(Color.blue)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


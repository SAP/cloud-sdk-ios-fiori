import FioriCharts
import SwiftUI

struct SettingsSelection: View {
    @ObservedObject var model: ChartModel
    @State var textScaleX: String
    @State var textScaleY: String
    @State var textPositionX: String
    @State var textPositionY: String
    
    init(model: ChartModel) {
        self.model = model
        
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        
        self._textScaleX = State(initialValue: nf.string(from: NSNumber(value: Double(model.scaleX))) ?? "1.0")
        self._textScaleY = State(initialValue: nf.string(from: NSNumber(value: Double(model.scaleY))) ?? "1.0")
        
        let point = model.centerPosition == nil ? CGPoint(x: 0.5, y: 0.5) : model.centerPosition!
        self._textPositionX = State(initialValue: nf.string(from: NSNumber(value: Double(point.x))) ?? "0.5")
        self._textPositionY = State(initialValue: nf.string(from: NSNumber(value: Double(point.y))) ?? "0.5")
    }
    
    var body: some View {
        Form {
            Section(header: Text("Main Switch")) {
                Toggle(isOn: self.$model.userInteractionEnabled) {
                    Text("User Interaction Enabled")
                }
            }
            
            Section(header: Text("Zoom")) {
                Toggle(isOn: self.$model.scaleXEnabled, label: {
                    Text("Scale X Enabled")
                })
                
                Toggle(isOn: self.$model.scaleYEnabled, label: {
                    Text("Scale Y Enabled")
                })
                
                Toggle(isOn: self.$model.readableScaleEnabled, label: {
                    Text("Readable Scale Enabled")
                })
                
                HStack(alignment: .center) {
                    Text("Scale X: ")
                    
                    TextField("", text: self.$textScaleX, onCommit: {
                        var value: CGFloat = 1
                        if let n = NumberFormatter().number(from: self.textScaleX) {
                            value = CGFloat(truncating: n)
                        }
                        
                        self.model.scaleX = value
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack(alignment: .center) {
                    Text("Scale Y: ")
                    
                    TextField("", text: self.$textScaleY, onCommit: {
                        var value: CGFloat = 1
                        if let n = NumberFormatter().number(from: self.textScaleY) {
                            value = CGFloat(truncating: n)
                        }
                        
                        self.model.scaleY = value
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            
            Section(header: Text("Pan")) {
                HStack(alignment: .center) {
                    Text("Pivot X: \(self.model.centerPosition?.x ?? 0.5)")
                    
                    TextField("", text: self.$textPositionX, onCommit: {
                        var point = CGPoint(x: 0.5, y: 0.5)
                        if let pt = self.model.centerPosition {
                            point = pt
                        }
                        
                        if let n = NumberFormatter().number(from: self.textPositionX) {
                            point.x = CGFloat(truncating: n)
                        }
                        
                        if let n = NumberFormatter().number(from: self.textPositionY) {
                            point.y = CGFloat(truncating: n)
                        }
                        
                        self.model.centerPosition = point
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack(alignment: .center) {
                    Text("Pivot Y: \(self.model.centerPosition?.y ?? 0.5)")
                    
                    TextField("", text: self.$textPositionY, onCommit: {
                        var point = CGPoint(x: 0.5, y: 0.5)
                        if let pt = self.model.centerPosition {
                            point = pt
                        }
                        
                        if let n = NumberFormatter().number(from: self.textPositionX) {
                            point.x = CGFloat(truncating: n)
                        }
                        
                        if let n = NumberFormatter().number(from: self.textPositionY) {
                            point.y = CGFloat(truncating: n)
                        }
                        
                        self.model.centerPosition = point
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Toggle(isOn: self.$model.snapToPoint) {
                    Text("Snap to point only")
                }
            }
            
            Section(header: Text("Selection")) {
                Toggle(isOn: self.$model.selectionEnabled, label: {
                    Text("Selection Enabled")
                })
                
                Picker(selection: self.$model.selectionMode, label: Text("Selection Mode")) {
                    Text("Single").tag(ChartSelectionMode.single)
                    Text("All").tag(ChartSelectionMode.all)
                    Text("Multiple").tag(ChartSelectionMode.multiple)
                }
            }
        }
    }
}

struct SettingsSelection_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSelection(model: Tests.stockModels[0])
    }
}

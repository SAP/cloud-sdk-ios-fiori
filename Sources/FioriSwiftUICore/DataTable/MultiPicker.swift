import Foundation
import SwiftUI

struct MultiPicker: View {
    typealias Label = String
    typealias Entry = String
    
    let data: [(Label, [Entry])]
    @State var selections: [Int]
    let rect: CGRect
    @EnvironmentObject var layoutManager: TableLayoutManager
    
    init(_ rect: CGRect, data: [(Label, [Entry])], selections: [Int]) {
        self.data = data
        self._selections = State(initialValue: selections)
        self.rect = rect
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    withAnimation {
                        DispatchQueue.main.async {
                            self.layoutManager.model.isShowingPicker = false
                        }
                        resumeTableOffset()
                    }
                }) {
                    HStack {
                        Text("Cancel")
                            .padding(.horizontal, 16)
                    }
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        DispatchQueue.main.async {
                            self.layoutManager.model.isShowingPicker = false
                            self.layoutManager.model.currentPicker?.selections = self.selections
                            if let didChangeHandler = self.layoutManager.model.currentPicker?.valueDidChange {
                                didChangeHandler(self.selections)
                            }
                        }
                        resumeTableOffset()
                    }
                }) {
                    HStack {
                        Text("Done")
                            .padding(.horizontal, 16)
                    }
                }
            }
            .padding([.top, .bottom], 13)
            Divider()
            HStack {
                ForEach(0 ..< self.data.count, id: \.self) { column in
                    Picker(self.data[column].0, selection: self.$selections[column]) {
                        ForEach(0 ..< self.data[column].1.count, id: \.self) { row in
                            Text(verbatim: self.data[column].1[row])
                                .tag(self.data[column].1[row])
                        }
                    }
                    .frame(width: self.rect.width / CGFloat(self.data.count), height: TableViewLayout.pickerHeight)
                    .pickerStyle(WheelPickerStyle())
                    .clipped()
                }
            }
        }
        .frame(width: self.rect.width, height: 244)
    }
    
    func resumeTableOffset() {
        if self.layoutManager.model.inlineEditingCell != nil {
            self.layoutManager.model.inlineEditingCell = nil
        }
        
        if !self.layoutManager.model.shouldMoveupTable {
            return
        }
        self.layoutManager.model.shouldMoveupTable = false
        withAnimation(.easeInOut) {
            self.layoutManager.model.offsetForTable = 0
        }
    }
}

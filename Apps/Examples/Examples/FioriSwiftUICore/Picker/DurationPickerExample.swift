import FioriSwiftUICore
import SwiftUI

struct DurationPickerExample: View {
    @State var dateSelection = Date()
    
    var body: some View {
        List {
            HStack {
                Spacer()
                DurationPicker(0, minuteInterval: 4)
            }
            
            HStack {
                Spacer()
                DatePicker("System Date Picker", selection: $dateSelection, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }
            
            HStack {
                DurationPicker(145, minuteInterval: 2)
                Spacer()
            }
            
            HStack {
                DatePicker("System Date Picker", selection: $dateSelection, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Spacer()
            }
            
            HStack {
                Spacer()
                DurationPicker(0, minuteInterval: 7)
                Spacer()
            }
            
            HStack {
                Spacer()
                DatePicker("System Date Picker", selection: $dateSelection, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Spacer()
            }
            
            HStack {
                Spacer()
                DurationPicker(0, minuteInterval: 4)
            }
            
            HStack {
                DurationPicker(145, minuteInterval: 2)
                Spacer()
            }
            
            HStack {
                Spacer()
                DurationPicker(0, minuteInterval: 7)
                Spacer()
            }
            HStack {
                Spacer()
                DatePicker("System Date Picker", selection: $dateSelection, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Spacer()
            }
        }
    }
}

struct DurationPickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DurationPickerExample()
    }
}

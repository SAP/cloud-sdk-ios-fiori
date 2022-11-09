import FioriThemeManager
import SwiftUI

public struct DurationPicker: View {
    var hours = [Int](0 ... 23).map { $0.description }
    var minutes: [String]
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var selections: [Int]
    @State var showPicker: Bool = false
    
    /**
     The default value is 0.0. Limit is 23:59 (1439 minutes).
     */
    var initialDuration: Int = 0
    
    /**
     `minuteInterval` must be evenly divided into 60.

     Default is 5. minimum is 1, maximum is 30.
     */
    var minuteInterval: Int
    
    /// Duration Picker Initialization
    public init() {
        self.init(0, minuteInterval: 5)
    }
    
    /// Duration Picker Initialization
    /// - Parameter initialDuration: Picker initial duration, range between 0...1439 miniutes.
    public init(_ initialDuration: Int) {
        self.init(initialDuration, minuteInterval: 5)
    }
    
    /// Duration Picker Initialization
    /// - Parameter minuteInterval: Interval for picker minutes.
    public init(minuteInterval: Int) {
        self.init(0, minuteInterval: minuteInterval)
    }
    
    /// Duration Picker Initialization
    /// - Parameters:
    ///   - initialDuration: Picker initial duration, range between 0...1439 miniutes.
    ///   - minuteInterval: Interval for picker minutes.
    public init(_ initialDuration: Int, minuteInterval: Int) {
        self.initialDuration = initialDuration
        self.minuteInterval = minuteInterval
        
        let hour = min(Int(initialDuration / 60), 23)
        let minute = Int(initialDuration % 60)
        self.minutes = Array(stride(from: 0, to: 59, by: minuteInterval)).map { $0.description }
        _selections = State(initialValue: [hour, minute])
    }
    
    /// :nodoc
    public var body: some View {
        Button {
            showPicker.toggle()
        } label: {
            Text("\(hours[selections[0]])Hrs \(minutes[selections[1]])Min")
        }
        .buttonStyle(DatePickerButtonStyle(isSelected: $showPicker))
        .cornerRadius(8)
        .popover($showPicker, popView: {
            PickerViewWrapper(dataSource: [hours, minutes],
                              selections: $selections)
                .frame(width: 232, height: 204)
                .background(Color.preferredColor(.primaryBackground))
                .foregroundColor(Color.preferredColor(.primaryLabel))
                .cornerRadius(18)
                .shadow(color: Color.black.opacity(0.2), radius: 5)
                .shadow(color: Color.black.opacity(0.15), radius: 20)
        })
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            showPicker = false
        }
    }
}

struct DurationPicker_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DurationPicker()
        }
    }
}

struct DatePickerButtonStyle: ButtonStyle {
    @Binding var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        let color: Color
        if self.isSelected {
            color = Color.preferredColor(.tintColor)
        } else {
            color = Color.preferredColor(.primaryLabel)
        }
        return configuration.label
            .foregroundColor(configuration.isPressed ? color.opacity(0.5) : color)
            .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))
    }
}

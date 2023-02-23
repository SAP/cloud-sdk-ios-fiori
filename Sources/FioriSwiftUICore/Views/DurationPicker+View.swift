import FioriThemeManager
import SwiftUI

extension DurationPicker: View {
    public var body: some View {
        DurationPickerViewWrapper(selection: _selection, maximumMinutes: _maximumMinutes, minimumMinutes: _minimumMinutes, minuteInterval: _minuteInterval, measurementFormatter: _measurementFormatter)
            .frame(width: 232, height: 204)
            .background(Color.preferredColor(.primaryBackground))
            .foregroundColor(Color.preferredColor(.primaryLabel))
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.2), radius: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 20)
    }
    
    /// Measurement formatter for duration picker.
    /// - Parameter measurementFormatter: measurement formatter you wanted for picker titles.
    /// - Returns: return a new duration picker with the measurement formatter.
    public func measurementFormatter(_ measurementFormatter: MeasurementFormatter) -> Self {
        var newSelf = self
        newSelf._measurementFormatter = measurementFormatter
        return newSelf
    }
}

@available(iOS 14.0, macOS 11.0, *)
struct DurationPickerLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(DurationPicker(selection: .constant(0)),
                    category: .control)
    }
}

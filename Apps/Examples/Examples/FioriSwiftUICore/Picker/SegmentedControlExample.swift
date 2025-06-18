import FioriSwiftUICore
import Foundation
import SwiftUI

struct SegmentedControlExample: View {
    var segments: [AttributedString] = ["Segment 1", "Segment 2", "Segment 3"]
    @State var selectedIndex: Int = 0
    @State private var _isCustomStyle = false

    struct CustomStyle: SegmentedControlPickerStyle {
        func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
            let appearance = UISegmentedControl.appearance()
            appearance.selectedSegmentTintColor = UIColor.systemIndigo
            appearance.backgroundColor = UIColor.systemPurple
            appearance.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.preferredFioriFont(forTextStyle: .body, weight: .bold)], for: .selected)
            appearance.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.preferredFioriFont(forTextStyle: .body)], for: .normal)
            
            return SegmentedControlPicker(configuration)
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color.blue, lineWidth: 3)
                )
        }
    }
    
    var body: some View {
        VStack {
            Toggle("Custom style", isOn: self.$_isCustomStyle).padding()
            Spacer()
            if self._isCustomStyle {
                SegmentedControlPicker(options: self.segments, selectedIndex: self.$selectedIndex).segmentedControlPickerStyle(CustomStyle())
                    .shadow(visibility: false)
                    .onDisappear {
                        // Reset the appearance when it disappears. Otherwise, the style will affect other views using UISegmentedControl
                        let appearance = UISegmentedControl.appearance()
                        appearance.selectedSegmentTintColor = nil
                        appearance.backgroundColor = .systemBackground
                        UISegmentedControl.appearance().setTitleTextAttributes(nil, for: .normal)
                        UISegmentedControl.appearance().setTitleTextAttributes(nil, for: .selected)
                    }
            } else {
                SegmentedControlPicker(options: self.segments, selectedIndex: self.$selectedIndex)
            }
            Spacer()
        }
    }
}
    
struct SegmentedControlExample_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlExample()
    }
}

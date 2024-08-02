import FioriSwiftUICore
import Foundation
import SwiftUI

struct SegmentedControlExample: View {
    var segments: [AttributedString] = ["Segment 1", "Segment 2", "Segment 3"]
    @State var selectedIdx1: Int = 0
    
    var body: some View {
        SegmentedControlPicker(options: self.segments, selectedIndex: self.$selectedIdx1)
    }
}
    
struct SegmentedControlExample_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlExample()
    }
}

import FioriSwiftUICore
import SwiftUI

public struct PercentageCaptionOutside: View {
    public var body: some View {
        VStack(alignment: .center) {
            let percentData = KPIItemData.percent(0.65)
            KPIProgressItem(footnote: "Loooooooong footnote", data: .constant(percentData))
            KPIProgressItem(footnote: "Completed", data: .constant(percentData), chartSize: .small)
        }
    }
}

import FioriSwiftUICore
import SwiftUI

public struct PercentageDisabled: View {
    public var body: some View {
        VStack(alignment: .center) {
            let percentData = KPIItemData.percent(0.65)
            KPIProgressItem(footnote: "Completed", data: .constant(percentData))
                .disabled(true)
            KPIProgressItem(kpiCaption: "Completed", data: .constant(percentData), chartSize: .small)
                .disabled(true)
        }
    }
}

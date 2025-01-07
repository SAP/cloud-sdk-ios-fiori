import FioriSwiftUICore
import SwiftUI

public struct PercentageCaptionInside: View {
    public var body: some View {
        VStack(alignment: .center) {
            let percentData = KPIItemData.percent(0.65)
            KPIProgressItem(kpiCaption: "Completed", data: .constant(percentData))
            KPIProgressItem(kpiCaption: "Completed", data: .constant(percentData), chartSize: .small)
        }
    }
}

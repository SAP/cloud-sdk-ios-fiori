import FioriSwiftUICore
import SwiftUI

public struct PercentageNoCaption: View {
    public var body: some View {
        VStack(alignment: .center) {
            let percentData = KPIItemData.percent(0.65)
            KPIProgressItem(data: .constant(percentData))
            KPIProgressItem(data: .constant(percentData), chartSize: .small)
        }
    }
}

import FioriSwiftUICore
import SwiftUI

public struct FractionDisabled: View {
    var numberFormatterProvider: NumberFormatterProvider
    
    public var body: some View {
        VStack(alignment: .center) {
            let fractionData = KPIItemData.fraction(76, 90, self.numberFormatterProvider.numberFormatter)
            KPIProgressItem(kpiCaption: "Completed", data: .constant(fractionData))
                .disabled(true)
            KPIProgressItem(footnote: "Completed", data: .constant(fractionData), chartSize: .small)
                .disabled(true)
        }
    }
}

import FioriSwiftUICore
import SwiftUI

public struct FractionCaptionOutside: View {
    var numberFormatterProvider: NumberFormatterProvider
    
    public var body: some View {
        VStack(alignment: .center) {
            let fractionData = KPIItemData.fraction(76, 90, self.numberFormatterProvider.numberFormatter)
            KPIProgressItem(footnote: "Completed", data: .constant(fractionData))
            KPIProgressItem(footnote: "Loooooooong footnote", data: .constant(fractionData), chartSize: .small)
        }
    }
}

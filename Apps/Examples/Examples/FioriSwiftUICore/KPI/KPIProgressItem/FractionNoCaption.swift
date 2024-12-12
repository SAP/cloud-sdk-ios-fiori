import FioriSwiftUICore
import SwiftUI

public struct FractionNoCaption: View {
    var numberFormatterProvider: NumberFormatterProvider

    public var body: some View {
        VStack(alignment: .center) {
            let fractionData = KPIItemData.fraction(76, 90, self.numberFormatterProvider.numberFormatter)
            KPIProgressItem(data: .constant(fractionData))
            KPIProgressItem(data: .constant(fractionData), chartSize: .small)
        }
    }
}

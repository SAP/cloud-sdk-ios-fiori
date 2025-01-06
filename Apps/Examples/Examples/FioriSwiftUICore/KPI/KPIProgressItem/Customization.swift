import FioriSwiftUICore
import SwiftUI

public struct Customization: View {
    var numberFormatterProvider: NumberFormatterProvider
    
    public var body: some View {
        VStack(alignment: .center) {
            let fractionData = KPIItemData.fraction(40, 90, self.numberFormatterProvider.numberFormatter)
            KPIProgressItem(
                kPIContent: {
                    Text("46/90")
                        .foregroundStyle(Color.yellow)
                        .font(.system(size: 36.0))
                },
                footnote: "Completed",
                data: .constant(fractionData)
            )
            .footnoteStyle(content: { config in
                config.footnote.foregroundStyle(Color.yellow)
            })
            .outerCircleStyle(content: { config in
                config.outerCircle.overlay {
                    Circle()
                        .stroke(lineWidth: 6)
                        .foregroundColor(Color.white)
                }
            })
            .innerCircleStyle(content: { _ in
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.green)
            })
        }
    }
}

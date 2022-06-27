import FioriSwiftUICore
import SwiftUI

public struct KPIExample: View {
    let mf: MeasurementFormatter = {
        let mf = MeasurementFormatter()
        mf.unitStyle = .short
        mf.unitOptions = .providedUnit
        return mf
    }()

    let df: DateComponentsFormatter = {
        let df = DateComponentsFormatter()
        df.maximumUnitCount = 2
        df.allowedUnits = [.day, .hour, .minute, .second]
        df.unitsStyle = .abbreviated
        return df
    }()
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 16) {
            KPIItem(data: .components([.unit("$"), .metric("121.98"), .unit("USD")]), subtitle: "Average Spending", action: { print("KPI tapped") })
                .subtitleModifier { content in
                    content
                        .foregroundColor(.yellow)
                        .font(.caption)
                }
            KPIItem(data: .components([.unit("$"), .metric("999,999.98"), .unit("USD")]), subtitle: "Very Very Very Very Very Very Very Very Very Very Long Subtitle")
                .disabled(true)
            KPIItem(data: .measure(Measurement(value: 200.50, unit: UnitMass.kilograms), mf), subtitle: "Current Weight")
            KPIItem(data: .percent(0.695), subtitle: "Acceptance Rate")
                .disabled(true)
            KPIItem(data: .duration(92000, df), subtitle: "Working Hours")
            KPIItem(data: .components([.metric("888,888"), .unit("mi")]), subtitle: "In Store Purchase With a Label That is Two Lines")
                .disabled(true)
            KPIItem(data: .components([.icon(Image(systemName: "heart.fill")), .metric("2K"), .icon(Image(systemName: "hand.thumbsup")), .metric("7.5K")]), subtitle: "Likes & Thumbs-Up")
        }
    }
}

struct KPIPreview: PreviewProvider {
    static var previews: some View {
        Group {
            KPIExample()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .previewDisplayName("iPhone 12")
        }
    }
}

import FioriSwiftUICore
import SwiftUI

public struct KPIProgressExample: View {
    let nf: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    
    public init() {}
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 16) {
                KPIProgressItem(data: .percent(0.88), subtitle: "Completed")
                KPIProgressItem(data: .percent(0.75), subtitle: "Long Long Long Completed")
                KPIProgressItem(data: .percent(0.66), footnote: "Completed")
                KPIProgressItem(data: .percent(0.45), footnote: "Very Long Long Long Long Completed")
                KPIProgressItem(data: .fraction(76, 90, nf), subtitle: "Completed")
                KPIProgressItem(data: .fraction(76000, 90000, nf), subtitle: "Long Long Long Completed")
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        })
    }
}

struct KPIProgressPreview: PreviewProvider {
    static var previews: some View {
        Group {
            KPIProgressExample()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .previewDisplayName("iPhone 12")
        }
    }
}

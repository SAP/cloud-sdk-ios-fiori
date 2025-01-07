import FioriSwiftUICore
import SwiftUI

public struct _KPIProgressExample: View {
    let nf: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    
    public init() {}
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 16) {
                _KPIProgressItem(data: .percent(0.88), subtitle: "Completed")
                _KPIProgressItem(data: .percent(0.75), subtitle: "Long Long Long Completed")
                _KPIProgressItem(data: .percent(0.66), footnote: "Completed")
                _KPIProgressItem(data: .percent(0.45), footnote: "Very Long Long Long Long Completed")
                _KPIProgressItem(data: .fraction(76, 90, self.nf), subtitle: "Completed")
                _KPIProgressItem(data: .fraction(76000, 90000, self.nf), subtitle: "Long Long Long Completed")
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        })
    }
}

struct _KPIProgressPreview: PreviewProvider {
    static var previews: some View {
        Group {
            _KPIProgressExample()
                .previewDisplayName("iPhone 12")
        }
    }
}

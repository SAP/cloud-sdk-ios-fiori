import SwiftUI

struct OptionalKPIItem: View {
    let data: KPIItemData?
    
    init(_ data: KPIItemData?) {
        self.data = data
    }
    
    var body: some View {
        if let d = data {
            KPIItem(data: d)
        } else {
            EmptyView()
        }
    }
}

extension OptionalKPIItem: _ViewEmptyChecking {
    var isEmpty: Bool {
        self.data == nil
    }
}

#Preview {
    OptionalKPIItem(KPIItemData.components([.icon(Image(systemName: "arrowtriangle.up.fill")),
                                            .unit("$"),
                                            .metric("26.9"),
                                            .unit("M")]))
}

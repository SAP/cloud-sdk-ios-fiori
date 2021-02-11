import Foundation
import SwiftUI

public enum AccessoryType: Int, CaseIterable {
    case none, disclosure, checkmark, detail
    
    @ViewBuilder
    var image: some View {
        switch self {
        case .none:
            EmptyView()
        case .disclosure:
            Image(systemName: "chevron.right")
        case .detail:
            Image(systemName: "info.circle")
        case .checkmark:
            Image(systemName: "checkmark")
        }
    }
}

import Foundation
import SwiftUI

struct PageIndex: EnvironmentKey {
    public static let defaultValue = 0
}

extension EnvironmentValues {
    var pageIndex: Int {
        get { self[PageIndex.self] }
        set { self[PageIndex.self] = newValue }
    }
}

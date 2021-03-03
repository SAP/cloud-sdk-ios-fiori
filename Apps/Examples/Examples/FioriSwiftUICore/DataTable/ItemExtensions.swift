import Foundation
import SwiftUI

struct TableContentEnvironmentKey: EnvironmentKey {
    static let defaultValue: TableContext = DefaultTableContext()
}

extension EnvironmentValues {
    var tableContext: TableContext {
        get {
            self[TableContentEnvironmentKey]
        }
        
        set {
            self[TableContentEnvironmentKey] = newValue
        }
    }
}

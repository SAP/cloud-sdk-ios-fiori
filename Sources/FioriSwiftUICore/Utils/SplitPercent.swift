import Foundation
import SwiftUI

struct SplitPercentKey: EnvironmentKey {
    public static let defaultValue: CGFloat? = 0.5
}

public extension EnvironmentValues {
    /// Distribution of left and right content columns, when in `.regular` horizontal content mode.  Defaults to `0.5`.
    var splitPercent: CGFloat? {
        get { self[SplitPercentKey.self] }
        set { self[SplitPercentKey.self] = newValue }
    }
}

public extension View {
    /// the percentage of left and right content columns in remaining width, used in ObjectItem and ContactIteml etc, range from 0 to 1
    func splitPercent(_ value: CGFloat?) -> some View {
        var newValue: CGFloat?
        
        if let tmpValue = value {
            newValue = max(0, min(1, tmpValue))
        }
        
        return self.environment(\.splitPercent, newValue)
    }
}

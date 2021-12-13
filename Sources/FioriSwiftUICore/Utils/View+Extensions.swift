import Foundation
import SwiftUI

extension View {
    func onSimultaneousTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View {
        self.simultaneousGesture(TapGesture(count: count).onEnded {
            action()
        })
    }
}

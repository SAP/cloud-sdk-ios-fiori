import Foundation
import SwiftUI

extension View {
    func pageIndex(_ index: Int) -> some View {
        self.environment(\.pageIndex, index)
    }
}

extension View {
    func onSimultaneousTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View {
        self.simultaneousGesture(TapGesture(count: count).onEnded {
            action()
        })
    }
}

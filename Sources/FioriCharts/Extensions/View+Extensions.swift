import Foundation
import SwiftUI

public extension View {
    @ViewBuilder
    func ifApply(_ condition: Bool, content: (Self) -> some View) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
}

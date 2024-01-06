import Foundation
import SwiftUI

extension Optional: _ViewEmptyChecking where Wrapped: View {
    var isEmpty: Bool {
        if case .none = self {
            return true
        }
        
        if case .some(let wrapped) = self {
            return wrapped.isEmpty
        }
        
        return false
    }
}

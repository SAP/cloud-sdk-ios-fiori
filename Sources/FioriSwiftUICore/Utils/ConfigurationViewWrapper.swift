import Foundation
import SwiftUI

public struct ConfigurationViewWrapper: View {
    var v: any View
    
    init(_ view: some View) {
        self.v = view
    }
    
    public var body: some View {
        v.typeErased
    }
}

extension ConfigurationViewWrapper: _ViewEmptyChecking {
    public var isEmpty: Bool {
        self.v.isEmpty
    }
}

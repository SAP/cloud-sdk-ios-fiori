import Foundation
import SwiftUI

struct OptionalText: View {
    let attributedString: AttributedString?
    
    init(_ attributedString: AttributedString?) {
        self.attributedString = attributedString
    }
    
    var body: some View {
        if let attributedString {
            Text(attributedString)
        } else {
            EmptyView()
        }
    }
}

extension OptionalText: _ViewEmptyChecking {
    var isEmpty: Bool {
        self.attributedString == nil
    }
}

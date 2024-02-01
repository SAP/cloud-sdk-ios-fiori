import Foundation
import SwiftUI

struct OptionalText: View {
    let attributedString: AttributedString?
    
    init(_ attributedString: AttributedString?) {
        self.attributedString = attributedString
    }
    
    init(_ string: String?) {
        self.attributedString = string != nil ? AttributedString(string!) : nil
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

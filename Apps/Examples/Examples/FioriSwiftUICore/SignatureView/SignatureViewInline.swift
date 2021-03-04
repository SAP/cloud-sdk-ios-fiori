import FioriSwiftUICore
import SwiftUI

struct SignatureViewInline_Example: View {
    var signatureViewInline: SignatureViewInline!
    
    init() {
        self.signatureViewInline = SignatureViewInline()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            signatureViewInline
        }
    }
}

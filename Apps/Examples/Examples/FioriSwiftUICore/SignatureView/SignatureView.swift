import FioriSwiftUICore
import SwiftUI

struct SignatureView_Example: View {
    var signatureView: SignatureView!
    
    init() {
        self.signatureView = SignatureView()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            signatureView
        }
    }
}

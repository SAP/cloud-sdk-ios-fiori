import Foundation
import SwiftUI

struct FioriButtonContentView: View {
    var body: some View {
        List {
            NavigationLink("FioriButton", destination: FioriButtonExample())
            NavigationLink("StatefulButtonStyle", destination: StatefulButtonStyleExample())
        }
    }
}

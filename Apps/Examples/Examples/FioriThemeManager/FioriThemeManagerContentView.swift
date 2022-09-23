import Foundation
import SwiftUI

struct FioriThemeManagerContentView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: FioriFonts()) {
                Text("72 Fonts")
            }
            NavigationLink(
                destination: Colors()) {
                Text("Colors - latest")
            }
            NavigationLink(
                destination: CustomColors()) {
                Text("Colors - custom example")
            }
        }
    }
}

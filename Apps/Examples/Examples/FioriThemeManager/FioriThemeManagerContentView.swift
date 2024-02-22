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
                destination: CustomColors(testData: .customPalette(ColorTestData.RandomColorPaletteProvider())))
            {
                Text("Colors - custom palette (random)")
            }
            NavigationLink(
                destination: CustomColors(testData: .programmatic(.green, .red))) {
                Text("Colors - developer override")
            }
            NavigationLink(
                destination: CustomColors(testData: .styleSheet(ColorTestData.sampleStyleSheet))) {
                Text("Colors - style sheet override")
            }
            NavigationLink(
                destination: IconLibraryExample()) {
                Text("IconLibrary")
            }
        }
    }
}

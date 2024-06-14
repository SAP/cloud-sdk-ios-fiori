import FioriThemeManager
import Foundation
import SwiftUI

struct FioriFonts: View {
    let textStyles = Font.FioriTextStyle.allCases
    
    @State var showSettings = false
    @State var fontWeight = Font.FioriWeight.regular
    @State var isItalic = false
    @State var isCondensed = false
    @State var sizeCategory = ContentSizeCategory.large
    
    var body: some View {
        List {
            ForEach(0 ..< self.textStyles.count, id: \.self) { index in
                let textStyle = self.textStyles[index]
                Text(String(describing: textStyle))
                    .font(.fiori(forTextStyle: textStyle, weight: self.fontWeight, isItalic: self.isItalic, isCondensed: self.isCondensed))
            }
        }
        .environment(\.sizeCategory, self.sizeCategory)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
        .sheet(isPresented: self.$showSettings) {
            Settings(fontWeight: self.$fontWeight, isItalic: self.$isItalic, isCondensed: self.$isCondensed, sizeCategory: self.$sizeCategory)
        }
    }
}

extension FioriFonts {
    struct Settings: View {
        @Binding var fontWeight: Font.FioriWeight
        @Binding var isItalic: Bool
        @Binding var isCondensed: Bool
        @Binding var sizeCategory: ContentSizeCategory
        
        var body: some View {
            NavigationView {
                List {
                    Picker("Font Weight", selection: self.$fontWeight) {
                        ForEach(0 ..< Font.FioriWeight.allCases.count, id: \.self) { index in
                            let weight = Font.FioriWeight.allCases[index]
                            Text(String(describing: weight))
                                .tag(weight)
                        }
                    }
                    
                    Toggle("Italic", isOn: self.$isItalic)
                    
                    Toggle("Condensed", isOn: self.$isCondensed)
                    
                    Picker("Dynamic Type", selection: self.$sizeCategory) {
                        ForEach(0 ..< ContentSizeCategory.allCases.count, id: \.self) { index in
                            let sizeCategory = ContentSizeCategory.allCases[index]
                            Text(String(describing: sizeCategory))
                                .tag(sizeCategory)
                        }
                    }
                }
            }
        }
    }
}

extension Font.FioriWeight: CaseIterable {
    public static var allCases: [Font.FioriWeight] {
        [.black, .heavy, .bold, .semibold, .semiboldDuplex, .medium, .regular, .light, .thin, .ultraLight]
    }
}

extension Font.Weight: CustomStringConvertible {
    public var description: String {
        let name: String
        
        switch self {
        case .black:
            name = "black"
        case .heavy:
            name = "heavy"
        case .bold:
            name = "bold"
        case .semibold:
            name = "semibold"
        case .medium:
            name = "medium"
        case .regular:
            name = "regular"
        case .light:
            name = "light"
        case .thin:
            name = "thin"
        case .ultraLight:
            name = "ultraLight"
        default:
            name = "Unknown"
        }
        
        return name
    }
}

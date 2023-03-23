import Foundation
import SwiftUI

struct FioriFonts: View {
    let textStyles = Font.FioriTextStyle.allCases
    
    @State var showSettings = false
    @State var fontWeight = Font.Weight.regular
    @State var isItalic = false
    @State var isCondensed = false
    @State var sizeCategory = ContentSizeCategory.large
    
    var body: some View {
        List {
            ForEach(0 ..< textStyles.count) { index in
                let textStyle = textStyles[index]
                Text(String(describing: textStyle))
                    .font(.fiori(forTextStyle: textStyle, weight: fontWeight, isItalic: isItalic, isCondensed: isCondensed))
            }
        }
        .environment(\.sizeCategory, sizeCategory)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            Settings(fontWeight: $fontWeight, isItalic: $isItalic, isCondensed: $isCondensed, sizeCategory: $sizeCategory)
        }
    }
}

extension FioriFonts {
    struct Settings: View {
        @Binding var fontWeight: Font.Weight
        @Binding var isItalic: Bool
        @Binding var isCondensed: Bool
        @Binding var sizeCategory: ContentSizeCategory
        
        var body: some View {
            NavigationView {
                List {
                    Picker("Font Weight", selection: $fontWeight) {
                        ForEach(0 ..< Font.Weight.allCases.count) { index in
                            let weight = Font.Weight.allCases[index]
                            Text(String(describing: weight))
                                .tag(weight)
                        }
                    }
                    
                    Toggle("Italic", isOn: $isItalic)
                    
                    Toggle("Condensed", isOn: $isCondensed)
                    
                    Picker("Dynamic Type", selection: $sizeCategory) {
                        ForEach(0 ..< ContentSizeCategory.allCases.count) { index in
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

extension Font.Weight: CaseIterable {
    public static var allCases: [Font.Weight] {
        [.black, .heavy, .bold, .semibold, .medium, .regular, .light, .thin, .ultraLight]
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

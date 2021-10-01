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
                    .font(fioriFont(textStyle))
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
    
    func fioriFont(_ textStyle: Font.FioriTextStyle) -> Font {
        var font: Font = self.isCondensed ? .fioriCondensed(forTextStyle: textStyle) : .fiori(forTextStyle: textStyle)
        
        font = font.weight(self.fontWeight)
        
        if self.isItalic {
            font = font.italic()
        }
        
        return font
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
        [.black, .bold, .heavy, .light, .medium, .regular, .semibold, .thin, .light, .ultraLight]
    }
}

import FioriThemeManager
import SwiftUI

// MARK: Latest Color Palette

struct Colors: View {
    @State var paletteVersion: PaletteVersion = .latest

    var body: some View {
        List {
            ForEach(Array(paletteVersion.supportedStyles()).sorted { $0.rawValue < $1.rawValue },
                    id: \.self) { colorStyle in
                ColorView(colorStyle: colorStyle)
            }
        }
        .onAppear(perform: {
            ThemeManager.shared.setPaletteVersion(.latest)
        })
    }
}

// MARK: Custom Color Palette (Example)

struct CustomPaletteProvider: PaletteProvider {
    var uuid = UUID()
    
    var colorDefinitions: [ColorStyle: HexColor] = [
        .primaryLabel: HexColor(lightColor: "FF8CB2FF", darkColor: "D20A0AFF", contrastLightColor: "FFADD1FF", contrastDarkColor: "9C0707FF")
    ]
    
    func hexColor(for style: ColorStyle) -> HexColor? {
        self.colorDefinitions[style]
    }
}

struct CustomColors: View {
    @State var customColorPalette = Palette(CustomPaletteProvider())
    
    var body: some View {
        List {
            ForEach(Array(customColorPalette.colorDefinitions.keys).sorted { $0.rawValue < $1.rawValue },
                    id: \.self) { colorStyle in
                ColorView(colorStyle: colorStyle)
            }
        }
        .onAppear(perform: {
            ThemeManager.shared.setPalette(customColorPalette)
        })
    }
}

// MARK: Internal

struct ColorView: View {
    var colorStyle: ColorStyle
    
    @Environment(\.colorScheme) var colorScheme
    
    var backgroundColorScheme: BackgroundColorScheme {
        self.colorScheme == .dark ? .darkConstant : .lightConstant
    }
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.preferredColor(colorStyle))
                .frame(width: 50, height: 50)
                .padding()
            VStack {
                Text(colorStyle.rawValue)
                Text(Color.preferredColor(colorStyle, background: backgroundColorScheme).toHex() ?? "N/A").italic()
            }
        }
    }
}

extension Color {
    func toHex() -> String? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

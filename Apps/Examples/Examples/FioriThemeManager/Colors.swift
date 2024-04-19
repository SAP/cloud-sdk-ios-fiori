import FioriThemeManager
import SwiftUI

// MARK: Latest Color Palette

struct Colors: View {
    @State var paletteVersion: PaletteVersion = .latest

    var body: some View {
        List {
            ForEach(Array(self.paletteVersion.supportedStyles()).sorted { $0.rawValue < $1.rawValue },
                    id: \.self)
            { colorStyle in
                ColorView(colorStyle: colorStyle)
            }
        }
        .onAppear(perform: {
            ThemeManager.shared.setPaletteVersion(.latest)
        })
    }
}

#if !os(watchOS)
    struct ColorGradient: View {
        @State var paletteVersion: PaletteVersion = .latest
    
        var body: some View {
            VStack {
                Button {} label: {
                    Text("Round Button with Gradient Color for border line")
                        .font(.headline)
                        .padding()
                }
                .frame(height: 60)
                .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color.preferredColor(.jouleGradient1), Color.preferredColor(.jouleGradient2)]), startPoint: .top, endPoint: .bottom)))
                .onAppear(perform: {
                    ThemeManager.shared.setPaletteVersion(.latest)
                })
            
                Spacer()
            
                Button {} label: {
                    Text("Rectangle Button with Gradient Color for border line")
                        .font(.headline)
                        .padding()
                }
                .frame(height: 60)
                .overlay(Rectangle().stroke(LinearGradient(gradient: Gradient(colors: [Color.preferredColor(.jouleGradient1), Color.preferredColor(.jouleGradient2)]), startPoint: .leading, endPoint: .trailing)))
                .onAppear(perform: {
                    ThemeManager.shared.setPaletteVersion(.latest)
                })
            
                Spacer()
            
                Button {} label: {
                    Text("Rounded Rectangle Button with Gradient Color for border line")
                        .font(.headline)
                        .padding()
                }
                .frame(height: 60)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(LinearGradient(gradient: Gradient(colors: [Color.preferredColor(.jouleGradient1), Color.preferredColor(.jouleGradient2)]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                .onAppear(perform: {
                    ThemeManager.shared.setPaletteVersion(.latest)
                })
            
                Spacer()
            
                Text("Text with Gradient Color for border line")
                    .font(.body)
                    .padding()
                    .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color.preferredColor(.jouleGradient1), Color.preferredColor(.jouleGradient2)]), startPoint: .top, endPoint: .bottom)))
            }
        
            Spacer()
        
            VStack {
                Text("Text Background Color with Gradient Effect, starting from top left corner of the text view, to the bottom right corner. SAP Design Principles: Based on user roles and business processes, SAP Fiori simplifies doing business. To accelerate the transformation of the world’s digital economy, SAP is applying this design language to leading technology platforms. SAP Fiori sets the standard for enterprise user experience by removing unnecessary complexity. SAP Design Principles: Based on user roles and business processes, SAP Fiori simplifies doing business. To accelerate the transformation of the world’s digital economy, SAP is applying this design language to leading technology platforms. SAP Fiori sets the standard for enterprise user experience by removing unnecessary complexity.")
                    .font(.title)
            
                Button {} label: {
                    Text("Button Clickable")
                }
                .frame(height: 60)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.preferredColor(.jouleGradient1), Color.preferredColor(.jouleGradient2)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
            .onAppear(perform: {
                ThemeManager.shared.setPaletteVersion(.latest)
            })
            .padding(.all, 40)
        }
    }
#endif

// MARK: Custom Color Palette & StyleSheet (Example)

struct CustomColors: View {
    var testData: ColorTestData
    var colorStyles: [ColorStyle] = [.primaryLabel, .tintColor, .positiveLabel, .negativeLabel]
    
    init(testData: ColorTestData) {
        self.testData = testData
    }
    
    var body: some View {
        List {
            switch self.testData {
            case .customPalette:
                Text("Here a custom palette provides random colors for all ColorStyles")
            case .programmatic(_), .styleSheet:
                Text("ℹ️ primaryLabel color was overriden (other colors come from .latest palette)")
            }
            ForEach(self.colorStyles,
                    id: \.self)
            { colorStyle in
                ColorViewWithNoHexDescription(colorStyle: colorStyle)
            }
        }
        .onAppear(perform: {
            switch self.testData {
            case .customPalette(let provider):
                StyleSheetSettings.reset()
                ThemeManager.shared.setPalette(Palette(provider))
            case .programmatic(let lightColor, let darkColor):
                StyleSheetSettings.reset()
                ThemeManager.shared.setPalette(PaletteVersion.latest.palette)
                ThemeManager.shared.setColor(lightColor, for: .primaryLabel, variant: .light)
                ThemeManager.shared.setColor(darkColor, for: .primaryLabel, variant: .dark)
            case .styleSheet(let content):
                StyleSheetSettings.reset()
                ThemeManager.shared.setPalette(PaletteVersion.latest.palette)
                try? StyleSheetSettings.loadStylesheetByString(content: content)
            }
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
                .fill(Color.preferredColor(self.colorStyle))
                .frame(width: 50, height: 50)
                .padding()
            VStack(alignment: .leading) {
                Text(self.colorStyle.rawValue)
                Text(Color.preferredColor(self.colorStyle, background: self.backgroundColorScheme).toHex() ?? "N/A").italic()
            }
        }
    }
}

struct ColorViewWithNoHexDescription: View {
    var colorStyle: ColorStyle
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.preferredColor(self.colorStyle))
                .frame(width: 50, height: 50)
                .padding()
            VStack {
                Text(self.colorStyle.rawValue)
            }
        }
    }
}

enum ColorTestData {
    case customPalette(PaletteProvider)
    case programmatic(Color, Color)
    case styleSheet(String)
    
    static var sampleStyleSheet: String { """
    @primaryLabel:                  #FF6000;
    @primaryLabel_darkBackground:   #00FFFF;
    """
    }
    
    struct RandomColorPaletteProvider: PaletteProvider {
        var uuid = UUID()
        
        var colorDefinitions: [ColorStyle: HexColor] = [:]
        
        func hexColor(for style: ColorStyle) -> HexColor? {
            HexColor.random()
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

extension Color {
    static var random: Color {
        Color(red: .random(in: 0 ... 1),
              green: .random(in: 0 ... 1),
              blue: .random(in: 0 ... 1))
    }
}

extension HexColor {
    static func random() -> HexColor {
        HexColor(lightColor: Color.random.toHex(), darkColor: Color.random.toHex(), elevatedLightColor: Color.random.toHex(), elevatedDarkColor: Color.random.toHex(), contrastLightColor: Color.random.toHex(), contrastDarkColor: Color.random.toHex(), elevatedContrastLightColor: Color.random.toHex(), elevatedContrastDarkColor: Color.random.toHex())
    }
}

import Foundation

#if os(watchOS)
    struct WatchPaletteV1: PaletteProvider {
        /// :nodoc:
        public let uuid = UUID()
    
        /// :nodoc:
        public static let `default` = Palette(WatchPaletteV1())
    
        let version: PaletteVersion = .v1
    
        private init() {}
    
        // TODO:
        // Finish palette definitions
        public var colorDefinitions: [ColorStyle: HexColor] = [
            .primaryLabel: HexColor(lightColor: "FFFFFF", darkColor: "3F3A3A")
        ]
    
        func hexColor(for colorStyle: ColorStyle) -> HexColor? {
            self.colorDefinitions[colorStyle]
        }
    }
#endif

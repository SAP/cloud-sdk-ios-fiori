import Foundation
import SnapshotTesting

internal class PresetViewImageConfigs {
    let phones: [SnapshotTestViewConfig] = [SnapshotTestViewConfig(config: .iPhoneX(.portrait),
                                                                   identifier: "iPhoneX_portrait"),
                                            SnapshotTestViewConfig(config: .iPhoneX(.landscape),
                                                                   identifier: "iPhoneX_landscape"),
                                            SnapshotTestViewConfig(config: .iPhoneXsMax(.portrait),
                                                                   identifier: "iPhoneXsMax_portrait"),
                                            SnapshotTestViewConfig(config: .iPhoneXsMax(.landscape),
                                                                   identifier: "iPhoneXsMax_landscape")]

    let pads: [SnapshotTestViewConfig] = [SnapshotTestViewConfig(config: .iPadPro11(.portrait),
                                                                 identifier: "iPadPro11_portrait"),
                                          SnapshotTestViewConfig(config: .iPadPro11(.landscape),
                                                                 identifier: "iPadPro11_landscape")]
}

internal struct SnapshotTestViewConfig {
    var config: ViewImageConfig
    var identifier: String

    internal init(config: ViewImageConfig, identifier: String) {
        self.config = config
        self.identifier = identifier
    }
}

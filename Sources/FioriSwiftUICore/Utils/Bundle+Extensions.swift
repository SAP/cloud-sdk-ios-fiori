import Foundation

private class CurrentBundleFinder {}

extension Bundle {
    static var accessor: Bundle {
        #if SWIFT_PACKAGE
        
            // patch for SwiftPM: ensure that bundle is found when accessed from a package that relies on FioriSwiftUI
            if ProcessInfo.processInfo.processName == "xctest" {
                // two names are evaluated because this source file is shared between FioriThemeManager & FioriSwiftUICore modules
                for bundleName in ["FioriSwiftUI_FioriThemeManager", "FioriSwiftUI_FioriSwiftUICore"] {
                    if let bundle = patchToFindBundle(with: bundleName) {
                        return bundle
                    }
                }
            }
        
            return Bundle.module
        #else
            return Bundle.main
        #endif
    }
    
    static func patchToFindBundle(with bundleName: String) -> Bundle? {
        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,
            
            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            
            /* For command-line tools. */
            Bundle.main.bundleURL,
            
            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent()
        ]
        
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        
        return nil
    }
}

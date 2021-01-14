import Foundation
import SourceryRuntime

public struct cloud_sdk_ios_sourcery_utils {
    var text = "Hello, World!"
    public init () {}
}

func indent(_ level: Int) -> String {
    return Array<String>(repeating: "\t", count: level).joined()
}

func carriageRet(_ level: Int) -> String {
    return "\n" + indent(level)
}







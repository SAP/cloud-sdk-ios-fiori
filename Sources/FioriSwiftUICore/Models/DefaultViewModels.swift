import SwiftUI

public extension ActionComponent {
    var actionText: String? {
        nil
    }

    func didSelectAction() {}
}

public struct _CancelActionDefault: ActionModel {
    public var actionText_: String? {
        NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }
    
    public init() {}
}

public struct _TapToSignActionDefault: ActionModel {
    public var actionText_: String? {
        NSLocalizedString("Tap to Sign", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public struct _ReEnterSignatureActionDefault: ActionModel {
    public var actionText_: String? {
        NSLocalizedString("Re-enter Signature", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public struct _ClearActionDefault: ActionModel {
    public var actionText_: String? {
        NSLocalizedString("Clear", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

public struct _SaveActionDefault: ActionModel {
    public var actionText_: String? {
        NSLocalizedString("Save", tableName: "FioriSwiftUICore", bundle: fioriSwiftUICoreBundle, comment: "")
    }

    public init() {}
}

private let fioriSwiftUICoreBundle = Bundle.accessor

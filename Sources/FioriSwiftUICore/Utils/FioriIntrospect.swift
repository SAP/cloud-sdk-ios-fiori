#if !os(watchOS)
    import SwiftUI
    import UIKit
    @_spi(Advanced) import SwiftUIIntrospect

    @MainActor
    struct FioriIntrospectModifier<Target>: ViewModifier {
        let customize: (Target) -> Void
        let scope: IntrospectionScope?
    
        init(scope: FioriIntrospectionScope? = nil,
             customize: @escaping (Target) -> Void)
        {
            self.scope = scope?.toIntrospectionScope()
            self.customize = customize
        }
    
        func body(content: Content) -> some View {
            if Target.self == UIScrollView.self {
                content.introspect(.scrollView, on: .iOS(.v17...), scope: self.scope) { view in
                    if let target = view as? Target {
                        self.customize(target)
                    }
                }
            } else if Target.self == UITextField.self {
                content
                    .introspect(.textField, on: .iOS(.v17...), scope: self.scope) { view in
                        if let target = view as? Target {
                            self.customize(target)
                        }
                    }
            } else if Target.self == UITextView.self {
                content
                    .introspect(.textEditor, on: .iOS(.v17...), scope: self.scope) { view in
                        if let target = view as? Target {
                            self.customize(target)
                        }
                    }
                    .introspect(.textField(axis: .vertical), on: .iOS(.v17...), .visionOS(.v1...)) { view in
                        if let target = view as? Target {
                            self.customize(target)
                        }
                    }
            } else {
                content
            }
        }
    }

    struct FioriIntrospectionScope: OptionSet, Sendable {
        static let receiver = Self(rawValue: 1 << 0)
        static let ancestor = Self(rawValue: 1 << 1)
        let rawValue: UInt
        init(rawValue: UInt) {
            self.rawValue = rawValue
        }
    
        func toIntrospectionScope() -> IntrospectionScope {
            IntrospectionScope(rawValue: self.rawValue)
        }
    }
#endif

import FioriThemeManager
import SwiftUI

/// A reusable toolbar/navigation-bar item that renders as a `Button`
/// with either a text label or an SF Symbol image.
///
/// `FioriToolbarItem` is a lightweight, `Sendable` value type designed to be
/// placed inside a `ToolbarItem`. It lets the system provide the bar-item
/// background and press behavior (including Liquid Glass on iOS 26+),
/// matching a hand-written `Button { … } label: { … }`.
///
/// Use one of the built-in presets — ``close``, ``back``, or ``textClose`` —
/// and attach behavior with ``withAction(_:)``. You can also construct a
/// custom item directly by choosing a ``Style``.
///
/// ```swift
/// .toolbar {
///     ToolbarItem(placement: .topBarLeading) {
///         FioriToolbarItem.close
///             .withAction { dismiss() }
///     }
/// }
/// ```
///
/// Because `FioriToolbarItem` conforms to `View`, it can be returned directly
/// from a `ToolbarItem`'s content builder.
struct FioriToolbarItem: Hashable, Sendable {
    static func == (lhs: FioriToolbarItem, rhs: FioriToolbarItem) -> Bool {
        switch (lhs.style, rhs.style) {
        case (.text(let lhsText), .text(let rhsText)):
            return lhsText == rhsText
        case (.image(let lhsImage), .image(let rhsImage)):
            return lhsImage == rhsImage
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    enum Style {
        case text(String)
        case image(String)
    }

    let style: FioriToolbarItem.Style
    let action: (@Sendable () -> Void)?

    init(style: FioriToolbarItem.Style,
         action: (@Sendable () -> Void)? = nil)
    {
        self.style = style
        self.action = action
    }
}

extension FioriToolbarItem: View {
    var body: some View {
        Button {
            self.action?()
        } label: {
            switch self.style {
            case .text(let text):
                Text(text)
            case .image(let imageName):
                Image(systemName: imageName)
            }
        }
    }

    static let close = FioriToolbarItem(style: .image("xmark"))
    static let back = FioriToolbarItem(style: .image("chevron.backward"))

    static let textClose = FioriToolbarItem(style: .text("Close"))

    func withAction(_ action: @escaping @Sendable () -> Void) -> FioriToolbarItem {
        FioriToolbarItem(style: self.style, action: action)
    }
}

struct FioriToolbarDemoView: View {
    var body: some View {
        NavigationStack {
            Color.clear
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        FioriToolbarItem.close
                            .withAction {}
                    }
                    #if !os(visionOS)
                        if #available(iOS 26.0, *) {
                            ToolbarSpacer(.flexible, placement: .topBarLeading)
                        }
                    #endif
                    ToolbarItem(placement: .topBarLeading) {
                        FioriToolbarItem.back
                            .withAction {}
                            .foregroundStyle(Color.red)
                    }
                    #if !os(visionOS)
                        if #available(iOS 26.0, *) {
                            ToolbarSpacer(.flexible, placement: .topBarLeading)
                        }
                    #endif
                    ToolbarItem(placement: .topBarLeading) {
                        FioriToolbarItem.textClose
                            .withAction {}
                    }
                }
        }
    }
}

#Preview {
    FioriToolbarDemoView()
}

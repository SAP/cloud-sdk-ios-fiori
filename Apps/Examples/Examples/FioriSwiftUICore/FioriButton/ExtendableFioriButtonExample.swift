import FioriSwiftUICore
import Foundation
import SwiftUI

struct ExtendableFioriButtonExample: View {
    @State private var _isSelectionPersistent = false
    @State private var _isShowingDialog = false

    var body: some View {
        FioriButton(isSelectionPersistent: self._isSelectionPersistent,
                    action: { state in
                        print("Button tapped with state: \(state)")
                    },
                    label: { _ in Text("Cancel") })
            .configureStandardButton { fioriAction in
                Button(role: .cancel, action: fioriAction) {
                    EmptyView()
                }
            }
            .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .tint))
        
        FioriButton(isSelectionPersistent: self._isSelectionPersistent,
                    action: { state in
                        print("Button tapped with state: \(state)")
                        self._isShowingDialog = true
                    },
                    label: { _ in Text("Delete") })
            .configureStandardButton { fioriAction in
                Button(role: .destructive, action: fioriAction) {
                    EmptyView()
                }
            }
            .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .negative))
        
        FioriButton(isSelectionPersistent: self._isSelectionPersistent,
                    action: { state in
                        print("Button tapped with state: \(state)")
                        self._isShowingDialog = true
                    },
                    label: { _ in Text("CustomStyle") })
            .configureStandardButton { fioriAction in
                Button(role: .destructive, action: fioriAction) {
                    EmptyView()
                }
            }
            .fioriButtonStyle(CustomDestructiveButtonStyle())
    }
}

struct CustomDestructiveButtonStyle: FioriButtonStyle {
    private let maxWidth: CGFloat?
    private let minHeight: CGFloat?
    private let loadingState: FioriButtonLoadingState

    init(maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, loadingState: FioriButtonLoadingState = .unspecified) {
        self.maxWidth = maxWidth
        self.minHeight = minHeight
        self.loadingState = loadingState
    }

    func makeBody(configuration: Configuration) -> some View {
        let foregroundColor = self.negativeForeground(for: configuration.state)
        let backgroundColor = self.negativeBackground(for: configuration.state)
        let font = Font.fiori(forTextStyle: .body, weight: .semibold)
        let padding = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

        return configuration.containerView(self.loadingState)
            .font(font)
            .foregroundColor(foregroundColor)
            .tint(foregroundColor)
            .padding(padding)
            .frame(minWidth: 44, maxWidth: self.maxWidth, minHeight: self.minHeight ?? 38.0)
            .background(RoundedRectangle(cornerRadius: 8).fill(backgroundColor))
            .contentShape(Rectangle())
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    // Negative foreground (text/icon) based on state/loading
    private func negativeForeground(for state: UIControl.State) -> Color {
        switch self.loadingState {
        case .processing, .success:
            return .preferredColor(.negativeLabelTapState)
        case .unspecified:
            switch state {
            case .normal:
                return .preferredColor(.negativeLabel)
            case .highlighted, .selected:
                return .preferredColor(.negativeLabelTapState)
            case .disabled:
                return .preferredColor(.separator)
            default:
                return .preferredColor(.negativeLabel)
            }
        }
    }

    // Negative background based on state/loading
    private func negativeBackground(for state: UIControl.State) -> Color {
        switch self.loadingState {
        case .processing, .success:
            return .preferredColor(.secondaryFill)
        case .unspecified:
            switch state {
            case .normal:
                return .preferredColor(.negativeBackground)
            case .highlighted, .selected:
                return .preferredColor(.negativeBackgroundTapState)
            case .disabled:
                return .preferredColor(.tertiaryFill)
            default:
                return .preferredColor(.negativeBackground)
            }
        }
    }
}

import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

private enum FioriButtonMultiLoadingButtonsStatus: Int {
    case greyInitial
    case greyTap
    case greyLoading
    case greySuccess
    case tintInitial
    case tintTap
    case tintLoading
    case tintSuccess
    case negativeInitial
    case negativeTap
    case negativeLoading
    case negativeSuccess
}

struct MultiLoadingButtonStatusChangeExample: View {
    @State private var _loadingState: FioriButtonLoadingState = .unspecified
    private let sectionTitles = [
        "Primary Button (Tint):",
        "Secondary Button (Grey):",
        "Secondary Button (Tint):",
        "Secondary Button (Negative):",
        "Tertiary Button (Grey):",
        "Tertiary Button (Tint):",
        "Tertiary Button (Negative):"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20, content: {
                ForEach(0 ..< self.sectionTitles.count, id: \.self) { index in
                    HStack {
                        Text(self.sectionTitles[index])
                        Spacer()
                    }
                    
                    FioriButton(isSelectionPersistent: false, action: nil, label: { _ in
                        Text(self.customTitle)
                    }, image: { _ in
                        index == 2 ? AnyView(EmptyView()) : AnyView(FioriIcon.actions.add.font(.fiori(forTextStyle: .subheadline)))
                    })
                    .fioriButtonStyle(self.fioriButtonStyle(at: index).eraseToAnyFioriButtonStyle())
                    .disabled(self._loadingState != .unspecified)
                }
            })
            .padding(30.0)
        }
        .navigationTitle("Multi Loading Buttons Status Change")
        .onAppear {
            self.changeLoadingStatus()
        }
    }
    
    func changeLoadingStatus() {
        _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
            switch self._loadingState {
            case .unspecified:
                self._loadingState = .processing
            case .processing:
                self._loadingState = .success
            case .success:
                self._loadingState = .unspecified
            }
        })
    }
    
    var customTitle: AttributedString {
        switch self._loadingState {
        case .unspecified:
            "Label"
        case .processing:
            "Loading..."
        case .success:
            "Success"
        }
    }
    
    func fioriButtonStyle(at index: Int) -> any FioriButtonStyle {
        switch index {
        case 0:
            return FioriPrimaryButtonStyle(142, loadingState: self._loadingState)
        case 1:
            return FioriSecondaryButtonStyle(colorStyle: .normal, maxWidth: 142, loadingState: self._loadingState)
        case 2:
            return FioriSecondaryButtonStyle(colorStyle: .tint, maxWidth: 142, loadingState: self._loadingState)
        case 3:
            return FioriSecondaryButtonStyle(colorStyle: .negative, maxWidth: 142, loadingState: self._loadingState)
        case 4:
            return FioriTertiaryButtonStyle(colorStyle: .normal, maxWidth: 142, loadingState: self._loadingState)
        case 5:
            return FioriTertiaryButtonStyle(colorStyle: .tint, maxWidth: 142, loadingState: self._loadingState)
        default:
            return FioriTertiaryButtonStyle(colorStyle: .negative, maxWidth: 142, loadingState: self._loadingState)
        }
    }
}

#Preview {
    MultiLoadingButtonStatusChangeExample()
}

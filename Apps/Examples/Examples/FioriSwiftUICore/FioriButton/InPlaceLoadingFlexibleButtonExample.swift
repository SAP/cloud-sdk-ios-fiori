import FioriSwiftUICore
import SwiftUI

struct InPlaceLoadingFlexibleButtonExample: View {
    @State private var _loadingState: FioriButtonLoadingState = .unspecified
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            FioriButton(title: self.titleStr(self._loadingState), action: { _ in
                self.updateDataSource()
            })
            .fioriButtonStyle(FioriPrimaryButtonStyle(nil, loadingState: self._loadingState))
            .disabled(self._loadingState != .unspecified)
            
            Spacer()
        }
        .navigationTitle("Flexible Button")
    }
    
    func updateDataSource() {
        var timeInterval = 0.0
        if self._loadingState == .unspecified {
            self._loadingState = .processing
            timeInterval = 2.0
        } else if self._loadingState == .processing {
            self._loadingState = .success
            timeInterval = 1.0
        } else {
            self.dismiss()
            return
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { _ in
            self.updateDataSource()
        })
    }
    
    func titleStr(_ loadingState: FioriButtonLoadingState) -> AttributedString {
        switch loadingState {
        case .unspecified:
            "Next"
        case .processing:
            "Loading"
        case .success:
            "Connected"
        }
    }
}

#Preview {
    InPlaceLoadingFlexibleButtonExample()
}

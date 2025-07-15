import SwiftUI
import VisionKit

struct ScannerControlButtons: View {
    let scanner: VisionKitScanner
    @Binding var isTorchOn: Bool
    let onCancelTapped: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 20) {
                // Cancel Button
                Button(action: {
                    self.onCancelTapped()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color.black.opacity(0.6))
                        .background(Color.clear)
                        .clipShape(Circle())
                }
                .accessibilityLabel("Cancel Scanning")
                .opacity(self.scanner.showCancelButton ? 1 : 0)
                .disabled(!self.scanner.showCancelButton)
                
                // Flash Button
                Button(action: {
                    if self.scanner.toggleTorch() {
                        self.isTorchOn = self.scanner.isTorchOn
                    }
                }) {
                    Image(systemName: self.isTorchOn ? "flashlight.off.circle" : "flashlight.on.circle.fill")
                        .font(.system(size: 40))
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color.black.opacity(0.6))
                        .background(Color.clear)
                        .clipShape(Circle())
                }
                .accessibilityLabel(self.isTorchOn ? "Turn Off Flash" : "Turn On Flash")
                .opacity(self.scanner.showFlashButton && self.scanner.isTorchAvailable ? 1 : 0)
                .disabled(!self.scanner.showFlashButton || !self.scanner.isTorchAvailable)
            }
            .padding(.bottom, self.safeAreaBottomInset + 20)
        }
    }
    
    private var safeAreaBottomInset: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .safeAreaInsets.bottom ?? 0
    }
}

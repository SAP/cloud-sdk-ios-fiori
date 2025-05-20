import FioriSwiftUICore
import OSLog
import SwiftUI

struct StartNewConnectionExample: View {
    @ObservedObject var scannerManager: BarcodeScannerManager
    @State private var selectedScannerType: ScannerType?
    @State private var qrCodeImage: Image?
    @State private var errorMessage: String?
    
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.examples", category: "StartNewConnectionExample")

    var body: some View {
        VStack(spacing: 20) {
            // Scanner Selection Buttons
            HStack(spacing: 20) {
                Button(action: {
                    Task { await self.selectScanner(.proGlove) }
                }) {
                    Text("ProGlove")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(self.selectedScannerType == .proGlove ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(self.selectedScannerType == .proGlove ? .white : .primary)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    Task { await self.selectScanner(.ipcMobile) }
                }) {
                    Text("IPCMobile")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(self.selectedScannerType == .ipcMobile ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(self.selectedScannerType == .ipcMobile ? .white : .primary)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            // Scanner Status
            HStack(spacing: 0) {
                Text("Status: ")
                    .font(.subheadline)
                Text(self.scannerManager.status.description)
                    .font(.subheadline)
                    .foregroundColor(self.statusColor(self.scannerManager.status))
            }

            // Error Message Display
            if let msg = errorMessage, !msg.isEmpty {
                Text(msg)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }
            
            // QR Code Display
            if let qrImage = self.qrCodeImage,
               selectedScannerType != nil,
               scannerManager.status == .idle || scannerManager.status.isError()
            {
                VStack {
                    qrImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .border(Color.gray, width: 1)
                    Text("Scan QR with \(self.selectedScannerType!.description)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            
            if self.selectedScannerType != nil {
                HStack(alignment: .center) {
                    Button("Reset Active Scanner") {
                        self.logger.info("Reset button tapped.")
                        self.scannerManager.resetActiveScanner()
                        self.selectedScannerType = nil
                        self.qrCodeImage = nil
                        self.errorMessage = nil
                    }
                    .buttonStyle(.bordered)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Connect Scanner")
        .onAppear {
            self.setupScannerManagerCallbacks()
        }
    }
    
    private func statusColor(_ status: ScannerStatus) -> Color {
        switch status {
        case .idle: return .gray
        case .ready: return .green
        case .scanning: return .blue
        case .error: return .red
        }
    }

    private func setupScannerManagerCallbacks() {
        self.scannerManager.onStatusChanged = { status in
            self.logger.info("onStatusChanged received by example view: \(status.description)")
            switch status {
            case .error(let error):
                self.errorMessage = error.localizedDescription
                if error.code == "bluetooth_not_ready" || error.code == "bluetooth_off" || error.code == ScannerError.permissionDenied.code {
                    self.qrCodeImage = nil
                }
            case .ready:
                self.errorMessage = nil
                self.qrCodeImage = nil
            case .idle:
                if self.qrCodeImage == nil {
                    self.errorMessage = nil
                }
            default:
                break
            }
        }
    }
    
    private func selectScanner(_ type: ScannerType) async {
        self.logger.info("selectScanner called for type: \(type.description)")
        self.selectedScannerType = type
        self.errorMessage = nil
        self.qrCodeImage = nil

        do {
            // This will call ProGloveScanner.startMonitoring()
            // which might throw if Bluetooth is off or permissions are missing.
            try await self.scannerManager.setActiveScanner(type)
            self.logger.info("setActiveScanner completed for \(type.description). Current manager status: \(self.scannerManager.status.description)")

            // Attempt to get QR code only if no immediate error from setActiveScanner/startMonitoring
            // and if the scanner type supports QR pairing.
            if type == .proGlove || type == .ipcMobile {
                if let qrImage = scannerManager.getPairingQRCode() {
                    self.qrCodeImage = qrImage
                    self.logger.info("Pairing QR code obtained for \(type.description).")
                } else {
                    self.logger.warning("getPairingQRCode returned nil for \(type.description). Error should be reflected in manager status shortly.")
                }
            }
        } catch let error as ScannerError {
            logger.error("Error during setActiveScanner for \(type.description): Code='\(error.code)', Message='\(error.message)'")
            self.errorMessage = error.message
            self.qrCodeImage = nil
        } catch {
            self.logger.error("Unexpected error during selectScanner for \(type.description): \(error.localizedDescription)")
            self.errorMessage = "An unexpected error occurred while selecting \(type.description)."
            self.qrCodeImage = nil
        }
    }
}

// Helper extension for ScannerStatus (optional, for clarity in example view)
extension ScannerStatus {
    func isError() -> Bool {
        if case .error = self { return true }
        return false
    }
}

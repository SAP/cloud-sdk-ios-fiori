import FioriSwiftUICore
import os.log
import SwiftUI

struct StartNewConnectionExample: View {
    @ObservedObject var scannerManager: BarcodeScannerManager
    @State private var selectedScannerType: ScannerType?
    @State private var qrCodeImage: Image?
    @State private var errorMessage: String?
    
    private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.examples", category: "StartNewConnectionExample")

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
            // Show QR code if available AND if the status is relevant for pairing (e.g., .idle, or an error that doesn't preclude pairing immediately)
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
                        Self.logger.info("Reset button tapped.")
                        self.scannerManager.resetActiveScanner()
                        self.selectedScannerType = nil // Clear selection as scanner is reset
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
        case .scanning: return .blue // Or another distinct color
        case .error: return .red
        }
    }

    private func setupScannerManagerCallbacks() {
        self.scannerManager.onStatusChanged = { status in
            Self.logger.info("onStatusChanged received by example view: \(status.description)")
            switch status {
            case .error(let error):
                // Use the detailed message from the error struct
                self.errorMessage = error.localizedDescription
                // If pairing fails critically (e.g. BT off), clear QR
                if error.code == "bluetooth_not_ready" || error.code == "bluetooth_off" || error.code == ScannerError.permissionDenied.code {
                    self.qrCodeImage = nil
                }
            case .ready:
                self.errorMessage = nil
                self.qrCodeImage = nil // Pairing successful and scanner is ready, hide QR.
            // selectedScannerType = nil; // Optionally clear selection after successful connection
            case .idle:
                // If status becomes .idle (e.g., ProGlove powered on but not yet connected, or after stopping a connected scanner)
                // Do not clear QR code if it's already displayed for pairing.
                // Clear error message if it's not a pairing-related error.
                if self.qrCodeImage == nil { // Only clear error if no pairing process (QR code) is active
                    self.errorMessage = nil
                }
            default:
                // For other states like .scanning, don't modify UI here unless needed.
                // self.errorMessage = nil // Maybe clear non-critical messages
                break
            }
        }
        // scannerManager.onBarcodeScanned = { barcode in ... } // If this view also handles scans
    }
    
    private func selectScanner(_ type: ScannerType) async {
        Self.logger.info("selectScanner called for type: \(type.description)")
        self.selectedScannerType = type
        self.errorMessage = nil // Clear previous error
        self.qrCodeImage = nil // Clear previous QR code

        do {
            // This will call ProGloveScanner.startMonitoring()
            // which might throw if Bluetooth is off or permissions are missing.
            try await self.scannerManager.setActiveScanner(type)
            Self.logger.info("setActiveScanner completed for \(type.description). Current manager status: \(self.scannerManager.status.description)")

            // Attempt to get QR code only if no immediate error from setActiveScanner/startMonitoring
            // and if the scanner type supports QR pairing.
            if type == .proGlove || type == .ipcMobile { // Assuming ipcMobile also uses QR
                if let qrImage = scannerManager.getPairingQRCode() {
                    self.qrCodeImage = qrImage
                    Self.logger.info("Pairing QR code obtained for \(type.description).")
                    // errorMessage should be nil if qrImage is obtained, as getPairingQRCode clears lastError on success path.
                } else {
                    // getPairingQRCode() returned nil. ProGloveScanner would have set its status to an error.
                    // This error (e.g., "bluetooth_not_ready") will be picked up by onStatusChanged.
                    Self.logger.warning("getPairingQRCode returned nil for \(type.description). Error should be reflected in manager status shortly.")
                    // No need to set errorMessage here; let onStatusChanged handle the specific error from the scanner.
                }
            }
        } catch let error as ScannerError {
            Self.logger.error("Error during setActiveScanner for \(type.description): Code='\(error.code)', Message='\(error.message)'")
            self.errorMessage = error.message // Display the error from setActiveScanner
            self.qrCodeImage = nil // Ensure no QR code is shown on error
        } catch {
            Self.logger.error("Unexpected error during selectScanner for \(type.description): \(error.localizedDescription)")
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

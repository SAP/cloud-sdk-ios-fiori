import AVFoundation
import FioriSwiftUICore
import OSLog
import SwiftUI
import VisionKit

struct VisionKitScannerExample: View {
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.examples", category: "VisionKitScannerExample")
    
    @ObservedObject var scannerManager: BarcodeScannerManager
    @State private var customBarcode: String = ""
    @State private var searchResult: String = ""
    @State private var isPresentingCamera = false
    @State private var isTorchOn: Bool = false
    @State private var errorMessage: String?
    @State private var currentScannerSessionIsMultiScan: Bool = false

    var body: some View {
        VStack(alignment: .center) {
            Text("VisionKit Scanner Example")
                .font(.title2)
                .foregroundColor(.blue)
                .padding(.top, 16)
        }
        VStack {
            // Status
            HStack(spacing: 0) {
                Text("Status: ")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(self.scannerManager.status.description)
                    .font(.subheadline)
                    .foregroundColor(self.statusColor(self.scannerManager.status))
            }

            // Error Message
            if let errorMessage {
                Text(errorMessage)
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(.horizontal)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }

            // Custom Scan Section
            VStack {
                HStack(spacing: 20) {
                    ZStack(alignment: .trailing) {
                        TextField("Camera Scanning", text: self.$customBarcode)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(true)
                        Button(action: {
                            self.logger.info("Barcode scan button tapped")
                            Task {
                                if let scanner = scannerManager.getVisionKitScanner() {
                                    switch await scanner.checkPermissionsAndPrepareForPresentation(manager: self.scannerManager) {
                                    case .success:
                                        self.errorMessage = nil
                                        self.isPresentingCamera = true
                                    case .failure(let error):
                                        self.errorMessage = error.message
                                        self.isPresentingCamera = false
                                    }
                                } else {
                                    self.logger.error("VisionKit scanner not available.")
                                    self.errorMessage = "VisionKit scanner not available."
                                    self.isPresentingCamera = false
                                }
                            }
                        }) {
                            Image(systemName: "barcode.viewfinder")
                                .font(.title2)
                                .foregroundColor(self.scannerManager.status == .ready ? .blue : .gray)
                                .padding(.trailing, 8)
                        }
                        .disabled(self.scannerManager.status != .ready && self.scannerManager.status != .scanning)
                    }
                }
                Text(self.searchResult)
                    .foregroundStyle(Color.orange)
                    .padding(.top, 5)
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
        .onAppear {
            self.logger.info("VisionKitScannerExample appeared")
            Task { await self.setupScanner() }
        }
        .onDisappear {
            self.logger.info("VisionKitScannerExample disappeared")
            self.scannerManager.onBarcodeScanned = nil
            self.scannerManager.onStatusChanged = nil
            if self.scannerManager.isScanning || self.scannerManager.status == .scanning {
                self.scannerManager.stopMonitoring()
            }
        }
        .fullScreenCover(isPresented: self.$isPresentingCamera) {
            if let visionKitScanner = scannerManager.getVisionKitScanner() {
                ZStack(alignment: .topTrailing) {
                    VisionKitScannerRepresentable(
                        scannerManager: self.scannerManager,
                        isTorchOn: self.$isTorchOn,
                        onCancelTapped: {
                            self.isPresentingCamera = false
                        }
                    )
                    .ignoresSafeArea(.all)
                    .onAppear {
                        self.logger.info("Camera view (fullScreenCover content) appeared.")
                        self.currentScannerSessionIsMultiScan = visionKitScanner.recognizesMultipleItems
                        self.logger.info("Camera session multi-scan mode: \(self.currentScannerSessionIsMultiScan)")
                        self.isTorchOn = visionKitScanner.isTorchOn

                        Task {
                            do {
                                // Explicitly trigger the scan
                                self.logger.info("Triggering scan in onAppear of camera view")
                                try await self.scannerManager.triggerScan()
                                self.errorMessage = nil
                            } catch let error as ScannerError {
                                logger.error("Camera onAppear: Failed to trigger scan: \(error.localizedDescription)")
                                self.errorMessage = "Scanner Error: \(error.message)"
                                self.isPresentingCamera = false
                            } catch {
                                self.logger.error("Camera onAppear: Unexpected error: \(error.localizedDescription)")
//                                    self.errorMessage = "Failed to start scanner.")
                                self.isPresentingCamera = false
                            }
                        }
                    }
                    .onDisappear {
                        self.logger.info("Camera view (fullScreenCover content) disappeared.")
                        self.scannerManager.stopMonitoring()
                    }

                    // Add Close button IF the current camera session is in multi-scan mode
                    if self.currentScannerSessionIsMultiScan {
                        Button {
                            self.logger.info("Manual close button tapped for multi-scan camera view.")
                            self.isPresentingCamera = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 30)) // Slightly larger
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }
                        .padding(.top, (UIApplication.shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.first?.safeAreaInsets.top ?? 0) + 15)
                        .padding(.trailing, 15)
                    }
                }
            } else {
                Text("Scanner not available or not VisionKit type.")
                    .onAppear {
                        self.logger.error("VisionKitScanner instance not available for fullScreenCover.")
                        self.isPresentingCamera = false // Dismiss if scanner isn't there
                    }
            }
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

    private func setupScanner() async {
        self.logger.info("Setting up VisionKit scanner for the example view.")
        do {
            if self.scannerManager.activeScannerType != .visionKit || self.scannerManager.status == .idle {
                self.logger.info("Activating VisionKit scanner in setupScanner as it's not active or is idle.")
                try await self.scannerManager.setActiveScanner(.visionKit)
            } else if self.scannerManager.status != .ready, self.scannerManager.status != .scanning {
                self.logger.info("VisionKit active but not ready/scanning. Attempting to start monitoring.")
                try await self.scannerManager.startMonitoring()
            }

            self.scannerManager.onBarcodeScanned = { barcode in
                self.logger.info("BarcodeScanned callback: Received barcode: \(barcode)")
                self.customBarcode = barcode
                self.searchResult = "Last scanned: \(barcode)"

                var shouldCloseCameraView = true
                
                // Check the active VisionKit scanner's configuration
                if let activeVisionScanner = self.scannerManager.getVisionKitScanner() {
                    self.logger.info("Active VisionKit scanner found. Recognizes multiple items: \(activeVisionScanner.recognizesMultipleItems)")
                    if activeVisionScanner.recognizesMultipleItems {
                        shouldCloseCameraView = false
                        self.logger.info("Multi-item scan mode: Camera stays open for next scan.")
                    } else {
                        self.logger.info("Single-item scan mode: Camera will close after this scan.")
                    }
                } else {
                    self.logger.warning("Could not get VisionKitScanner instance in onBarcodeScanned to check 'recognizesMultipleItems' property. Assuming single scan.")
                }

                if shouldCloseCameraView {
                    self.logger.info("Closing camera view programmatically.")
                    self.isPresentingCamera = false
                }
            }

            self.scannerManager.onStatusChanged = { status in
                self.logger.info("StatusChanged callback: Status changed to: \(status.description)")
                if case .error(let error) = status {
                    self.errorMessage = error.message
                } else {
                    self.errorMessage = nil
                }
            }
            
            // Initial status check after setup
            if case .error(let error) = scannerManager.status {
                self.errorMessage = error.message
            } else {
                self.errorMessage = nil
            }

        } catch let error as ScannerError {
            logger.error("Scanner setup failed: \(error.localizedDescription)")
            errorMessage = error.message
        } catch {
            self.logger.error("Unexpected error during scanner setup: \(error.localizedDescription)")
            self.errorMessage = "An unexpected error occurred during scanner setup."
        }
    }
}

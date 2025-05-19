import AVFoundation
import FioriSwiftUICore
import os.log
import SwiftUI
import VisionKit

struct VisionKitScannerExample: View {
    private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.yourapp", category: "VisionKitScannerExample")
    
    @ObservedObject var scannerManager: BarcodeScannerManager
    @State private var customBarcode: String = ""
    @State private var searchResult: String = ""
    @State private var isPresentingCamera = false
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
                            Self.logger.info("Barcode scan button tapped")
                            Task { await self.checkCameraPermissionsAndPresent() }
                        }) {
                            Image(systemName: "barcode.viewfinder")
                                .font(.title2)
                                .foregroundColor(self.scannerManager.status == .ready ? .blue : .gray)
                                .padding(.trailing, 8)
                        }
                        .disabled(self.scannerManager.status != .ready)
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
            Self.logger.info("VisionKitScannerExample appeared")
            Task { await self.setupScanner() }
        }
        .onDisappear {
            Self.logger.info("VisionKitScannerExample disappeared")
            self.scannerManager.onBarcodeScanned = nil
            self.scannerManager.onStatusChanged = nil
            if self.scannerManager.isScanning || self.scannerManager.status == .scanning {
                self.scannerManager.stopMonitoring()
            }
        }
        .fullScreenCover(isPresented: self.$isPresentingCamera) {
            if let visionKitScanner = scannerManager.getVisionKitScanner() {
                ZStack(alignment: .topTrailing) {
                    VisionKitScannerRepresentable(scanner: visionKitScanner)
                        .ignoresSafeArea(.all)
                        .onAppear {
                            Self.logger.info("Camera view (fullScreenCover content) appeared.")
                            self.currentScannerSessionIsMultiScan = visionKitScanner.recognizesMultipleItems
                            Self.logger.info("Camera session multi-scan mode: \(self.currentScannerSessionIsMultiScan)")

                            Task {
                                do {
                                    // Ensure the scanner is active and ready for this session
                                    if self.scannerManager.activeScannerType != .visionKit {
                                        Self.logger.info("Activating VisionKit scanner in onAppear of camera view")
                                        try await self.scannerManager.setActiveScanner(.visionKit)
                                    }
                                    // Start monitoring (prepares scanner, sets to .ready)
                                    Self.logger.info("Starting monitoring in onAppear of camera view")
                                    try await self.scannerManager.startMonitoring()

                                    // Explicitly trigger the scan
                                    Self.logger.info("Triggering scan in onAppear of camera view")
                                    try await self.scannerManager.triggerScan()
                                    self.errorMessage = nil // Clear previous errors
                                } catch let anError as ScannerError {
                                    Self.logger.error("Camera onAppear: Failed to start/trigger: \(anError.localizedDescription)")
                                    errorMessage = "Scanner Error: \(anError.message)"
                                    isPresentingCamera = false // Close if setup fails
                                } catch {
                                    Self.logger.error("Camera onAppear: Unexpected error: \(error.localizedDescription)")
                                    self.errorMessage = "Failed to start scanner: \(error.localizedDescription)"
                                    self.isPresentingCamera = false // Close if setup fails
                                }
                            }
                        }
                        .onDisappear {
                            Self.logger.info("Camera view (fullScreenCover content) disappeared.")
                            self.scannerManager.stopMonitoring()
                        }

                    // Add Close button IF the current camera session is in multi-scan mode
                    if self.currentScannerSessionIsMultiScan {
                        Button {
                            Self.logger.info("Manual close button tapped for multi-scan camera view.")
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
                        Self.logger.error("VisionKitScanner instance not available for fullScreenCover.")
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
        Self.logger.info("Setting up VisionKit scanner for the example view.")
        do {
            if self.scannerManager.activeScannerType != .visionKit || self.scannerManager.status == .idle {
                Self.logger.info("Activating VisionKit scanner in setupScanner as it's not active or is idle.")
                try await self.scannerManager.setActiveScanner(.visionKit)
            } else if self.scannerManager.status != .ready, self.scannerManager.status != .scanning {
                Self.logger.info("VisionKit active but not ready/scanning. Attempting to start monitoring.")
                try await self.scannerManager.startMonitoring()
            }

            self.scannerManager.onBarcodeScanned = { barcode in
                Self.logger.info("BarcodeScanned callback: Received barcode: \(barcode)")
                self.customBarcode = barcode
                self.searchResult = "Last scanned: \(barcode)"

                var shouldCloseCameraView = true
                
                // Check the active VisionKit scanner's configuration
                if let activeVisionScanner = self.scannerManager.getVisionKitScanner() {
                    Self.logger.info("Active VisionKit scanner found. Recognizes multiple items: \(activeVisionScanner.recognizesMultipleItems)")
                    if activeVisionScanner.recognizesMultipleItems {
                        shouldCloseCameraView = false
                        Self.logger.info("Multi-item scan mode: Camera stays open for next scan.")
                    } else {
                        Self.logger.info("Single-item scan mode: Camera will close after this scan.")
                    }
                } else {
                    Self.logger.warning("Could not get VisionKitScanner instance in onBarcodeScanned to check 'recognizesMultipleItems' property. Assuming single scan.")
                }

                if shouldCloseCameraView {
                    Self.logger.info("Closing camera view programmatically.")
                    self.isPresentingCamera = false
                }
            }

            self.scannerManager.onStatusChanged = { status in
                Self.logger.info("StatusChanged callback: Status changed to: \(status.description)")
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
            Self.logger.error("Scanner setup failed: \(error.localizedDescription)")
            errorMessage = error.message
        } catch {
            Self.logger.error("Unexpected error during scanner setup: \(error.localizedDescription)")
            self.errorMessage = "An unexpected error occurred during scanner setup."
        }
    }

    private func checkCameraPermissionsAndPresent() async {
        Self.logger.info("Checking camera permissions before presenting camera view.")
        if self.scannerManager.activeScannerType != .visionKit || self.scannerManager.status == .error(.notAvailable) {
            Self.logger.info("Scanner not active or not available. Running setupScanner.")
            await self.setupScanner()
            if case .error = self.scannerManager.status {
                Self.logger.error("SetupScanner failed or did not resolve error. Cannot present camera. Error: \(self.errorMessage ?? "Unknown setup error")")
                return
            }
        }
        
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        var hasPermission = authStatus == .authorized

        if authStatus == .notDetermined {
            Self.logger.info("Camera permission not determined by AVFoundation, requesting access.")
            hasPermission = await AVCaptureDevice.requestAccess(for: .video)
            Self.logger.info("AVFoundation permission request result: \(hasPermission)")
            if hasPermission {
                try? await self.scannerManager.setActiveScanner(.visionKit)
            }
        }

        if hasPermission {
            Self.logger.info("Camera permissions are granted. Presenting camera.")
            self.errorMessage = nil
            self.isPresentingCamera = true
        } else {
            Self.logger.error("Camera permissions were denied or restricted.")
            self.errorMessage = "Camera access is required. Please enable it in Settings."
            if self.scannerManager.status != .error(.permissionDenied) {
                self.scannerManager.onStatusChanged?(.error(.permissionDenied))
            }
            self.isPresentingCamera = false
        }
    }
}

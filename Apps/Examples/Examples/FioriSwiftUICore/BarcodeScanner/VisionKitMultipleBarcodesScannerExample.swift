import FioriSwiftUICore
import Foundation
import OSLog
import SwiftUI

struct VisionKitMultipleBarcodesScannerExample: View {
    @StateObject private var scannerManager = BarcodeScannerManager(
        recognizedDataTypes: [.barcode()],
        recognizesMultipleItems: true
    )
    
    @State private var scannedBarcodes: [String] = []
    @State private var isScanning = false
    @State private var isTorchOn = false

    var body: some View {
        VStack {
            Text("Multiple Barcode Scanner")
                .font(.headline)
                .padding()
            
            if self.isScanning {
                // VisionKit scanner view
                VisionKitScannerRepresentable(
                    scannerManager: self.scannerManager,
                    isTorchOn: self.$isTorchOn,
                    onCancelTapped: { self.stopScanning() },
                    showCancelButton: true,
                    showFlashButton: true
                )
                .frame(height: 300)
                .cornerRadius(12)
                .padding()
            }
            
            // Scanned results list
            List(self.scannedBarcodes, id: \.self) { barcode in
                Text(barcode)
                    .font(.body)
            }
            .frame(height: 200)
            .cornerRadius(8)
            .padding()
            
            // Control buttons
            HStack(spacing: 20) {
                Button(self.isScanning ? "Stop Scanning" : "Start Scanning") {
                    self.isScanning ? self.stopScanning() : self.startScanning()
                }
                .buttonStyle(.borderedProminent)
                
                if self.scannerManager.getVisionKitScanner()?.isTorchAvailable ?? false {
                    Button(action: { self.isTorchOn.toggle() }) {
                        Image(systemName: self.isTorchOn ? "flashlight.on.fill" : "flashlight.off.fill")
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
        .onAppear {
            self.setupScannerCallbacks()
        }
    }
    
    // Configure scanner callbacks
    private func setupScannerCallbacks() {
        self.scannerManager.onBarcodeScanned = { barcode in
            // Add new barcode if not already in list
            guard !self.scannedBarcodes.contains(barcode) else { return }
            self.scannedBarcodes.append(barcode)
        }
        
        self.scannerManager.onStatusChanged = { status in
            print("Scanner status: \(status.description)")
            if case .error(let error) = status {
                print("Scanner error: \(error.localizedDescription)")
            }
        }
    }
    
    // Start scanning workflow
    private func startScanning() {
        Task {
            do {
                // Activate VisionKit scanner
                try await self.scannerManager.setActiveScanner(.visionKit)
                // Trigger scanning (starts camera feed)
                try await self.scannerManager.triggerScan()
                self.isScanning = true
            } catch {
                print("Failed to start scanning: \(error.localizedDescription)")
            }
        }
    }
    
    // Stop scanning workflow
    private func stopScanning() {
        self.scannerManager.stopMonitoring()
        self.isScanning = false
    }
}

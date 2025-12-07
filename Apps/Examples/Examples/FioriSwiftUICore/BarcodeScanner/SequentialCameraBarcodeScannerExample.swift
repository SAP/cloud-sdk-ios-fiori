import FioriSwiftUICore
import SwiftUI

struct SequentialCameraBarcodeScannerExample: View {
    // Initialize manager with 'recognizesMultipleItems: true' to keep camera open
    @StateObject private var scannerManager = BarcodeScannerManager(
        recognizedDataTypes: [.barcode()],
        recognizesMultipleItems: true
    )
    
    // State for the three text fields
    @State private var fieldValues: [String] = ["", "", ""]
    // Tracks which field is currently being populated (0, 1, or 2)
    @State private var activeFieldIndex: Int = 0
    // Tracks when the last valid scan occurred to prevent rapid-fire duplicates
    @State private var lastScanTime: Date = .distantPast
    
    @State private var isScanning = false
    @State private var isTorchOn = false
    @State private var statusMessage: String = "Ready to start"
    
    // Configuration: How long to wait between scans (seconds)
    private let scanDelay: TimeInterval = 2
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sequential Camera Scanning")
                .font(.headline)
                .padding(.top)
            
            // Status Indicator
            Text(self.statusMessage)
                .font(.subheadline)
                .foregroundColor(self.activeFieldIndex >= 3 ? .green : .blue)
                .padding(.bottom, 10)
            
            VStack(spacing: 15) {
                self.inputFieldRow(index: 0, label: "Item 1")
                self.inputFieldRow(index: 1, label: "Item 2")
                self.inputFieldRow(index: 2, label: "Item 3")
            }
            .padding(.horizontal)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 300)
                
                if self.isScanning {
                    VisionKitScannerRepresentable(
                        scannerManager: self.scannerManager,
                        isTorchOn: self.$isTorchOn,
                        onCancelTapped: {
                            self.stopScanning()
                        },
                        showCancelButton: true,
                        showFlashButton: true
                    )
                    .frame(height: 300)
                    .cornerRadius(12)
                    .overlay(
                        Group {
                            if Date().timeIntervalSince(self.lastScanTime) < self.scanDelay, self.activeFieldIndex < 3 {
                                ZStack {
                                    Color.black.opacity(0.3)
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    )
                } else {
                    VStack {
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        Text("Tap 'Start' to begin sequence")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            
            HStack(spacing: 20) {
                if !self.isScanning, self.activeFieldIndex < 3 {
                    Button("Start Sequence") {
                        self.startScanning()
                    }
                    .buttonStyle(.borderedProminent)
                } else if self.isScanning {
                    Button("Stop Scanning") {
                        self.stopScanning()
                    }
                    .buttonStyle(.bordered)
                }
                
                Button("Reset Form") {
                    self.resetForm()
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
            
            Spacer()
        }
        .onAppear {
            self.setupScannerCallbacks()
        }
        .onDisappear {
            self.stopScanning()
        }
    }
    
    private func inputFieldRow(index: Int, label: String) -> some View {
        HStack {
            Image(systemName: index < self.activeFieldIndex ? "checkmark.circle.fill" : "circle")
                .foregroundColor(index < self.activeFieldIndex ? .green : .gray)
            
            TextField(label, text: self.$fieldValues[index])
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(true) // Disable manual typing for this demo
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(self.activeFieldIndex == index && self.isScanning ? Color.blue : Color.clear, lineWidth: 2)
                )
        }
        .opacity(self.activeFieldIndex == index ? 1.0 : 0.6)
    }
    
    private func setupScannerCallbacks() {
        self.scannerManager.onBarcodeScanned = { barcode in
            self.handleScannedBarcode(barcode)
        }
        
        self.scannerManager.onStatusChanged = { status in
            if case .error(let error) = status {
                self.statusMessage = "Error: \(error.message)"
                self.isScanning = false
            }
        }
    }
    
    private func handleScannedBarcode(_ barcode: String) {
        guard self.activeFieldIndex < 3 else {
            if self.isScanning { self.stopScanning() }
            return
        }
        
        // Check if enough time has passed since the last scan.
        // Prevent the same barcode from instantly filling Field 1, 2, and 3 in milliseconds.
        let now = Date()
        guard now.timeIntervalSince(self.lastScanTime) >= self.scanDelay else {
            return
        }
        
        self.fieldValues[self.activeFieldIndex] = barcode
        self.lastScanTime = now
        self.activeFieldIndex += 1
        
        if self.activeFieldIndex >= 3 {
            self.statusMessage = "All items scanned!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.stopScanning()
            }
        } else {
            self.statusMessage = "Scan Item \(self.activeFieldIndex + 1)..."
        }
    }
    
    private func startScanning() {
        Task {
            do {
                try await self.scannerManager.setActiveScanner(.visionKit)
                try await self.scannerManager.triggerScan()
                self.isScanning = true
                self.statusMessage = "Scanning Item \(self.activeFieldIndex + 1)..."
            } catch {
                self.statusMessage = "Failed to start: \(error.localizedDescription)"
            }
        }
    }
    
    private func stopScanning() {
        self.scannerManager.stopMonitoring()
        self.isScanning = false
        if self.activeFieldIndex < 3 {
            self.statusMessage = "Scanning paused."
        }
    }
    
    private func resetForm() {
        self.stopScanning()
        self.fieldValues = ["", "", ""]
        self.activeFieldIndex = 0
        self.lastScanTime = Date.distantPast
        self.statusMessage = "Ready to start"
    }
}

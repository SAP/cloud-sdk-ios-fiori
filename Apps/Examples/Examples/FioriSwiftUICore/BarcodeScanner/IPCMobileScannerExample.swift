import FioriSwiftUICore
import SwiftUI

struct IPCMobileScannerExample: View {
    @ObservedObject var scannerManager: BarcodeScannerManager
    #if canImport(RapidScanCompanion)
        @State private var barcode1: String = ""
        @State private var barcode2: String = ""
        @State private var barcode3: String = ""
        @State private var description1: String = ""
        @State private var description2: String = ""
        @State private var customBarcode: String = ""
        @State private var searchResult: String = ""
        @State private var nextFieldIndex = 0
        @State private var errorMessage: String?

        var body: some View {
            VStack(alignment: .center) {
                Text("IPCMobile Scanner Example")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding(.top, 16)
            }
            ScrollView {
                VStack {
                    // Status
                    HStack(spacing: 0) {
                        Text("Status: ")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                        Text(self.scannerManager.status.description)
                            .font(.subheadline)
                            .foregroundColor(self.scannerManager.status == .ready ? .green : .blue)
                    }

                    // Error Message
                    if let errorMessage {
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                
                    // Barcode Fields
                    HStack(spacing: 20) {
                        Text("Barcode 1")
                        TextField("Scan with RapidScan", text: self.$barcode1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(true)
                    }
                    HStack(spacing: 20) {
                        Text("Barcode 2")
                        TextField("Scan with RapidScan", text: self.$barcode2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(true)
                    }
                    HStack(spacing: 20) {
                        Text("Barcode 3")
                        TextField("Scan with RapidScan", text: self.$barcode3)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(true)
                    }

                    // Description Fields
                    HStack(spacing: 20) {
                        Text("Description 1")
                        TextField("Enter description", text: self.$description1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack(spacing: 20) {
                        Text("Description 2")
                        TextField("Enter description", text: self.$description2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    // Custom Scan Section
                    VStack {
                        HStack(spacing: 20) {
                            TextField("Custom Barcode", text: self.$customBarcode)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .disabled(true)
                            Button("Scan") {
                                self.scannerManager.onBarcodeScanned = { barcode in
                                    self.customBarcode = barcode
                                    self.searchResult = "Searched with: \(barcode)"
                                    let cardConfig = IPCMobileDisplayCardConfig(
                                        message: "Scan completed: \(barcode)",
                                        width: 290,
                                        height: 150,
                                        backgroundColor: "#84D400",
                                        fontSize: 36,
                                        fontColor: "#000000",
                                        isBold: true,
                                        isUnderline: false,
                                        textYPosition: 8,
                                        playGoodSound: true
                                    )
                                    self.scannerManager.updateScannerDisplay(data: .ipcMobile(cards: [cardConfig]))
                                    self.scannerManager.onBarcodeScanned = nil
                                }
                            }
                        }
                        Text(self.searchResult)
                            .foregroundStyle(Color.yellow)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                .onAppear {
                    Task { await self.setupScanner() }
                }
            }
        }

        private func setupScanner() async {
            do {
                try await self.scannerManager.setActiveScanner(.ipcMobile)
                try await self.scannerManager.startMonitoring()
                self.scannerManager.onBarcodeScanned = { barcode in
                    switch self.nextFieldIndex {
                    case 0:
                        self.barcode1 = barcode
                        self.nextFieldIndex = 1
                    case 1:
                        self.barcode2 = barcode
                        self.nextFieldIndex = 2
                    case 2:
                        self.barcode3 = barcode
                        self.nextFieldIndex = 0
                    default:
                        break
                    }
                }
            } catch let error as ScannerError {
                errorMessage = error.message
            } catch {
                self.errorMessage = "An unexpected error occurred"
            }
        }
    #else
        var body: some View {
            EmptyView()
        }
    #endif
}

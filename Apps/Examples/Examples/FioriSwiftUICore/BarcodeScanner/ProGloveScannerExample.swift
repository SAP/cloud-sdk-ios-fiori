import FioriSwiftUICore
import SwiftUI
#if canImport(ConnectSDK)
    import ConnectSDK
#endif

struct ProGloveScannerExample: View {
    @ObservedObject var scannerManager: BarcodeScannerManager
    #if canImport(ConnectSDK)
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
                Text("ProGlove Scanner Example")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding(.top, 16)
            }
            ScrollView {
                VStack {
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
                        TextField("Scan with ProGlove", text: self.$barcode1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(true) // Read-only, updated by scanner
                    }
                    HStack(spacing: 20) {
                        Text("Barcode 2")
                        TextField("Scan with ProGlove", text: self.$barcode2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(true)
                    }
                    HStack(spacing: 20) {
                        Text("Barcode 3")
                        TextField("Scan with ProGlove", text: self.$barcode3)
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
                                    let screenData = PGScreenData(
                                        templateId: "PG3",
                                        templateFields: [
                                            PGTemplateField(fieldId: 1, header: "Item", content: barcode)
                                        ],
                                        refreshType: .fullRefresh,
                                        duration: 10000
                                    )
                                    self.scannerManager.updateScannerDisplay(data: .proGlove(screenData))
                                    self.scannerManager.onBarcodeScanned = nil
                                }
                            }
                            .disabled(self.scannerManager.status != .ready)
                        }
                        Text(self.searchResult)
                            .foregroundStyle(Color.yellow)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                .onAppear {
                    self.setupScanner()
                }
            }
        }

        private func setupScanner() {
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
        }
    #else
        var body: some View {
            EmptyView()
        }
    #endif
}

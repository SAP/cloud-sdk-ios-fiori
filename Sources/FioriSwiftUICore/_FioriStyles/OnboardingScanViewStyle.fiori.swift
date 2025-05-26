import AVFoundation
import FioriThemeManager
import Foundation
import PhotosUI
import SwiftUI

// Base Layout style
public struct OnboardingScanViewBaseStyle: OnboardingScanViewStyle {
    @StateObject var helper: OnboardingPhotoHelper = .init()
    @State var isQuickPickerPresented: Bool = false
    @State var isPhotoPickerPresented: Bool = false
    @State private var isPhotoLibraryAvailable = false
    @State private var isPhotoLibraryChecked = false
    @State private var isPhotoLibraryLimited = false
    @State private var isAlertPhotoLibraryNotAvailablePresented: Bool = false
    @State private var isTorchOn: Bool = false
    @State private var isInvalidateScanResult: Bool = false
    @State private var isConfirmationViewShown: Bool = false

    @StateObject private var scannerManager = BarcodeScannerManager(
        recognizedDataTypes: Set([.barcode()]),
        recognizesMultipleItems: false
    )
    
    public func makeBody(_ configuration: OnboardingScanViewConfiguration) -> some View {
        NavigationStack {
            ZStack {
                Color.preferredColor(.headerBlended).opacity(0.5)
                    .ignoresSafeArea()
                #if !os(visionOS)
                    if self.scannerManager.status == ScannerStatus.ready || self.scannerManager.status == ScannerStatus.scanning, let visionKitScanner = scannerManager.getVisionKitScanner() {
                        VisionKitScannerRepresentable(scanner: visionKitScanner, onCancelTapped: {}, isTorchOn: self.$isTorchOn)
                            .ignoresSafeArea(.all)
                    }
                #endif
                
                if !configuration.usesCameraOnly, !self.isConfirmationViewShown {
                    VStack(spacing: 0) {
                        Spacer()
                        
                        FioriButton { _ in
                            if self.isPhotoLibraryAvailable {
                                withAnimation {
                                    self.isQuickPickerPresented.toggle()
                                }
                            } else {
                                self.isAlertPhotoLibraryNotAvailablePresented.toggle()
                            }
                        } label: { _ in
                            Image(systemName: self.isQuickPickerPresented ? "chevron.down" : "chevron.up")
                                .font(.title)
                        }
                        .accessibilityLabel(self.isQuickPickerPresented ? "down arrow" : "up arrow")
                        .fioriButtonStyle(OnboardingGrayButtonStyle())
                        .frame(width: 44.0, height: UIDevice.current.userInterfaceIdiom == .phone ? 36.0 : 52.0)
                        #if !os(visionOS)
                            if self.isQuickPickerPresented {
                                OnboardingPhotoPickerView { image in
                                    self.helper.detectCode(image: image)
                                }
                            }
                        
                            FioriButton { _ in
                                if !self.isPhotoLibraryLimited {
                                    if self.isPhotoLibraryAvailable {
                                        withAnimation {
                                            self.isPhotoPickerPresented.toggle()
                                        }
                                    } else {
                                        self.isAlertPhotoLibraryNotAvailablePresented.toggle()
                                    }
                                }
                            } label: { _ in
                                Image(systemName: "photo")
                                    .font(.title)
                                    .foregroundStyle(Color.preferredColor(.secondaryLabel))
                            }
                            .fioriButtonStyle(OnboardingGrayButtonStyle())
                            .photosPicker(isPresented: self.$isPhotoPickerPresented, selection: self.$helper.photoPickerSelection, matching: .images, preferredItemEncoding: .automatic)
                            .frame(width: 44.0, height: UIDevice.current.userInterfaceIdiom == .phone ? 47.0 : 63.0)
                        #endif
                    }
                    .frame(maxWidth: .infinity)
                    .background(.clear)
                    .padding(.bottom, 0)
                }
                
                if self.isConfirmationViewShown {
                    if configuration.scanConfirmationView.isEmpty {
                        OnboardingScanConfirmView(hcpServer: "hcp.ondemand.com") {
                            configuration.didTapContinue?()
                        }
                    } else {
                        configuration.scanConfirmationView
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                self.toolbarContent(configuration)
            }
            .toolbarBackground(Color.preferredColor(.headerBlended).opacity(0.5), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .interactiveDismissDisabled()
        .onAppear {
            self.setup(configuration)
        }
        .onDisappear {
            self.scannerManager.stopMonitoring()
        }
        .modifier(AlertPhotoLibraryNotAvailableModifier(isPresented: self.$isAlertPhotoLibraryNotAvailablePresented, context: configuration.scanViewContext))
        .modifier(AlertNoQRCodeModifier(isPresented: self.$helper.detectFailed, context: configuration.scanViewContext))
        .modifier(AlertInvalidQRCodeModifier(isPresented: self.$isInvalidateScanResult, context: configuration.scanViewContext))
        .onChange(of: self.isPhotoPickerPresented) {
            self.controlScanner(shouldScanning: !self.isPhotoPickerPresented)
        }
        .onChange(of: self.isInvalidateScanResult) {
            self.controlScanner(shouldScanning: !self.isInvalidateScanResult)
        }
        .onChange(of: self.isAlertPhotoLibraryNotAvailablePresented) {
            self.controlScanner(shouldScanning: !self.isAlertPhotoLibraryNotAvailablePresented)
        }
        .onChange(of: self.helper.detectFailed) {
            self.controlScanner(shouldScanning: !self.helper.detectFailed)
        }
    }
    
    func setup(_ configuration: OnboardingScanViewConfiguration) {
        self.helper.detectResultCallback = { qrcode in
            if qrcode != "" {
                if let shouldValidateScanResult = configuration.shouldValidateScanResult, shouldValidateScanResult(qrcode) == false {
                    self.isInvalidateScanResult = true
                } else {
                    self.isConfirmationViewShown = true
                    if self.scannerManager.status == ScannerStatus.ready || self.scannerManager.status == ScannerStatus.scanning {
                        self.scannerManager.resetActiveScanner()
                    }
                }
            }
        }
        self.checkPhotoLibraryAvailable()
        self.setupScanner()
    }
    
    func controlScanner(shouldScanning: Bool) {
        if shouldScanning {
            Task {
                do {
                    if self.scannerManager.activeScannerType != .visionKit || self.scannerManager.status == .idle {
                        try await self.scannerManager.setActiveScanner(.visionKit)
                    } else if self.scannerManager.status != .ready, self.scannerManager.status != .scanning {
                        try await self.scannerManager.startMonitoring()
                    }
                    
                    try await self.scannerManager.triggerScan()
                }
            }
        } else {
            if self.scannerManager.status == ScannerStatus.ready || self.scannerManager.status == ScannerStatus.scanning {
                self.scannerManager.resetActiveScanner()
            }
        }
    }
    
    func switchFlash() {
        if let device = AVCaptureDevice.default(for: AVMediaType.video), device.hasTorch {
            do {
                try device.lockForConfiguration()
                if device.torchMode == .on {
                    device.torchMode = .off
                    self.isTorchOn = false
                } else {
                    do {
                        try device.setTorchModeOn(level: 1.0)
                        self.isTorchOn = true
                    } catch {}
                }
                device.unlockForConfiguration()
            } catch {}
        }
    }
    
    func checkPhotoLibraryAvailable() {
        defer {
            self.isPhotoLibraryChecked = true
        }
        if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.isPhotoLibraryAvailable = false
        }
        
        switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
        case .authorized:
            DispatchQueue.main.async {
                self.isPhotoLibraryAvailable = true
            }
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .denied, .restricted:
                    DispatchQueue.main.async {
                        self.isPhotoLibraryAvailable = false
                    }
                case .authorized:
                    DispatchQueue.main.async {
                        self.isPhotoLibraryAvailable = true
                    }
                case .limited:
                    DispatchQueue.main.async {
                        self.isPhotoLibraryAvailable = true
                        self.isPhotoLibraryLimited = true
                    }
                default:
                    break
                }
            }
        case .limited:
            DispatchQueue.main.async {
                self.isPhotoLibraryAvailable = true
                self.isPhotoLibraryLimited = true
            }
        default:
            DispatchQueue.main.async {
                self.isPhotoLibraryAvailable = false
            }
        }
    }
    
    private func setupScanner() {
        Task {
            do {
                if self.scannerManager.activeScannerType != .visionKit || self.scannerManager.status == .idle {
                    try await self.scannerManager.setActiveScanner(.visionKit)
                } else if self.scannerManager.status != .ready, self.scannerManager.status != .scanning {
                    try await self.scannerManager.startMonitoring()
                }
                
                self.scannerManager.getVisionKitScanner()?.showFlashButton = false
                self.scannerManager.getVisionKitScanner()?.showCancelButton = false
                
                try await self.scannerManager.triggerScan()
                
                self.scannerManager.onBarcodeScanned = { barcode in
                    self.helper.detectResultCallback?(barcode)
                }
            } catch {}
        }
    }
    
    @ToolbarContentBuilder
    private func toolbarContent(_ configuration: OnboardingScanViewConfiguration) -> some ToolbarContent {
        if !self.isConfirmationViewShown {
            ToolbarItem(placement: .principal) {
                Text(configuration.scanViewContext.scanViewTitleString)
            }
        }
        
        ToolbarItem(placement: .topBarLeading) {
            FioriButton(title: AttributedString("Cancel".localizedFioriString()), action: { _ in
                configuration.didCancel?()
            })
            .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .tint))
            .background(.clear)
        }
        #if !os(visionOS)
            if let device = AVCaptureDevice.default(for: AVMediaType.video), device.hasTorch, !isConfirmationViewShown {
                ToolbarItem(placement: .topBarTrailing) {
                    FioriButton { _ in
                        self.switchFlash()
                    } label: { _ in
                        Image(systemName: self.isTorchOn ? "bolt.fill" : "bolt")
                            .font(.body)
                    }
                    .accessibilityLabel(self.isTorchOn ? "flash deactivated" : "flash activated")
                    .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .tint))
                    .background(.clear)
                }
            }
        #endif
    }
}

// Default fiori styles
extension OnboardingScanViewFioriStyle {
    struct ContentFioriStyle: OnboardingScanViewStyle {
        func makeBody(_ configuration: OnboardingScanViewConfiguration) -> some View {
            OnboardingScanView(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

struct OnboardingGrayButtonStyle: FioriButtonStyle {
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.preferredColor(.secondaryLabel))
    }
}

struct AlertPhotoLibraryNotAvailableModifier: ViewModifier {
    @Binding var isPresented: Bool
    var context: OnboardingScanViewContext = .init()
    
    func body(content: Content) -> some View {
        content
            .alert(self.context.allowPhotoAccessTitleString, isPresented: self.$isPresented) {
                Button(self.context.notNowActionString, role: .cancel, action: {
                    self.isPresented.toggle()
                })
                
                Button(self.context.settingsActionString, action: {
                    self.isPresented.toggle()
                    guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
                    if UIApplication.shared.canOpenURL(settingsURL) {
                        UIApplication.shared.open(settingsURL)
                    }
                })
            } message: {
                Text(self.context.allowPhotoAccessMessageString)
            }
    }
}

struct AlertNoQRCodeModifier: ViewModifier {
    @Binding var isPresented: Bool
    var context: OnboardingScanViewContext = .init()
    
    func body(content: Content) -> some View {
        content
            .alert(self.context.scanUnsuccessfulTitleString, isPresented: self.$isPresented) {
                Button(self.context.okButtonString, role: .cancel, action: {
                    self.isPresented.toggle()
                })
            } message: {
                Text(self.context.scanUnsuccessfulMessageString)
            }
    }
}

struct AlertInvalidQRCodeModifier: ViewModifier {
    @Binding var isPresented: Bool
    var context: OnboardingScanViewContext = .init()
    
    func body(content: Content) -> some View {
        content
            .alert(self.context.invalidQRCodeTitleString, isPresented: self.$isPresented) {
                Button(self.context.okButtonString, role: .cancel, action: {
                    self.isPresented.toggle()
                })
            } message: {
                Text(self.context.invalidQRCodeMessageString)
            }
    }
}

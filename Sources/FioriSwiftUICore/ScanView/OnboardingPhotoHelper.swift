import _PhotosUI_SwiftUI
import Combine
import Foundation
import PhotosUI
import SwiftUI
import Vision
import VisionKit

class OnboardingPhotoHelper: ObservableObject {
    @Published var photoPickerSelection: PhotosPickerItem? {
        didSet {
            if let photoPickerSelection {
                self.loadTransferable(from: photoPickerSelection)
            }
        }
    }
    
    @Published var detectFailed = false
    var detectResultCallback: ((String) -> Void)?
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) {
        Task {
            guard let imageData = try await imageSelection.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            self.detectCode(image: inputImage)
        }
    }
    
    func detectCode(image: UIImage) {
        guard let ciImage = CIImage(image: image) else { return }
        let request = VNDetectBarcodesRequest { request, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    self.detectFailed = true
                    self.resetValues()
                }
                return
            }
            guard let results = request.results as? [VNBarcodeObservation],
                  let firstCode = results.first?.payloadStringValue
            else {
                DispatchQueue.main.async {
                    self.detectFailed = true
                    self.resetValues()
                }
                return
            }
            DispatchQueue.main.async {
                self.detectResultCallback?(firstCode)
                self.resetValues()
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            try? VNImageRequestHandler(ciImage: ciImage).perform([request])
        }
    }
    
    func resetValues() {
        self.photoPickerSelection = nil
    }
}

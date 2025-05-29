import Photos
import SwiftUI

struct OnboardingPhotoPickerView: View {
    @State private var assets: PHFetchResult<PHAsset>?
    @State private var cachedImages: [UIImage?] = []
    @State private var cachingImageManager: PHCachingImageManager?
    @Environment(\.displayScale) private var displayScale
    private static let itemSize = CGSize(width: 80, height: 80)
    private var imageSize: CGSize {
        CGSize(width: Self.itemSize.width * min(self.displayScale, 2), height: Self.itemSize.height * min(self.displayScale, 2))
    }
    
    var selectedImage: ((UIImage) -> Void)?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(0 ..< self.cachedImages.count, id: \.self) { index in
                    if let image = cachedImages[index] {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: OnboardingPhotoPickerView.itemSize.width, height: OnboardingPhotoPickerView.itemSize.height)
                            .clipped()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.selectedImage?(image)
                            }
                            .accessibilityIdentifier("Photo \(index)")
                            .accessibilityLabel(String(format: NSLocalizedString("Photo", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), index))
                            .accessibilityAddTraits(.isImage)
                    } else {
                        ProgressView()
                            .scaleEffect(0.5)
                            .frame(width: OnboardingPhotoPickerView.itemSize.width, height: OnboardingPhotoPickerView.itemSize.height)
                    }
                }
            }
        }
        .task {
            self.requestPhotoAccess()
        }
    }
    
    private func requestPhotoAccess() {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                self.loadAssets()
            }
        }
    }
    
    private func loadAssets() {
        let options = PHFetchOptions()
        options.fetchLimit = 20
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        assets = PHAsset.fetchAssets(with: .image, options: options)
        
        self.cachingImageManager = PHCachingImageManager()
        
        if let assets, assets.count > 0 {
            let count = min(assets.count, 20)
            let assetsToCache = Array(0 ..< count).map { assets[$0] }
            self.cachingImageManager?.startCachingImages(for: assetsToCache,
                                                         targetSize: self.imageSize,
                                                         contentMode: .aspectFill,
                                                         options: nil)
            
            self.cachedImages = Array(repeating: nil, count: count)
            
            self.loadImages()
        }
    }
    
    private func loadImages() {
        guard let assets, let manager = cachingImageManager else { return }
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isNetworkAccessAllowed = true
        
        for i in 0 ..< min(assets.count, 20) {
            let asset = assets[i]
            manager.requestImage(
                for: asset,
                targetSize: self.imageSize,
                contentMode: .aspectFill,
                options: requestOptions
            ) { image, _ in
                DispatchQueue.main.async {
                    if let image, i < cachedImages.count {
                        self.cachedImages[i] = image
                    }
                }
            }
        }
    }
}

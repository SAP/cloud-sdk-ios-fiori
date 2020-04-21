//
//  AsyncImageView.swift
//  AnyCodable
//
//  Created by Ma, Xiao on 2/25/20.
//

import Foundation
import SwiftUI
import Combine
import UIKit

struct AsyncImageView: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    
    init(url: String?) {
        self.imageLoader.load(imageName: url)
    }
    
    var body: some View {
        makeBody()
    }
    
    func makeBody() -> AnyView {
        guard let image = self.imageLoader.image else {
            return AnyView(EmptyView())
        }
        return AnyView(
            Image(uiImage: image)
                .resizable()
        )
    }
}

final class ImageLoader: ObservableObject {
    var imageCache = ImageCache.getImageCache()
    
    @Published var image: UIImage?
    
    func load(imageName: String?) {
        guard let name = imageName else {
            return
        }
        
        if loadImageFromCache(name) {
            return
        }

        NetworkService.shared.getIcon(iconName: name) { (succeed, image, err) in
            guard succeed, let image = image else {
                if err != nil { print(String(describing: err)) }
                DispatchQueue.main.async {
                    self.image = nil
                }
                return
            }
            
            print("Got an image with: \(name)")
            self.imageCache.set(forKey: name, image: image)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    func loadImageFromCache(_ imageName: String) -> Bool {

        guard let cacheImage = imageCache.get(forKey: imageName) else {
            return false
        }
        
        image = cacheImage
        return true
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}

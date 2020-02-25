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
    @Published var image: UIImage?
    
    func load(imageName: String?) {
        guard let name = imageName else {
            return
        }
        
        NetworkService.shared.getIcon(iconName: name) { (succeed, image, err) in
            guard succeed else {
                print(err!)
                DispatchQueue.main.async {
                    self.image = nil
                }
                return
            }
            
            print("got an image")
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

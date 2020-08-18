//
//  Manifest.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/22/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import Zip

public class Manifest: Decodable, Identifiable, ObservableObject {
    @Published public var app: App
    @Published public var card: Card
    
    public var id: String {
        return app.id
    }
    
    public var baseURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case app = "sap.app"
        case card = "sap.card"
    }
    
    required public init(from decoder: Decoder) throws {
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        let tempApp = try _container.decode(App.self, forKey: .app)
        _app = Published(initialValue: tempApp)
        
        let tempCard = try _container.decode(Card.self, forKey: .card)
        _card = Published(initialValue: tempCard)
    }

/**
    Initializer for a Manifest stored remotely
     - Parameter path: base URL to card bundle stored on a server
     - Parameter manifestPath: optional; specify path component for manifest.json if manifest.json is not stored as `manifest.json` in base folder

     ## Code usage:
     ```
     let manifest = try Manifest(withCardBundleAt: URL(string: "https://openui5.hana.ondemand.com/test-resources/sap/ui/integration/demokit/cardExplorer/webapp/")!, manifestPath: "samples/data/manifest.json")
     ```
     */
    public init(withCardBundleAt path: URL, manifestPath: String? = nil) throws {
        var _model: Manifest!
        let _path = path.appendingPathComponent(manifestPath ?? "manifest.json")
        do {
            let data = try Data(contentsOf: _path)
            _model = try JSONDecoder().decode(Manifest.self, from: data)
        } catch {
            print(error)
        }
        self.app        = _model.app
        self.card       = _model.card
        self.baseURL    = path
        self.card.loadDataIfNeeded(baseURL: self.baseURL)
    }
    
    public init(with fileName: String) throws {
        let destinationDir = FileManager.default.temporaryDirectory.appendingPathComponent(fileName, isDirectory: true)
        if FileManager.default.fileExists(atPath: destinationDir.path) {
            baseURL = destinationDir
        } else {
            let sourceFile = Bundle.main.url(forResource: fileName, withExtension: ".zip")!
            do {
                try Zip.unzipFile(sourceFile, destination: FileManager.default.temporaryDirectory, overwrite: true, password: nil)
                baseURL = destinationDir
            } catch {
                print(error)
            }
        }
        
        var _model: Manifest!
        let path = destinationDir.appendingPathComponent("manifest.json")
        do {
            let data = try Data(contentsOf: path)
            _model = try JSONDecoder().decode(Manifest.self, from: data)
        } catch {
            print(error)
        }
        
        self.app    = _model.app
        self.card   = _model.card
        
        self.card.loadDataIfNeeded(baseURL: self.baseURL)
    }
}

extension Manifest: Hashable {
    public static func == (lhs: Manifest, rhs: Manifest) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(app)
        hasher.combine(card)
    }
}

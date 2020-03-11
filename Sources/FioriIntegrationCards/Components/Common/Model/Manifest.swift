//
//  Manifest.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/22/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

public class Manifest: Decodable, Identifiable, ObservableObject {
    @Published public var app: App
    @Published public var card: Card
    
    public var id: String {
        return app.id
    }
    
    enum CodingKeys: String, CodingKey {
        case app = "sap.app"
        case card = "sap.card"
    }
    
    required public init(from decoder: Decoder) throws {
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        app = try _container.decode(App.self, forKey: .app)
        card = try _container.decode(Card.self, forKey: .card)
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

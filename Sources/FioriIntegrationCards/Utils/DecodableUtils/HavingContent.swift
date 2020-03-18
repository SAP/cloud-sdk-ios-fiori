//
//  HavingContent.swift
//  FioriSwiftUI
//
//  Created by Stan Stadelman on 3/18/20.
//

import Foundation

public struct HavingContent<ContentModel: Decodable>: Decodable {
    let content: ContentModel
}

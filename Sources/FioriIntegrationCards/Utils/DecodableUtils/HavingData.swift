//
//  HavingData.swift
//  FioriSwiftUI
//
//  Created by Stan Stadelman on 3/18/20.
//

import Foundation

public struct HavingData<Model: Decodable>: Decodable {
    let data: Model
}

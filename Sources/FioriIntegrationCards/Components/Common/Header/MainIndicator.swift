//
//  MainIndicator.swift
//  DevTest
//
//  Created by Ma, Xiao on 1/23/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

public struct MainIndicator: Decodable, Hashable {
    let number: String
    let unit: String
    let trend: String
    let state: String
}

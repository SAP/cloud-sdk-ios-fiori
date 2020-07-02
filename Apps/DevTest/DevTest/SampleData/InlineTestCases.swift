//
//  InlineTestCases.swift
//  DevTest
//
//  Created by Ma, Xiao on 6/30/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import FioriIntegrationCards

enum InlineTestCases: String, CaseIterable, Identifiable {
    case analytical = "analytical"
    case list = "list"
    
    var id: String {
        return rawValue
    }
    
    func path() -> URL? {
        let bundle = Bundle.main.url(forResource: self.id, withExtension: "json")
        return bundle
    }
    
    func manifest() -> Manifest? {
        guard let path = path() else {
            return nil
        }
        do {
            let data = try Data(contentsOf: path)
            return try JSONDecoder().decode(Manifest.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}

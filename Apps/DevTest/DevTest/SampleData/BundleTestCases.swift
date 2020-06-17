//
//  BundleTestCases.swift
//  DevTest
//
//  Created by Ma, Xiao on 6/17/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import FioriIntegrationCards

enum BundleTestCases: String, CaseIterable, Identifiable {
    case HTTPTimelineVarients = "HTTPTimelineVariants.card"
    case BundleTimelineVarients = "TimelineVariants.card"
    
    var id: String {
        return rawValue
    }
    
    func manifest() -> Manifest? {
        do {
            let model = try Manifest.init(with: self.id)
            return model
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

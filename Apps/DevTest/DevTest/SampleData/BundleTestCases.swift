//
//  BundleTestCases.swift
//  DevTest
//
//  Created by Ma, Xiao on 6/17/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import FioriIntegrationCards
import Zip

enum BundleTestCases: String, CaseIterable, Identifiable {
    case HTTPTimelineVarients       = "HTTPTimelineVariants.card"
    case HTTPObjectVarients         = "HTTPObjectVariants.card"
    case BundleTimelineVarients     = "TimelineVariants.card"
    case BundleObjectVarients       = "ObjectVariants.card"
    
    var id: String {
        return rawValue
    }
    
    func path() -> URL? {
        
        let destinationDir = FileManager.default.temporaryDirectory.appendingPathComponent(rawValue, isDirectory: true)
        if FileManager.default.fileExists(atPath: destinationDir.path) {
            return destinationDir
        } else {
            let sourceFile = Bundle.main.url(forResource: rawValue, withExtension: "zip")!
            do {
                try Zip.unzipFile(sourceFile, destination: FileManager.default.temporaryDirectory, overwrite: true, password: nil)
                return destinationDir
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    func manifest() -> Manifest? {
        guard let url = path() else {
            return nil
        }
        do {
            let model = try Manifest.init(withCardBundleAt: url)
            return model
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

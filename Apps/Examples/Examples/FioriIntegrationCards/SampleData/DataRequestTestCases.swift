//
//  DataRequestTestCases.swift
//  Examples
//
//  Created by Eidinger, Marco on 8/17/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import FioriIntegrationCards

enum DataRequestTestCases: String, CaseIterable, Identifiable, CardTestCase {
    case ListDataRequestStaticData = "list (load data with request)"

    var id: String {
        return rawValue
    }

    func name() -> String {
        return rawValue
    }

    func path() -> URL? {
        return nil
    }

    func manifest() -> Manifest? {
        do {
            return try Manifest(withCardBundleAt: URL(string: "https://openui5.hana.ondemand.com/test-resources/sap/ui/integration/demokit/cardExplorer/webapp/")!, manifestPath: "samples/data/manifest.json")
        } catch {
            print(error)
        }
        return nil
    }
}


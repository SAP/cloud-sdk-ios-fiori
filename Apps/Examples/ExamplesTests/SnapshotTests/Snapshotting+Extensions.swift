//
//  Snapshotting+Extensions.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/15/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import SwiftUI
import SnapshotTesting

// https://github.com/V8tr/SnapshotTestingSwiftUI/blob/master/SnapshotTestingSwiftUITests/SnapshotTesting%2BSwiftUI.swift
extension Snapshotting where Value: SwiftUI.View, Format == UIImage {

    static func image(
        drawHierarchyInKeyWindow: Bool = false,
        precision: Float = 1,
        size: CGSize? = nil,
        traits: UITraitCollection = .init()
    ) -> Snapshotting {
        Snapshotting<UIViewController, UIImage>.image(
            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
            precision: precision,
            size: size,
            traits: traits
        )
        .pullback(UIHostingController.init(rootView:))
    }
}

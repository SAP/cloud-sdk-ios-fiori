//
//  SwiftUI+Extensions.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/15/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import SwiftUI

extension SwiftUI.View {
    func toVC(size: CGSize? = nil) -> UIViewController {
        guard let refSize = size else {
            return UIHostingController(rootView: self)
        }
        let copiedView = self.frame(width: refSize.width, height: refSize.height)
        return UIHostingController(rootView: copiedView)
    }
}

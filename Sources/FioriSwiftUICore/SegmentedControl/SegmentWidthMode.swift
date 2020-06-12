//
//  SegmentWidthMode.swift
//  FioriSwiftUICore
//
//  Created by Ma, Xiao on 5/4/20.
//

import Foundation
import UIKit
/// An enum for setting the segment mode in `SegmentedControl`
@frozen public enum SegmentWidthMode: Equatable {
    /// Fixed width for all the segments
    case fixed(CGFloat)
    /// Width based on content width
    case intrinsic
    /// Width equal to the maximum width among all segments
    case maximum
    /// Equal width to fill the space
    case equal
}

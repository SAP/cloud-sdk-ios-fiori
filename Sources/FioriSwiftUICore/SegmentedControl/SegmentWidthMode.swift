//
//  SegmentWidthMode.swift
//  FioriSwiftUICore
//
//  Created by Ma, Xiao on 5/4/20.
//

import Foundation
import UIKit
/// An enum for setting the segment mode in `SegmentedControl`
public enum SegmentWidthMode {
    /// Fixed size for all the segments
    case fixed(CGFloat)
    /// Auto - fitting
    case intrinsic
    /// This will take the longest title in the segments as the width.
    case maximum
}

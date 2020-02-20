//
//  Color+Extensions.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/3/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

enum StatusState: String {
    case waring     = "Warning"
    case error      = "Error"
    case success    = "Success"
}

extension Color {
    static func forStatus(status: String?) -> Color {
        guard let statusString = status else {
            return Color.black
        }
        let _status = StatusState(rawValue: statusString)
        switch _status {
        case .error:
            return Color.red
        case .success:
            return Color.green
        case .waring:
            return Color.orange
        case .none:
            return Color.black
        }
    }
    
    static let lightGray = {
        return Color(UIColor.lightGray)
    }()
    
    static func getTrendColor(trend: String?) -> Color {
        guard let _trend = trend else {
            return .black
        }
        return _trend == "Down" ? Color.init(red: 187/255, green: 0, blue: 0) : .green
    }
    
    static func getLinkColor(type: String?) -> Color {
        guard let _ = type else {
            return .black
        }
        return .blue
    }
}

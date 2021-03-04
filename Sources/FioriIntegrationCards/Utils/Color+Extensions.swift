import SwiftUI

enum StatusState: String {
    case waring = "Warning"
    case error = "Error"
    case success = "Success"
    case good = "Good"
    case critical = "Critical"
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
        case .success, .good:
            return Color.green
        case .waring, .critical:
            return Color.orange
        case .none:
            return Color.black
        }
    }
    
    static let darkGray = {
        Color(UIColor.darkGray)
    }()
    
    static let lightGray = {
        Color(UIColor.lightGray)
    }()
    
    static func getTrendColor(trend: String?) -> Color {
        guard let _trend = trend else {
            return .black
        }
        return _trend == "Down" ? Color(red: 187 / 255, green: 0, blue: 0) : .green
    }

    static func getKpiColor(trend: String?, state: String?) -> Color {
        if state != nil {
            return Color.forStatus(status: state)
        } else {
            return Color.getTrendColor(trend: trend)
        }
    }
    
    static func getLinkColor(type: String?) -> Color {
        guard let _ = type else {
            return .black
        }
        return .blue
    }
}

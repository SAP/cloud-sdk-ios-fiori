//
//  NumericHeader.swift
//  AnyCodable
//
//  Created by Stan Stadelman on 3/18/20.
//

import Foundation

public struct NumericHeader: Decodable, Hashable {
    public let type: String
    public let title: String
    public let subTitle: String?
    public let actions: [Action]?
    public let unitOfMeasurement: String?
    public let mainIndicator: MainIndicator?
    public let details: String?
    public let sideIndicators: [SideIndicator]?
    public let status: Status?
}

extension NumericHeader:  Placeholding {
        func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> NumericHeader {
            ///TODO:  implement replacingPlaceholders for NumericHeader
//            let _type        = type?.replacingPlaceholders(withValuesIn: dictionary)
//            let _title       = title.replacingPlaceholders(withValuesIn: dictionary)
//            let _subTitle    = subTitle?.replacingPlaceholders(withValuesIn: dictionary)
//            let _actions     = actions /// TODO:  implement replacingPlaceholders for `actions`
//            let _icon        = icon?.replacingPlaceholders(withValuesIn: dictionary)
//            let _status      = status?.replacingPlaceholders(withValuesIn: dictionary)
            return self//DefaultHeader(type: _type, title: _title, subTitle: _subTitle, actions: _actions, icon: _icon, status: _status)
        }
}

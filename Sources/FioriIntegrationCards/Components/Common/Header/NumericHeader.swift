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
            
            let _type               = type.replacingPlaceholders(withValuesIn: dictionary)
            let _title              = title.replacingPlaceholders(withValuesIn: dictionary)
            let _subTitle           = subTitle?.replacingPlaceholders(withValuesIn: dictionary)
            let _unitOfMeasurement  = unitOfMeasurement?.replacingPlaceholders(withValuesIn: dictionary)
            let _details            = details?.replacingPlaceholders(withValuesIn: dictionary)
            let _status             = status?.replacingPlaceholders(withValuesIn: dictionary)
            let _sideIndicators     = sideIndicators?.map({ $0.replacingPlaceholders(withValuesIn: dictionary) })
            let _mainIndicator      = mainIndicator?.replacingPlaceholders(withValuesIn: dictionary)
            let _actions            = actions?.map({ $0.replacingPlaceholders(withValuesIn: dictionary) })
            
            return NumericHeader(type: _type, title: _title, subTitle: _subTitle, actions: _actions, unitOfMeasurement: _unitOfMeasurement, mainIndicator: _mainIndicator, details: _details, sideIndicators: _sideIndicators, status: _status)
 
        }
}

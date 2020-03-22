//
//  SideIndicator.swift
//  DevTest
//
//  Created by Ma, Xiao on 1/23/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

public struct SideIndicator: Decodable, Hashable {
    let title: String
    let number: String
    let unit: String
}

extension SideIndicator: Placeholding {
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> SideIndicator {
        let _title  = title.replacingPlaceholders(withValuesIn: dictionary)
        let _number = number.replacingPlaceholders(withValuesIn: dictionary)
        let _unit   = unit.replacingPlaceholders(withValuesIn: dictionary)
        return SideIndicator(title: _title, number: _number, unit: _unit)
    }
}

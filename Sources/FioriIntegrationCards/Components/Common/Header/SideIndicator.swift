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
    public func replacingPlaceholders(withValuesIn object: Any) -> SideIndicator {
        let _title  = title.replacingPlaceholders(withValuesIn: object)
        let _number = number.replacingPlaceholders(withValuesIn: object)
        let _unit   = unit.replacingPlaceholders(withValuesIn: object)
        return SideIndicator(title: _title, number: _number, unit: _unit)
    }
}

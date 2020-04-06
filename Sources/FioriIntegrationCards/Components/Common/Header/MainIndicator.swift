//
//  MainIndicator.swift
//  DevTest
//
//  Created by Ma, Xiao on 1/23/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

public struct MainIndicator: Decodable, Hashable {
    let number: String
    let unit: String
    let trend: String
    let state: String
}

extension MainIndicator: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> MainIndicator {
        let _number = number.replacingPlaceholders(withValuesIn: object)
        let _unit = unit.replacingPlaceholders(withValuesIn: object)
        let _trend = trend.replacingPlaceholders(withValuesIn: object)
        let _state = state.replacingPlaceholders(withValuesIn: object)
        return MainIndicator(number: _number, unit: _unit, trend: _trend, state: _state)
    }
    
}

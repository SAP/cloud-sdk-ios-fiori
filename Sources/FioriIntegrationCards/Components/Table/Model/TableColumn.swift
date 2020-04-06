//
//  TableColumn.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct TableColumn: Identifiable, Decodable, Hashable {
    public let title: String?
    public let width: String?
    public let value: String?
    public let icon: Icon?
    public let state: String?
    public let url: String?
    public let target: String?
    public let identifier: Bool?
    public let progressIndicator: String?
    public let id: UUID = UUID()
}

extension TableColumn: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> TableColumn {
        let _value               = value?.replacingPlaceholders(withValuesIn: object)
        let _title               = title?.replacingPlaceholders(withValuesIn: object)
        let _width               = width?.replacingPlaceholders(withValuesIn: object)
        let _icon                = icon?.replacingPlaceholders(withValuesIn: object)
        let _state               = state?.replacingPlaceholders(withValuesIn: object)
        let _url                 = url?.replacingPlaceholders(withValuesIn: object)
        let _target              = target?.replacingPlaceholders(withValuesIn: object)
        let _identifier          = identifier
        let _progressIndicator   = progressIndicator?.replacingPlaceholders(withValuesIn: object)
        return TableColumn(title: _title, width: _width, value: _value, icon: _icon, state: _state, url: _url, target: _target, identifier: _identifier, progressIndicator: _progressIndicator)
    }
    
}

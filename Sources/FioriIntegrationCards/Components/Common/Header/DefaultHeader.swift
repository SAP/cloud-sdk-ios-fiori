//
//  DefaultHeader.swift
//  AnyCodable
//
//  Created by Stan Stadelman on 3/18/20.
//

import Foundation

public struct DefaultHeader: Decodable, Hashable {
    public let type: String?
    public let title: String
    public let subTitle: String?
    public let actions: [Action]?
    public let icon: Icon?
    public let status: Status?
}

extension DefaultHeader: Equatable {
    public static func == (lhs: DefaultHeader, rhs: DefaultHeader) -> Bool {
        return lhs.type == rhs.type &&
            lhs.title == rhs.title &&
            lhs.subTitle == rhs.subTitle &&
            lhs.actions == rhs.actions &&
            lhs.icon == rhs.icon &&
            lhs.status == rhs.status
    }
}

//
//  Status.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import SwiftUI

public struct Status: Decodable, AnyBodyProducing {
    public let text: String?
    
    func body() -> AnyView {
        switch text?.trimmed() {
        case .none:
            return AnyView(EmptyView())
        case .some(let value):
            return AnyView(Text(value))
        }
    }
}

extension Status: Placeholding {
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> Status {
        guard let value = text else { return self }
        return Status(text: value.replacingPlaceholders(withValuesIn: dictionary))
    }
    
}

extension Status: Hashable {
    
}

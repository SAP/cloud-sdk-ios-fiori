//
//  View+SafeView.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    
    func SafeView(_ value: AnyBodyProducing?) -> AnyView {
        switch value {
        case .none:
            return AnyView(EmptyView())
        case .some(var value):
            return value.body()
        }
    }
    
    func SafeText(_ string: String?) -> AnyView {
        switch string {
        case .none:
            return AnyView(EmptyView())
        case .some(let value):
            return AnyView(Text(value))
        }
    }
}

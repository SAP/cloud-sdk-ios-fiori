//
//  HeaderView.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import SwiftUI


struct HeaderView: View {
    
    let model: Header
    
    var body: some View {
        makeBody()
    }
    
    func makeBody() -> AnyView {
        switch model {
        case .default(let value):
            return AnyView(DefaultHeaderView(model: value))
        default:
            return AnyView(EmptyView())
        }
    }
}

struct DefaultHeaderView: View {
    
    let model: DefaultHeader
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            SafeView(model.icon).background(Color.white)
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    SafeText(model.title).font(.headline)
                    SafeView(model.status).font(.footnote)
                }
                SafeText(model.subTitle)
            }
        }
    }
}

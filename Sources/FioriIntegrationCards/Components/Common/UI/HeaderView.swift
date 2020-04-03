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
            case .numeric(let value):
                return AnyView(NumericHeaderView(model: value))
        }
    }
}

private struct DefaultHeaderView: View {
    
    let model: DefaultHeader

    init(model: DefaultHeader) {
        self.model = model
        self.model.icon?.size = 40
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            SafeView(self.model.icon)
                .frame(width: 45, height: 45, alignment: .center)
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    SafeText(model.title).font(.headline)
                    SafeView(model.status).font(.footnote)
                }
                SafeText(model.subTitle).foregroundColor(.gray)
            }
        }
    }
}

private struct NumericHeaderView: View {
    
    let model: NumericHeader
    
    var body: some View {
        VStack(alignment: .leading) {
            
            SafeText(model.title).font(.headline)
            HStack {
                SafeText(model.subTitle).foregroundColor(Color.gray)
                SafeText(" | ").foregroundColor(Color.gray)
                SafeText(model.unitOfMeasurement).foregroundColor(Color.gray)
            }
            HStack {
                SafeText(model.mainIndicator?.number).foregroundColor(Color.getTrendColor(trend: model.mainIndicator?.trend))
                    .font(.system(size: 40)).fixedSize(horizontal: false, vertical: true)
                VStack {
                    PolygonView(trend: model.mainIndicator?.trend)
                    SafeText(model.mainIndicator?.unit)
                }.padding(.trailing, 50)
                
                VStack {
                    SafeText("Target").foregroundColor(Color.gray)
                    HStack {
                        SafeText(model.sideIndicators?.first?.number)
                        SafeText(model.sideIndicators?.first?.unit)
                    }
                }.padding(.trailing, 10)
                
                VStack {
                    SafeText("Deviation").foregroundColor(Color.gray)
                    HStack {
                        SafeText(model.sideIndicators?.last?.number)
                        SafeText(model.sideIndicators?.last?.unit)
                    }
                }
            }.padding(.bottom, 10)
            SafeText(model.details).foregroundColor(Color.gray).font(.system(size: 15))
        }
    }
}

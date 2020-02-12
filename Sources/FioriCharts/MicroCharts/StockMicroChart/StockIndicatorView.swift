//
//  StockIndicatorView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct StockIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    
    var rect: CGRect
    
    @Binding var closestPoint:CGPoint
    @Binding var closestDataIndex:Int
    
    var body: some View {
        let x = closestPoint.x
        let date = StockUtility.categoryValueInDate(model, categoryIndex: closestDataIndex)
        let hour = Calendar.current.component(.hour, from: date!)
        let price = StockUtility.dimensionValue(model, categoryIndex: closestDataIndex)
        let df = DateFormatter()
        df.dateStyle = .medium
        if hour == 0 {
            df.timeStyle = .none
        }
        else {
            df.timeStyle = .medium
        }
        
        return ZStack {
            LineShape(pos1: CGPoint(x: x, y: rect.origin.y), pos2: CGPoint(x: x, y: rect.origin.y + rect.size.height), color: .black)
            
            Text(String(price!))
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.gray)
                .cornerRadius(4)
                .foregroundColor(Color.white)
                .shadow(color: .gray, radius: 6, x: 0, y: 6)
                .position(x: x, y: rect.origin.y)
            
            Text(df.string(from: date!))
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.gray)
                .cornerRadius(4)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 6, x: 0, y: 6)
                .position(x: x, y: rect.origin.y + rect.size.height)
            
            
            IndicatorPoint().position(self.closestPoint)
        }
    }
}

struct StockIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        StockIndicatorView(rect: CGRect(x: 0, y: 0, width: 300, height: 200), closestPoint: .constant(CGPoint(x: 100, y: 80)), closestDataIndex: .constant(3)).environmentObject(Tests.stockModels[1])
        .frame(width:300, height: 200, alignment: .topLeading)
        .padding(32)
        .previewLayout(.sizeThatFits)
    }
}

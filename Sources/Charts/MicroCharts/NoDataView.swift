//
//  NoDataView.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/5/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        GeometryReader { proxy in
            Text("No Data")
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                .border(Color.primary, width: 1)
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
            .frame(width: 320, height: 94, alignment: .center)
            .previewLayout(.sizeThatFits)
    }
}

//
//  NoDataView.swift
//  
//
//  Created by Eidinger, Marco on 8/27/20.
//

import SwiftUI

public struct NoDataView: View {
    public init() {}
    public var body: some View {
        GeometryReader { proxy in
            Text("No Data", bundle: Bundle.module)
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
        .environment(\.locale, .init(identifier: "de"))
  }
}

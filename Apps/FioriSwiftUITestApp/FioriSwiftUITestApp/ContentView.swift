//
//  ContentView.swift
//  FioriSwiftUITestApp
//
//  Created by Ma, Xiao on 3/19/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import SwiftUI
import FioriSwiftUI

struct ContentView: View {
    
    var body: some View {
        
        DimensionSelector(titles: [
            "1D",
            "1W",
            "1M",
            "1Q",
            "YTD",
            "1Y",
            "5Y",
            "1D",
            "1W",
            "1M",
            "1Q",
            "YTD",
            "1Y",
            "5Y",
            "1D",
            "1W",
            "1M",
            "1Q",
            "YTD",
            "1Y",
            "5Y",
            "1D",
            "1W",
            "1M",
            "1Q",
            "YTD",
            "1Y",
            "5Y"
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}

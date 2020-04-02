//
//  ContentView.swift
//  FioriSwiftUITestApp
//
//  Created by Ma, Xiao on 3/19/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import SwiftUI
import FioriSwiftUI
import FioriCharts

struct ContentView: View {
    var body: some View {
        DimensionSelector_Chart()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}

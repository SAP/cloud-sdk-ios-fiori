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

struct CoreContentView: View {
    var body: some View {
        List {
            NavigationLink(
            destination: SegmentedControl_Chart()) {
                Text("Segmented Control")
            }
            NavigationLink(
            destination: SignatureView()) {
                Text("Signature View")
            }
            NavigationLink(
            destination: UIList()) {
                Text("Signature Inline View")
            }
        }.navigationBarTitle("FioriSwiftUICore")
    }
}

struct CoreContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.horizontalSizeClass, .compact)
    }
}

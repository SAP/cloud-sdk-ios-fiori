//
//  ContentView.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/2/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI
import FioriSwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World")
            /*
            List {
                ForEach(Test.allTestModels) {
                    ChartView($0).frame(height: 200)
                }
                
            }.navigationBarTitle("Micro Charts")*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


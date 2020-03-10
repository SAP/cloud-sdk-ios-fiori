//
//  ContentView.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/2/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI
import FioriCharts

struct ContentView: View {
    @State var showingDetail = false
    @State var currentModel: ChartModel? = nil
    
    var body: some View {
        NavigationView {
            List(Tests.allCases) { model in
                //            NavigationLink(destination: DetailView(model: model)) {
                ChartView(model).frame(height: 200)
                    .onTapGesture {
                        self.currentModel = model
                        self.showingDetail.toggle()
                }
                //}
            }.navigationBarTitle("Micro Charts")
                .sheet(isPresented: $showingDetail) {
                    //DetailView().environmentObject(self.currentModel!)
                    DetailView(model: self.currentModel!)
            }
        }
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


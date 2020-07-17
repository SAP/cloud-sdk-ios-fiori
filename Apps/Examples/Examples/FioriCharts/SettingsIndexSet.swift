//
//  SettingsIndexSet.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 4/29/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriCharts

struct SettingsIndexSet: View {
    @Binding var indexSet: IndexSet
    let num: Int
    
    var body: some View {
        let combinations = combine(n: num)
    
        return Picker(selection: $indexSet, label: Text("Index set")) {
            ForEach(combinations, id: \.self) {
                Text("\(String(describing: $0.sorted()))").tag(IndexSet($0))
            }
        }
    }
    
    func combine(n: Int) -> [[Int]] {
        var res:[[Int]] = []
        var cur:[Int] = []
        
        for i in 0 ... n {
            dfs(n: n, index: 0, k: i, cur: &cur, res: &res)
        }
        
        return res
    }
    
    func dfs(n: Int, index: Int, k: Int, cur: inout [Int], res: inout [[Int]]) {
        // find one
        if k == 0 {
            res.append(cur)
            return
        }
        
        for i in index ..< n {
            // append one
            cur.append(i)
            
            dfs(n: n, index: i + 1, k: k - 1, cur: &cur, res: &res)
            
            // pop out
            cur.removeLast(1)
        }
    }
}

struct SettingsIndexSet_Previews: PreviewProvider {
    static var previews: some View {
        SettingsIndexSet(indexSet: .constant(Tests.lineModels[1].indexesOfSecondaryValueAxis), num: 2)
    }
}

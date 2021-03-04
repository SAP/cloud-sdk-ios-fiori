import FioriCharts
import SwiftUI

struct SettingsIndexSet: View {
    @Binding var indexSet: IndexSet
    let num: Int
    
    var body: some View {
        let combinations = combine(n: num)
    
        return Picker(selection: $indexSet, label: Text("Index set")) {
            ForEach(0 ..< combinations.count, id: \.self) { index in
                Text("\(String(describing: combinations[index].sorted()))").tag(IndexSet(combinations[index]))
            }
        }
    }
    
    func combine(n: Int) -> [[Int]] {
        var res: [[Int]] = []
        var cur: [Int] = []
        
        for i in 0 ... n {
            self.dfs(n: n, index: 0, k: i, cur: &cur, res: &res)
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
            
            self.dfs(n: n, index: i + 1, k: k - 1, cur: &cur, res: &res)
            
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

//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 1/22/20.
//

import SwiftUI
import Combine

public struct ObjectCardGroupView: View {
    
    var model: ObjectGroup
    
    public var body: some View {
        VStack {
            Group {
                VStack(alignment: .leading) {
                    ForEach(model.items) {
                        ObjectCardGroupItemView(model: $0)
                    }
                }
            }
        }
        .padding(8)
    }
}

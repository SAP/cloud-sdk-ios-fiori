//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 1/22/20.
//

import SwiftUI

struct ObjectCardGroupItemView: View {
    
    var model: ObjectGroupItem
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 4) {
            SafeText(model.label)
                .font(.caption)
                .foregroundColor(.gray)
            SafeText(model.value)
                .font(.caption)
        }
        .padding(EdgeInsets(top: 10.5, leading: 0, bottom: 10.5, trailing: 0))
    }
}


//
//  SearchFontAndColor.swift
//  Examples
//
//  Created by Xu, Charles on 12/19/23.
//  Copyright © 2023 SAP. All rights reserved.
//

import SwiftUI
import FioriThemeManager

struct SearchFontAndColor: View {
    @State private var queryString = ""

    // following code demonstrate a workaround for styling search bar
    // font and test color
    // reference issue: https://developer.apple.com/forums/thread/709773
    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(queryString)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
                    .font(.fiori(forTextStyle: .body))
            }
            .navigationTitle("Colors")
        }
        .searchable(text: $queryString, prompt: "Color name")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.preferredColor(.red5))
        .font(.fiori(forTextStyle: .title3))
    }
}

#Preview {
    SearchFontAndColor()
}

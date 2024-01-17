//
//  FontAndColor.swift
//  Examples
//
//  Created by Xu, Charles on 12/19/23.
//  Copyright © 2023 SAP. All rights reserved.
//

import SwiftUI
import FioriThemeManager

struct SearchWithScope: View {
    @State private var queryString = ""
    @State private var searchScope = SearchScope.all

    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(queryString, scope: searchScope)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
        }
        .searchable(text: $queryString, prompt: "Color name")
        .searchScopes($searchScope) { //, activation: .onSearchPresentation) { // onSearchPresentation is only available with iOS 16.4+
            // cannot customize search scopes
            ForEach(SearchScope.allCases, id: \.self) { scope in
                switch scope {
                case .all:
                    Text("All")
                        .foregroundColor(.preferredColor(.grey6)) // not working
                        .font(.fiori(forTextStyle: .body)) // not working
                case .basic:
                    Text("Basic")
                        .foregroundColor(.preferredColor(.red6))
                        .font(.fiori(forTextStyle: .body))
                case .chart:
                    Text("Chart")
                        .foregroundColor(.preferredColor(.mango6))
                        .font(.fiori(forTextStyle: .body))
                case .map:
                    Text("Map")
                        .foregroundColor(.preferredColor(.blue6))
                        .font(.fiori(forTextStyle: .body))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // a workaround for styling search scope
            UISearchBar.appearance().setScopeBarButtonTitleTextAttributes([
                .foregroundColor : UIColor.red,
                NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 18.0)!,
//                NSAttributedString.Key.backgroundColor: UIColor.yellow
            ], for: .normal)
        }
    }
}

#Preview {
    SearchWithScope()
}

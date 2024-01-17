//
//  SearchWithBookmark.swift
//  Examples
//
//  Created by Xu, Charles on 12/19/23.
//  Copyright © 2023 SAP. All rights reserved.
//

import SwiftUI
import FioriThemeManager

struct SearchWithBookmark: View {
    @State private var queryString = ""
    @State private var searchScope = SearchScope.all
//    var delegate = MyUISearchBarDelegate()

    var body: some View {
        NavigationStack {
            List(ColorEntity.filterColors(queryString, scope: searchScope)) { color in
                Text(color.name)
                    .foregroundColor(color.fioriColor)
            }
            .navigationTitle("Colors")
        }
        .searchable(text: $queryString, prompt: "Color name")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
//            UISearchBar.appearance().delegate = delegate // SwiftUI doesn't support bookmark actions.
            UISearchBar.appearance().showsBookmarkButton = true // bookmark shown
//            UISearchBar.appearance().setImage(Image(systemName: "checkmark").asUIImage(), for: .bookmark, state: .normal)
        }
    }
}

//class MyUISearchBarDelegate: NSObject, UISearchBarDelegate {
//    override init() {
//        
//    }
//    
//    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//        print("Bookmark button clicked")
//    }
//}

#Preview {
    SearchWithBookmark()
}

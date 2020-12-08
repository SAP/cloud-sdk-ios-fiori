//
//  File.swift
//  
//
//  Created by Stan Stadelman on 9/9/20.
//

import Foundation
import SwiftUI

struct ContactItemLibraryContent: LibraryContentProvider {
    
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(ContactItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
//        LibraryItem(ContactItem(model: LibraryPreviewData.Person.laurelosborn, actionItems: LibraryPreviewData.Person.laurelosborn.actionItems), title: "ContactItem w/ActionItems", category: .control)
    }
    
    @LibraryContentBuilder
    func modifiers(base: TextStyle) -> [LibraryItem] {
        LibraryItem(
            base.bold(),
            title: "Bold"
        )
    }
}

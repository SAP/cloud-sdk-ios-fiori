//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 11/9/20.
//

import SwiftUI

extension View {
  /// Returns a type-erased version of the view.
  public var typeErased: AnyView { AnyView(self) }
}

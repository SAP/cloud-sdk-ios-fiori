import Foundation
import SwiftUI

@attached(peer, names: suffixed(Configuration))
@attached(member, names: named(style), named(_shouldApplyDefaultStyle), named(init))
@attached(extension, names: arbitrary, conformances: View & _ViewEmptyChecking)
public macro BaseComponent() = #externalMacro(module: "FioriMacroImpl", type: "BaseComponent")

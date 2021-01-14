//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 12/14/20.
//

import Foundation
import SourceryRuntime

extension Variable {
    public var swiftUITypeName: String {
        switch self.typeName.unwrappedTypeName {
        case "String", "[String]":
            return "Text"
        case "Image":
            return "Image"
        default:
            return "Never"
        }
    }

    public var conditionalAssignment: String {
        if isOptional {
            return "\(trimmedName) != nil ? ViewBuilder.buildEither(first: \(toSwiftUI)) : ViewBuilder.buildEither(second: EmptyView())"
        } else {
            return toSwiftUI
        }
    }

    public var toSwiftUI: String {
        switch self.typeName.unwrappedTypeName {
            case "String":
                return isOptional ? "Text(\(trimmedName)!)" : "Text(\(trimmedName))"
            case "[String]":
                return "Text(\(trimmedName).joined(separator: \", \"))"
            case "Image":
                return isOptional ? "\(trimmedName)!" : trimmedName
            default:
                return "\(swiftUITypeName)(\(trimmedName))"
        }
    }

    public var emptyDefault: String {
        if isOptional {
            return " = nil"
        } else if typeName.isArray {
            return " = []"
        } else {
            return ""
        }
    }

    public var trimmedName: String {
        name.replacingOccurrences(of: "_", with: "")
    }
}


extension Variable {
    public func resolvedViewModifierChain(type: Type) -> String {
        """
        var \(trimmedName): some View {
                _\(trimmedName)().modifier(\(trimmedName)Modifier.concat(Fiori.\(type.componentName).\(trimmedName)))
            }
        """
    }
}



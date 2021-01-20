//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 1/15/21.
//

import Foundation
import SourceryRuntime

protocol PublicAPIAttributes {
    var name: String { get }
    var typeNameString: String { get }
    var isOptional: Bool { get }
    var isPrivate: Bool { get }
    var emptyDefault: String { get }
    var toSwiftUIType: String { get }
}

struct PublicAPIElement: PublicAPIAttributes {
    let name: String
    let typeNameString: String
    let isOptional: Bool
    let isPrivate: Bool
    let componentName: String
    
    init(from attributes: PublicAPIAttributes, componentName: String) {
        name = attributes.name
        typeNameString = attributes.typeNameString
        isOptional = attributes.isOptional
        isPrivate = attributes.isPrivate
        self.componentName = componentName
    }
}

//struct TypeWrapper {
//    let type: Type
//    let componentProperties: [PublicAPIElement]
//
//    init(type: Type, context: [String: Type]) {
//
//    }
//}


extension Array where Element: PublicAPIAttributes {
    func publicAPIElements(with componentName: String) -> [PublicAPIElement] {
        map { PublicAPIElement(from: $0, componentName: componentName) }
    }
}

extension PublicAPIAttributes {
    
    var isPrivate: Bool {
        name.hasSuffix("ViewModifier")
    }
    
    var toSwiftUIType: String {
        switch typeNameString {
            case "String":
                return isOptional ? "Text(\(name)!)" : "Text(\(name))"
            case "[String]":
                return "Text(\(name).joined(separator: \", \"))"
            case "Image":
                return isOptional ? "\(name)!" : name
            default:
                return "\(swiftUITypeName)(\(name))"
        }
    }
    var swiftUITypeName: String {
        switch typeNameString {
        case "String", "[String]":
            return "Text"
        case "Image":
            return "Image"
        default:
            return "Never"
        }
    }
    
    var emptyDefault: String {
        if isOptional {
            return " = nil"
        } else if typeNameString.hasPrefix("Array<") || typeNameString.hasPrefix("[") {
            return " = []"
        } else {
            return ""
        }
    }
}

extension PublicAPIElement {
    var environmentPropertyDecl: String {
        "@Environment(\\.\(name)) \(isPrivate ? "private " : "")var \(name)"
    }
    var viewBuilderPropertyDecl: String {
        "private let _\(name): () -> \(typeNameString)"
    }
    var viewBuilderInitParam: String {
        "@ViewBuilder \(name): @escaping () -> \(typeNameString)"
    }
    var viewBuilderInitParamAssignment: String {
        "self._\(name) = \(name)"
    }
    var resolvedViewModifierChain: String {
        """
        var \(name): some View {
            _\(name)().modifier(\(name)Modifier.concat(Fiori.\(componentName).\(name))
        }
        """
    }
    // MARK: - Extension elements
    var extensionGenericConditionalConstraint: String {
        "\(name.capitalizingFirst()) == \(isOptional ? "_ConditionalContent<\(swiftUITypeName), EmptyView>" : swiftUITypeName)"
    }
    var extensionElementwiseInitParam: String {
        "\(name): \(typeNameString)\(emptyDefault)"
    }
    var extensionInitParamAssignment: String {
        "self._\(name) = { \(isOptional ? "\(name) != nil ? ViewBuilder.buildEither(first: \(toSwiftUIType) : ViewBuilder.buildEither(second: EmptyView())" : toSwiftUIType) }"
    }
}
//
//protocol PublicAPIProvider {
//    func environmentPropertyDecl() -> PublicAPI
//    func viewBuilderPropertyDecl() -> PublicAPI
//    func viewBuilderInitParam() -> PublicAPI
//    func viewBuilderInitParamAssignment() -> PublicAPI
//    func resolvedViewModifierChain(componentName: String) -> PublicAPI
//}
//
//
//
//public enum PublicAPI: CustomStringConvertible {
//    // @Environment(\.titleModifier) private var titleModifier
//    case environmentPropertyDecl(name: String, isPrivate: Bool)
//    // private let _title: () -> Title
//    case viewBuilderPropertyDecl(name: String, type: String)
//    // @ViewBuilder title: @escaping () -> Title,
//    case viewBuilderInitParam(name: String, type: String)
//    // self._title = title
//    case viewBuilderInitParamAssignment(name: String)
//    /*
//     var title: some View {
//         _title().modifier(titleModifier.concat(Fiori.ContactItem.title))
//     }
//     */
//    case resolvedViewModifierChain(name: String, componentName: String)
//
//
//    public var description: String {
//        switch self {
//            case .environmentPropertyDecl(name: let name, isPrivate: let isPrivate):
//                return "@Environment(\\.\(name)) \(isPrivate ? "private " : "")var \(name)"
//            case .viewBuilderPropertyDecl(name: let name, type: let type):
//                return "private let _\(name): () -> \(type)"
//            case .viewBuilderInitParam(name: let name, type: let type):
//                return "@ViewBuilder \(name): @escaping () -> \(type)"
//            case .viewBuilderInitParamAssignment(name: let name):
//                return "self._\(name) = \(name)"
//            case .resolvedViewModifierChain(name: let name, componentName: let componentName):
//                return """
//                    var \(name): some View {
//                        _\(name)().modifier(\(name)Modifier.concat(Fiori.\(componentName).\(name))
//                    }
//                    """
//        }
//    }
//}
//
//public enum ExtensionAPI: CustomStringConvertible {
//    // Title == Text
//    // Subtitle == _ConditionalContent<Text, EmptyView>
//    case genericConstraint(name: String, swiftUIType: String, isConditional: Bool)
//    // title: String
//    // subtitle: String? = nil
//    case initParam(name: String, type: String, isConditional: Bool)
//    // self._title = { Text(title) }
//    // self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
//    case initParamAssignment(name: String, toSwiftUI: String, isConditional: Bool)
//
//    public var description: String {
//        switch self {
//            case .genericConstraint(name: let name, swiftUIType: let swiftUIType, isConditional: let isConditional):
//                return isConditional ? "\(name) == _ConditionalContent<\(swiftUIType), EmptyView>"
//                    : "\(name) == \(swiftUIType)"
//            case .initParam(name: let name, type: let type, isConditional: let isConditional):
//                return isConditional ? "\(name): \(type)? = nil" : "\(name): \(type)"
//            case .initParamAssignment(name: let name, toSwiftUI: let toSwiftUI, isConditional: let isConditional):
//                return isConditional ? "self._\(name) = { \(name) != nil ? ViewBuilder.buildEither(first: \(toSwiftUI) : ViewBuilder.buildEither(second: EmptyView()) }"
//                    : "self._\(name) = { \(toSwiftUI) }"
//        }
//    }
//}

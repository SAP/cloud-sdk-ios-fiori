import Foundation
import SourceryRuntime

extension Type {
    var componentDecl: String {
        """
        \(docText)
        public struct \(componentName) {
            \(allStoredVariables.propertyListDecl)
        
            @Environment(\\.\(componentName.lowercasingFirst())Style) var style
        
            fileprivate var _shouldApplyDefaultStyle = true
        
            \(self.viewBuilderInit)
        }
        
        \(self.dataInitExtension)
        
        \(self.configurationInitExtension)
        
        \(self.viewBodyExtension)
        
        \(self.privateHelperExtension)
        """
    }
    
    var viewBuilderInit: String {
        """
        public init(\(allStoredVariables.viewBuilderInitParams)) {
            \(allStoredVariables.viewBuilderInitBody(isBaseComponent: isBaseComponent))
        }
        """
    }
    
    var dataInitExtension: String {
        if self.resultBuilderVariables.isEmpty {
            return ""
        }
        
        return """
        public extension \(componentName) {
            init(\(allStoredVariables.dataInitParams)) {
                \(allStoredVariables.dataInitBody)
            }
        }
        """
    }
    
    var configurationInitExtension: String {
        """
        public extension \(componentName) {
            init(_ configuration: \(configurationName)) {
                \(allStoredVariables.configurationInitBody)
                self._shouldApplyDefaultStyle = false
            }
        }
        """
    }
    
    var viewBodyExtension: String {
        """
        extension \(componentName): View {
            public var body: some View {
                if _shouldApplyDefaultStyle {
                    self.defaultStyle()
                } else {
                    style.resolve(configuration: .init(\(allStoredVariables.configurationInitArgs))).typeErased
                        .transformEnvironment(\\.\(styleProtocolName.lowercasingFirst())Stack) { stack in
                            if !stack.isEmpty {
                                stack.removeLast()
                            }
                        }
                }
            }
        }
        """
    }
    
    var privateHelperExtension: String {
        let initDecl: String
        let fioriStyle: String
        switch self.componentType {
        case .base:
            let initArgs = allStoredVariables.map { variable in
                let name = variable.name
                if variable.isResultBuilder {
                    return "\(name): { self.\(name) }"
                } else if variable.isBinding {
                    return "\(name): self.$\(name)"
                } else {
                    return "\(name): self.\(name)"
                }
            }
            .joined(separator: ",\n")
            initDecl = "\(componentName)(\(initArgs))"
            fioriStyle = ".fiori"
        case .composite:
            initDecl = "\(componentName)(.init(\(allStoredVariables.configurationInitArgs)))"
            fioriStyle = "\(self.fioriStyleName).ContentFioriStyle()"
        }
        
        return """
        private extension \(componentName) {
            func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
                var s = self
                s._shouldApplyDefaultStyle = bool
                return s
            }
                
            func defaultStyle() -> some View {
                \(initDecl)
                .shouldApplyDefaultStyle(false)
                .\(styleProtocolName.lowercasingFirst())(\(fioriStyle))
                .typeErased
            }
        }
        """
    }
    
    var viewEmptyCheckingExtension: String {
        """
        extension \(componentName): _ViewEmptyChecking {
            public var isEmpty: Bool {
                \(allStoredVariables.viewEmptyCheckingBody)
            }
        }
        """
    }
}

extension Type {
    var componentStyleDecl: String {
        switch componentType {
        case .base:
            return """
            \(self.styleProtocolDecl)
                
            \(self.styleTypeEraserDecl)
                
            \(self.configurationDecl)
            """
        case .composite:
            return """
            \(self.styleProtocolDecl)
                
            \(self.styleTypeEraserDecl)
                
            \(self.configurationDecl)
                
            \(self.fioriStyleDecl)
            """
        }
    }
    
    var configurationDecl: String {
        """
        public struct \(componentName)Configuration {
            \(allStoredVariables.configurationPropertyListDecl)
        }
        """
    }
    
    var styleProtocolDecl: String {
        """
        public protocol \(styleProtocolName): DynamicProperty {
            associatedtype Body: View

            func makeBody(_ configuration: \(configurationName)) -> Body
        }
        """
    }
    
    var styleProtocolExtensions: String {
        switch componentType {
        case .base:
            return """
            // MARK: \(styleProtocolName)
                
            public extension \(styleProtocolName) where Self == \(baseStyleName) {
                static var base: \(baseStyleName) {
                    \(baseStyleName)()
                }
            }

            public extension \(styleProtocolName) where Self == \(fioriStyleName) {
                static var fiori: \(fioriStyleName) {
                    \(fioriStyleName)()
                }
            }
            """
        case .composite:
            return """
            // MARK: \(styleProtocolName)
                
            public extension \(styleProtocolName) where Self == \(baseStyleName) {
                static var base: \(baseStyleName) {
                    \(baseStyleName)()
                }
            }

            public extension \(styleProtocolName) where Self == \(fioriStyleName) {
                static var fiori: \(fioriStyleName) {
                    \(fioriStyleName)()
                }
            }
                
            \(self.childComponentStyleExtentionList)
            """
        }
    }
    
    var childComponentStyleExtentionList: String {
        let protocols = self.conformingBaseComponentProtocols + self.parentCompositeComponentProtocols
        
        return protocols.map { type in
            let baseComponentStyleDecl = "\(self.componentName)\(type.styleProtocolName)"
            let styleModifierFuncName = "\(type.styleProtocolName.lowercasingFirst())"
            let styleModifierExpr = ".\(styleModifierFuncName)"
            return """
            public struct \(baseComponentStyleDecl): \(self.styleProtocolName) {
                let style: any \(type.styleProtocolName)
                    
                public func makeBody(_ configuration: \(self.configurationName)) -> some View {
                    \(self.componentName)(configuration)
                        \(styleModifierExpr)(self.style)
                        .typeErased
                }
            }
                
            public extension \(self.styleProtocolName) where Self == \(baseComponentStyleDecl) {
                static func \(styleModifierFuncName)<Style: \(type.styleProtocolName)>(_ style: Style) -> \(baseComponentStyleDecl) {
                    \(baseComponentStyleDecl)(style: style)
                }
                    
                static func \(styleModifierFuncName)(@ViewBuilder content: @escaping (\(type.configurationName)) -> some View) -> \(baseComponentStyleDecl) {
                    let style = Any\(type.styleProtocolName)(content)
                    return \(baseComponentStyleDecl)(style: style)
                }
            }
            """
        }
        .joined(separator: "\n\n")
    }
    
    var fioriStyleDecl: String {
        """
        public struct \(fioriStyleName): \(styleProtocolName) {
            public func makeBody(_ configuration: \(configurationName)) -> some View {
                \(componentName)(configuration)
                    \(self.componentFioriStyleModifierList)
            }
        }
        """
    }
    
    var componentFioriStyleModifierList: String {
        let protocols = self.conformingBaseComponentProtocols + self.parentCompositeComponentProtocols
        
        return protocols.map { type in
            ".\(type.styleProtocolName.lowercasingFirst())(\(type.fioriStyleName)())"
        }
        .joined(separator: "\n")
    }
    
    var styleProtocolImplementations: String {
        switch componentType {
        case .base:
            return """
            /**
             This file provides default fiori style for the component.
             
             1. Uncomment the following code.
             2. Implement layout and style in corresponding places.
             3. Delete `.generated` from file name.
             4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
             */

            // Base Layout style
            public struct \(baseStyleName): \(styleProtocolName) {
                @ViewBuilder
                public func makeBody(_ configuration: \(configurationName)) -> some View {
                    // Add default layout here
                    \(allStoredVariables.configurationResultBuilderPropertyListDecl)
                }
            }

            // Default fiori styles
            public struct \(fioriStyleName): \(styleProtocolName) {
                @ViewBuilder
                public func makeBody(_ configuration: \(configurationName)) -> some View {
                    \(componentName)(configuration)
                        // Add default style here
                        //.foregroundStyle(Color.preferredColor(<#fiori color#>))
                        //.font(.fiori(forTextStyle: <#fiori font#>))
                }
            }
            """
            .commented()
        case .composite:
            return """
            /**
             This file provides default fiori style for the component.
             
             1. Uncomment fhe following code.
             2. Implement layout and style in corresponding places.
             3. Delete `.generated` from file name.
             4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
             */

            // Base Layout style
            public struct \(baseStyleName): \(styleProtocolName) {
                public func makeBody(_ configuration: \(configurationName)) -> some View {
                    // Add default layout here
                    \(allStoredVariables.configurationResultBuilderPropertyListDecl)
                }
            }
                
            // Default fiori styles
            extension \(fioriStyleName) {
                \(self.compositeComponentContentFioriStyleDecl)
            
                \(self.compositeComponentFioriStyleDeclList)
            }
            """
            .commented()
        }
    }
    
    var compositeComponentContentFioriStyleDecl: String {
        """
        struct ContentFioriStyle: \(self.styleProtocolName) {
            func makeBody(_ configuration: \(self.configurationName)) -> some View {
                \(self.componentName)(configuration)
                // Add default style for its content
                //.background()
            }
        }
        """
    }
    
    var compositeComponentFioriStyleDeclList: String {
        let protocols = self.conformingBaseComponentProtocols + self.parentCompositeComponentProtocols
        
        return protocols.map { type in
            """
            struct \(type.fioriStyleName): \(type.styleProtocolName) {
                func makeBody(_ configuration: \(type.configurationName)) -> some View {
                    \(type.componentName)(configuration)
                    // Add default style for \(type.componentName)
                    //.foregroundStyle(Color.preferredColor(<#fiori color#>))
                    //.font(.fiori(forTextStyle: <#fiori font#>))
                }
            }
            """
        }
        .joined(separator: "\n\n")
    }
    
    var styleTypeEraserDecl: String {
        """
        struct Any\(styleProtocolName): \(styleProtocolName) {
            let content: (\(configurationName)) -> any View
        
            init(@ViewBuilder _ content: @escaping (\(configurationName)) -> any View) {
                self.content = content
            }
        
            public func makeBody(_ configuration: \(configurationName)) -> some View {
                self.content(configuration).typeErased
            }
        }
        """
    }
    
    var resolvedStyleDecl: String {
        """
        // MARK: \(styleProtocolName)
        
        struct Resolved\(styleProtocolName)<Style: \(styleProtocolName)>: View {
            let style: Style
            let configuration: \(configurationName)
            var body: some View {
                style.makeBody(configuration)
            }
        }
        
        extension \(styleProtocolName) {
            func resolve(configuration: \(configurationName)) -> some View {
                Resolved\(styleProtocolName)(style: self, configuration: configuration)
            }
        }
        """
    }
    
    var styleStackKeyDecl: String {
        let defaultStyle: String
        switch componentType {
        case .base:
            defaultStyle = ".base"
        case .composite:
            defaultStyle = ".base.concat(.fiori)"
        }
        
        return """
        // MARK: \(styleProtocolName)
        
        struct \(styleProtocolName)StackKey: EnvironmentKey {
            static let defaultValue: [any \(styleProtocolName)] = []
        }
        
        extension EnvironmentValues {
            var \(styleProtocolName.lowercasingFirst()): any \(styleProtocolName) {
                \(styleStackVariableName).last ?? \(defaultStyle)
            }

            var \(styleStackVariableName): [any \(styleProtocolName)] {
                get {
                    self[\(styleStackKeyName).self]
                }
                set {
                    self[\(styleStackKeyName).self] = newValue
                }
            }
        }
        """
    }
    
    var styleModifierDecl: String {
        """
        // MARK: \(styleProtocolName)
        
        extension ModifiedStyle: \(styleProtocolName) where Style: \(styleProtocolName) {
            public func makeBody(_ configuration: \(configurationName)) -> some View {
                \(componentName)(configuration)
                    .\(styleProtocolName.lowercasingFirst())(self.style)
                    .modifier(self.modifier)
            }
        }
        
        public struct \(styleModifierName)<Style: \(styleProtocolName)>: ViewModifier {
            let style: Style
        
            public func body(content: Content) -> some View {
                content.\(styleProtocolName.lowercasingFirst())(self.style)
            }
        }
        
        public extension \(styleProtocolName) {
            func modifier(_ modifier: some ViewModifier) -> some \(styleProtocolName) {
                ModifiedStyle(style: self, modifier: modifier)
            }
        
            func concat(_ style: some \(styleProtocolName)) -> some \(styleProtocolName) {
                style.modifier(\(styleModifierName)(style: self))
            }
        }
        """
    }
    
    var styleViewExtensionDecl: String {
        """
        // MARK: \(styleProtocolName)
        
        public extension View {
            func \(styleProtocolName.lowercasingFirst())(_ style: some \(styleProtocolName)) -> some View {
                self.transformEnvironment(\(styleStackKeyPathExpr)) { stack in
                    stack.append(style)
                }
            }
            
            func \(styleProtocolName.lowercasingFirst())(@ViewBuilder content: @escaping (\(configurationName)) -> some View) -> some View {
                self.transformEnvironment(\(styleStackKeyPathExpr)) { stack in
                    let style = Any\(styleProtocolName)(content)
                    stack.append(style)
                }
            }
        }
        """
    }
    
    var configurationExtensionDecl: String {
        let protocols = self.parentCompositeComponentProtocols + self.parentBaseComponentProtocols.filter { !$0.allStoredVariables.filter { !$0.isResultBuilder }.isEmpty }
        if protocols.isEmpty {
            return ""
        }
        
        let memberList = protocols.map { type in
            """
            var _\(type.componentName.lowercasingFirst()): \(type.componentName) {
                \(type.componentName)(.init(\(type.allStoredVariables.configurationInitArgs)))
            }
            """
        }
        .joined(separator: "\n\n")
        
        return """
        // MARK: \(self.configurationName)
        
        extension \(self.configurationName) {
            \(memberList)
        }
        """
    }
}

extension Type {
    var configurationName: String {
        "\(componentName)Configuration"
    }
    
    var styleProtocolName: String {
        "\(componentName)Style"
    }
    
    var baseStyleName: String {
        "\(componentName)BaseStyle"
    }
    
    var fioriStyleName: String {
        "\(componentName)FioriStyle"
    }
    
    var styleModifierName: String {
        "\(self.styleProtocolName)Modifier"
    }
    
    var styleStackKeyName: String {
        "\(self.styleProtocolName)StackKey"
    }
    
    var styleStackVariableName: String {
        "\(self.styleProtocolName.lowercasingFirst())Stack"
    }
    
    var styleStackKeyPathExpr: String {
        "\\.\(self.styleStackVariableName)"
    }
}

extension Type {
    enum ComponentType {
        case base
        case composite
    }
    
    var componentType: ComponentType {
        if self.isBaseComponent {
            return .base
        } else if self.isCompositeComponent {
            return .composite
        } else {
            return .base
        }
    }
    
    var isComponent: Bool {
        self.isBaseComponent || self.isCompositeComponent
    }
    
    var isBaseComponent: Bool {
        annotations.isBaseComponent
    }
    
    var isCompositeComponent: Bool {
        annotations.isCompositeComponent
    }
}

extension Type {
    // All base component protocols in the inheritance chain
    var conformingBaseComponentProtocols: [Type] {
        self.conformingComponentProtocols.filter { $0.componentType == .base }
    }
    
    // Composite component protocols this type conforms to direclty. (direct supertype, not including supertype of supertype)
    var parentCompositeComponentProtocols: [Type] {
        self.directInheritedTypes.filter { $0.componentType == .composite }
    }
    
    // Base component protocols this type conforms to direclty. (direct supertype, not including supertype of supertype)
    var parentBaseComponentProtocols: [Type] {
        self.directInheritedTypes.filter { $0.componentType == .base }
    }
    
    // All base and composite component protocols in the inheritance chain
    var conformingComponentProtocols: [Type] {
        var protocols: [Type] = []
        var set: Set<Type> = []
        for p in self.directInheritedTypes {
            self.traverse(p, self, &protocols, &set)
        }
        return protocols
    }
    
    private func traverse(_ type: Type, _ root: Type, _ result: inout [Type], _ set: inout Set<Type>) {
        guard type.isComponent else {
            return
        }
        
        for p in type.directInheritedTypes {
            self.traverse(p, root, &result, &set)
        }
        
        if set.contains(type) {
            fatalError("Protocol \(root.name) implements \(type.name) twice in its declaration, which is not allowed.")
        } else {
            result.append(type)
            set.insert(type)
        }
    }
}

extension Type {
    var resultBuilderVariables: [Variable] {
        allStoredVariables.filter { $0.resultBuilderAttrs != nil }
    }
}

extension Type {
    var directInheritedTypes: [Type] {
        self.inheritedTypes.map { name in
            guard let type = ProcessInfo.processInfo.context.type[name] else {
                fatalError("Protocol \(name) is not found")
            }
            return type
        }
    }
}

extension Type {
    var docText: String {
        self.documentation.map { str in
            "/// \(str)"
        }
        .joined(separator: "\n")
    }
}

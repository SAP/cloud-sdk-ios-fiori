import Foundation

// swiftlint:disable nesting

// https://github.com/SAP/openui5/blob/9933af837bb387c3275af3bc31fbec7bf17678b5/src/sap.ui.integration/src/sap/ui/integration/schemas/sap-card.json#L34

/// Represents configuration with parameters, destinations, and filters, which can be used inside the card
public struct Configuration: Decodable, Hashable {
    /// Map of parameters
    let parameters: [String: Parameter]

    /**
     Represents configuration parameter

     Parameters are means to provide dynamic values for certain card attributes. The manifest parameters are replaced during manifest processing and can be used with a double bracket syntax like: "{{parameters.city}}". Parameters can be used inside "sap.card" scope.

     More info on [UI Integration Cards - Manifest Parameters](https://sapui5.hana.ondemand.com/test-resources/sap/ui/integration/demokit/cardExplorer/webapp/index.html#/learn/features/manifestParameters)
     */
    public struct Parameter: Decodable, Hashable {
        /// The value of the parameter
        public let value: AnyHashable?
        /// The type of the value for the parameter
        public let type: BasicDataType?
        /// Label for the parameter for user-friendly visualization in the design-time editor
        public let label: String?
        /// Description of the parameter for user-friendly visualization in the design-time editor
        public let description: String?

        private enum CodingKeys: String, CodingKey {
            case value, type, label, description
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: Parameter.CodingKeys.self)

            self.label = try? container.decodeIfPresent(String.self, forKey: .label)

            self.description = try? container.decodeIfPresent(String.self, forKey: .description)

            self.type = try? container.decodeIfPresent(BasicDataType.self, forKey: .type)

            if let stringValue = try? container.decodeIfPresent(String.self, forKey: .value) {
                self.value = stringValue
            } else if let boolValue = try? container.decodeIfPresent(Bool.self, forKey: .value) {
                self.value = boolValue
            } else if let intValue = try? container.decodeIfPresent(Int.self, forKey: .value) {
                self.value = intValue
            } else if let floatValue = try? container.decodeIfPresent(Float.self, forKey: .value) {
                self.value = floatValue
            } else {
                self.value = nil
            }
        }

        /// Basic data types for parameters and filters
        public enum BasicDataType: String, Decodable {
            case string
            case integer
            case number
            case boolean
            case date
            case datetime
        }
    }
}

extension Configuration.Parameter: Equatable {
    public static func == (lhs: Configuration.Parameter, rhs: Configuration.Parameter) -> Bool {
        lhs.label == rhs.label &&
            lhs.description == rhs.description &&
            lhs.type == rhs.type
    }
}

extension Configuration: Equatable {
    public static func == (lhs: Configuration, rhs: Configuration) -> Bool {
        lhs.parameters == rhs.parameters
    }
}

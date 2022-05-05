@testable import FioriIntegrationCards
import XCTest

class ArrayAnyExtensiontests: XCTestCase {
    func testFlatCompactMapForVariadicParameters() throws {
        struct Container {
            var params: [Any]!
            
            mutating func apply(objects: Any...) -> Container {
                Container(params: objects)
            }
        }
        
        func createContainer(objects: Any...) -> Container {
            var container = Container()
            return container.apply(objects: objects)
        }
        
        let optionalAny: Any? = nil
        let container = createContainer(objects: "Hello", optionalAny as Any)
        
        let unpackedParameters = container.params!
        XCTAssertEqual(unpackedParameters.debugDescription, "[[\"Hello\", nil]]")
        
        let result = unpackedParameters.flatCompactMapForVariadicParameters()
        XCTAssertEqual(result.debugDescription, "[\"Hello\"]")
    }
}

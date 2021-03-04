import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(FioriSwiftUITests.allTests)
        ]
    }
#endif

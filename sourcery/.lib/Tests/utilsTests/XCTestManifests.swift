import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(cloud_sdk_ios_sourcery_utilsTests.allTests),
    ]
}
#endif

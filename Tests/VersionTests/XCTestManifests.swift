import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(VersionInitTests.allTests),
        testCase(VersionComparableTests.allTests),
    ]
}
#endif

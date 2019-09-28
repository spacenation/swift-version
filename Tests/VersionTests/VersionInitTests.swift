import XCTest
@testable import Version

final class VersionInitTests: XCTestCase {
    
    func testVersionInits() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssert(Version(0, 0, 0) == Version.zero)
        XCTAssert(Version(1, 2, 3) == Version("1.2.3"))
    }

    static var allTests = [
        ("testVersionInits", testVersionInits),
    ]
}

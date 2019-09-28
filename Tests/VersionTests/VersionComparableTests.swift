import XCTest
@testable import Version

final class VersionComparableTests: XCTestCase {
    
    func testVersionComparable() {
        XCTAssert(Version(0,0,0) < Version(0,0,1))
        XCTAssert(Version(0,1,1) > Version(0,1,0))
    }

    static var allTests = [
        ("testVersionComparable", testVersionComparable),
    ]
}

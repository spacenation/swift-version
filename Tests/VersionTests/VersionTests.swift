import XCTest
@testable import Version

final class VersionTests: XCTestCase {
    
    func testVersionInits() {
        XCTAssert(Version.zero == Version(0, 0, 0))
        XCTAssert(Version("1.2.3") == Version(1, 2, 3))
        XCTAssert(Version("2.0.0-beta.1") == Version(2,0,0, prerelease: ["beta", "1"], build: []))
        XCTAssert(Version("2.0.0-beta.1+build.2") == Version(2,0,0, prerelease: ["beta", "1"], build: ["build", "2"]))
        XCTAssert(Version("2.0.0+build.2") == Version(2,0,0, prerelease: [], build: ["build", "2"]))
    }
    
    func testVersionComparable() {
        XCTAssert(Version(0,0,0) < Version(0,0,1))
        XCTAssert(Version(0,1,1) > Version(0,1,0))
        XCTAssert(Version(1,0,0) > Version(0,99,99))
 
        XCTAssert(Version("1.0.0-alpha") < Version("1.0.0"))
        XCTAssert(Version("1.0.0-alpha") < Version("1.0.0-alpha.1"))
        XCTAssert(Version("1.0.0-alpha.1") < Version("1.0.0-alpha.beta"))
        XCTAssert(Version("1.0.0-alpha.beta") < Version("1.0.0-beta"))
        XCTAssert(Version("1.0.0-beta") < Version("1.0.0-beta.2"))
        XCTAssert(Version("1.0.0-beta.2") < Version("1.0.0-beta.11"))
        XCTAssert(Version("1.0.0-beta.11") < Version("1.0.0-rc.1"))
        XCTAssert(Version("1.0.0-rc.1") < Version("1.0.0"))
        
        XCTAssert(Version("1.0.0-rc.2") < Version("1.0.0-rc.11"))
        XCTAssert(Version("1.0.0-rc.2a") < Version("1.0.0-rc.2b"))
        XCTAssert(Version("1.0.0-rc.1") < Version("1.0.0-rc.a"))
    }
    
    func testVersionDescription() {
        XCTAssert(Version("1.0.0").description == "1.0.0")
        XCTAssert(Version("1.0.0-alpha.1").description == "1.0.0-alpha.1")
        XCTAssert(Version("1.0.0+rc.1").description == "1.0.0+rc.1")
        XCTAssert(Version("1.0.0-alpha.1+rc.1").description == "1.0.0-alpha.1+rc.1")
    }
    
    func testVersionCodable() {
        let string = #"["1.0.0-alpha.1+rc.1"]"#
        let data = string.data(using: .utf8)!
        let decoded = try? JSONDecoder().decode([Version].self, from: data)
        XCTAssert(decoded == [Version("1.0.0-alpha.1+rc.1")])
        let encoded = try? JSONEncoder().encode(decoded)
        let encodedString = String(bytes: encoded!, encoding: .utf8)
        XCTAssert(string == encodedString)
    }

    static var allTests = [
        ("testVersionInits", testVersionInits),
    ]
}

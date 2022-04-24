import XCTest
@testable import Defaults

final class DefaultsTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Defaults().text, "Hello, World!")
    }
}

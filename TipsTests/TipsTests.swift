//
//  TipsTests.swift
//  TipsTests
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import XCTest
@testable import Tips

final class TipsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test that the generator generates numbers within bounds.
    func testGenerator() {
        var i = 0
        while i < 50 {
            let numbers = LottoGenerator.new()
            XCTAssert(numbers.first! > 0)
            XCTAssert(numbers.last! <= 59)
            XCTAssert(numbers.count == 6)
            i += 1
        }
    }

}

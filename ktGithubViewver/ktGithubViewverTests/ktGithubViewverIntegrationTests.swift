//
//  ktGithubViewverIntegrationTests.swift
//  ktGithubViewverTests
//
//  Created by Karcsú Tamás on 5/26/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import XCTest

class ktGithubViewverIntegrationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntegrationRepositories() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "")
        ktWebService.shared.call(path: .Repos) { (json, error) in
            let obj = try? JSONSerialization.jsonObject(with: json!, options: [.allowFragments])
            XCTAssertNotNil(json, "No data was downloaded.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

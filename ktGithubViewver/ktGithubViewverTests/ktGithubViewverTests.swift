//
//  ktGithubViewverTests.swift
//  ktGithubViewverTests
//
//  Created by Karcsú Tamás on 5/21/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import XCTest
@testable import ktGithubViewver


final class TestWebService : WebService {
    func call(path: Path, callback: @escaping ServiceCallback) {
        switch path {
        case .Repos:
            guard let filepath = Bundle.main.path(forResource: "repos", ofType: "json") else { return callback(nil, nil) }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filepath), options: .alwaysMapped)
                callback(data, nil)
            } catch {
                callback(nil, nil)
            }
        default:
            callback(nil, nil)
        }
    }
    
    
}


class ktGithubViewverTests: XCTestCase {

    private let dataManager = ktDataManager()
    
    private var dependencies : AppDependency?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dependencies = AppDependency(dataManager: dataManager, webService: TestWebService())
        dataManager.dependencies = dependencies
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataManager.dependencies = nil
    }

    func testDataRequestRepos() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "")
        dataManager.getRepos { (data, error) in
            XCTAssertNotNil(data, "")
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

//
//  FoodieFunUnitTests.swift
//  FoodieFunUnitTests
//
//  Created by Jerry haaser on 1/8/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import XCTest
@testable import FoodieFun

class FoodieFunUnitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testNumberOfRows() {
        let restaurantTableViewController = RestaurantsTableViewController()
        let sectionInfo = restaurantTableViewController.fetchedResultsController.sections
        let numberOfRows = sectionInfo?.compactMap { $0.numberOfObjects }
        XCTAssertEqual(numberOfRows, [1])
    }

}

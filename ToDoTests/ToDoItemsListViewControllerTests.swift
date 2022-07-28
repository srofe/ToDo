//
//  ToDoItemsListViewControllerTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 29/7/2022.
//

import XCTest
@testable import ToDo

class ToDoItemsListViewControllerTests: XCTestCase {
    var sut: ToDoItemsListViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController, "The storyboard shall have a ToDoItemsListViewController.")
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_shouldBeSetup() {
        XCTAssertNotNil(sut, "The ToDoItemsListViewController shall be available from the storyboard.")
    }
}

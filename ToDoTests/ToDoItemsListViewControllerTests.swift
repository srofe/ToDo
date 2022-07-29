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
    var toDoItemStoreMock: ToDoItemStoreMock!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = try XCTUnwrap(storyboard.instantiateInitialViewController() as? ToDoItemsListViewController, "The storyboard shall have a ToDoItemsListViewController.")
        toDoItemStoreMock = ToDoItemStoreMock()
        sut.toDoItemStore = toDoItemStoreMock
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_shouldBeSetup() {
        XCTAssertNotNil(sut, "The ToDoItemsListViewController shall be available from the storyboard.")
    }

    func test_shouldHaveTableView() {
        XCTAssertTrue(sut.tableView.isDescendant(of: sut.view), "The ToDoItemsListViewController shall have a table view.")
    }

    func test_numberOfRows_whenOneItemIsSent_shouldReturnOne() {
        toDoItemStoreMock.itemPublisher
            .send([ToDoItem(title: "dummy 1")])
        let result = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(result, 1, "The table view shall contain one item when one item added to the store.")
    }
}

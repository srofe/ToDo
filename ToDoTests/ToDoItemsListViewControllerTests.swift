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

    func test_numberOfRows_whenTowItemsAreSent_shouldReturnTwo() {
        toDoItemStoreMock.itemPublisher
            .send([
                ToDoItem(title: "dummy 1"),
                ToDoItem(title: "dummy 2")
            ])
        let result = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(result, 2, "The table view shall contain two items when two items added to the store.")
    }

    func test_cellForRowAt_shouldReturnCellWithTitle() throws {
        let titleUnderTest = "dummy 1"
        toDoItemStoreMock.itemPublisher
            .send([ToDoItem(title: titleUnderTest)])
        let tableView = try XCTUnwrap(sut.tableView, "The view controller shall have a table view.")
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = try XCTUnwrap(tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell, "The table view shall return a cell at the index path \(indexPath).")
        XCTAssertEqual(cell.titleLabel.text, titleUnderTest, "The table view shall contain a cell with the title of the items passed to the data source.")
    }
}

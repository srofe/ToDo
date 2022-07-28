//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 28/7/2022.
//

import XCTest
@testable import ToDo

class ToDoItemStoreTests: XCTestCase {
    func test_add_shouldPublishChange() {
        let sut = ToDoItemStore()
        let publisherExpectation = expectation(description: "Wait for publisher in \(#file).")
        var receivedItems: [ToDoItem] = []
        let token = sut.itemPublisher
            .dropFirst()
            .sink { items in
                receivedItems = items
                publisherExpectation.fulfill()
            }
        let toDoItem = ToDoItem(title: "Dummy")
        sut.add(toDoItem)
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(receivedItems.first?.title, toDoItem.title, "The ToDoItemStore shall publish items when when an item has been added to it.")
    }
}

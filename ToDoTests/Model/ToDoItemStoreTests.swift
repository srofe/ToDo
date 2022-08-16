//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 28/7/2022.
//

import XCTest
@testable import ToDo
import Combine

class ToDoItemStoreTests: XCTestCase {
    var sut: ToDoItemStore!
    let dummyStoreName = "dummy_store"

    override func setUpWithError() throws {
        sut = ToDoItemStore(fileName: dummyStoreName)
    }

    override func tearDownWithError() throws {
        sut = nil
        let url = FileManager.default.documentsURL(name: dummyStoreName)
        try? FileManager.default.removeItem(at: url)
    }

    func test_add_shouldPublishChange() throws {
        let toDoItem = ToDoItem(title: "Dummy")
        let receivedItems = try wait(for: sut.itemPublisher) {
            sut.add(toDoItem)
        }
        XCTAssertEqual(receivedItems, [toDoItem], "The ToDoItemStore shall publish items when when an item has been added to it.")
    }

    func test_check_shouldPublishChangeInDoneItems() throws {
        let toDoItem = ToDoItem(title: "Dummy")
        sut.add(toDoItem)
        sut.add(ToDoItem(title: "Dummy 2"))
        let receivedItems = try wait(for: sut.itemPublisher) {
            sut.check(toDoItem)
        }
        let doneItems = receivedItems.filter { $0.done }
        XCTAssertEqual(doneItems, [toDoItem], "The ToDoItemStore shall publish items when an item has been checked.")
    }

    func test_init_shouldLoadPreviousToDoItems() throws {
        let publisherExpectation = expectation(description: "wait for publisher in \(#file)")
        let toDoItem = ToDoItem(title: "Dummy Title")
        sut?.add(toDoItem)
        sut = nil
        let sut2 = ToDoItemStore(fileName: dummyStoreName)
        var result: [ToDoItem]?
        let token = sut2.itemPublisher
            .sink { value in
                result = value
                publisherExpectation.fulfill()
            }
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(result, [toDoItem], "The ToDoItemStore shall enable the store to be saved and re-read from a storage medium.")
    }

    func test_check_whenItemIsChecked_shouldLoadPreviousToDoItems() throws {
        let publisherExpectation = expectation(description: "wait for publisher in \(#file)")
        let toDoItem = ToDoItem(title: "Dummy Title")
        sut.add(toDoItem)
        sut.check(toDoItem)
        sut = nil
        let sut2 = ToDoItemStore(fileName: dummyStoreName)
        var result: [ToDoItem]?
        let token = sut2.itemPublisher
            .sink { value in
                result = value
                publisherExpectation.fulfill()
            }
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(result?.first?.done, true, "The ToDoItemStore shall save the items when an item is checked.")
    }
}

extension XCTestCase {
    func wait<T: Publisher>(
        for publisher: T,
        after change: () -> Void,
        file: StaticString = #file,
        line: UInt = #line
    ) throws -> T.Output where T.Failure == Never {
        let publisherExpectation = expectation(description: "Wait for publisher in file \(#file).")
        var result: T.Output?
        let token = publisher
            .dropFirst()
            .sink { value in
                result = value
                publisherExpectation.fulfill()
            }
        change()
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        let unwrappedResult = try XCTUnwrap(result, "The Publisher shall publish a value when the change occurs.", file: file, line: line)

        return unwrappedResult
    }
}
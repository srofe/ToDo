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
    func test_add_shouldPublishChange() throws {
        let sut = ToDoItemStore()
        let toDoItem = ToDoItem(title: "Dummy")
        let receivedItems = try wait(for: sut.itemPublisher) {
            sut.add(toDoItem)
        }
        XCTAssertEqual(receivedItems, [toDoItem], "The ToDoItemStore shall publish items when when an item has been added to it.")
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

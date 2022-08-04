//
//  ToDoItemInputViewTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 4/8/2022.
//

import XCTest
@testable import ToDo
import ViewInspector

extension ToDoItemInputView: Inspectable {}

class ToDoItemInputViewTests: XCTestCase {
    var sut: ToDoItemInputView!
    var toDoItemData: ToDoItemData!

    override func setUpWithError() throws {
        toDoItemData = ToDoItemData()
        sut = ToDoItemInputView(data: toDoItemData)
    }

    override func tearDownWithError() throws {
        sut = nil
        toDoItemData = nil
    }

    func test_titleInput_shouldSetValueInData() throws {
        let expected = "Dummy title"
        try sut
            .inspect()
            .find(ViewType.TextField.self)
            .setInput(expected)
        let input = toDoItemData.title
        XCTAssertEqual(input, expected, "The title text field shall contain the item title.")
    }

    func test_whenWithoutDate_shouldNotShowDateInput() {
        XCTAssertThrowsError(try sut
            .inspect()
            .find(ViewType.DatePicker.self)
        )
    }

    func test_whenWithDate_shouldAllowDateInput() throws {
        let expectation = sut.on(\.didAppear) { view in
            try view.find(ViewType.Toggle.self).tap()
            let expected = Date(timeIntervalSince1970: 1_000_000)
            try view
                .find(ViewType.DatePicker.self)
                .select(date: expected)
            let input = self.toDoItemData.date
            XCTAssertEqual(input, expected, "When the date picker is available the date shall be set to the item date.")
        }
        ViewHosting.host(view: sut)
        wait(for: [expectation], timeout: 0.1)
    }
}

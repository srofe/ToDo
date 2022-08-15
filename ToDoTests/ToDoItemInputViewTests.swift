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
    var apiClientMock: APIClientMock!

    override func setUpWithError() throws {
        toDoItemData = ToDoItemData()
        apiClientMock = APIClientMock()
        sut = ToDoItemInputView(data: toDoItemData, apiClient: apiClientMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        toDoItemData = nil
        apiClientMock = nil
    }

    func test_titleInput_shouldSetValueInData() throws {
        let expected = "Dummy title"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Title"
            })
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
        let expected = Date()
        try sut.inspect().find(ViewType.Toggle.self).tap()
        try sut
            .inspect()
            .find(ViewType.DatePicker.self)
            .select(date: expected)
        let input = self.toDoItemData.date
        XCTAssertEqual(input, expected, "When the date picker is available the date shall be set to the item date.")
    }

    func test_shouldAllowDescriptionInput() throws {
        let expected = "Dummy description"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Description"
            })
            .setInput(expected)
        let input = toDoItemData.itemDescription
        XCTAssertEqual(input, expected, "The description text field shall contain the item description.")
    }

    func test_shouldAllowLocationInput() throws {
        let expected = "Dummy location"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Location"
            })
            .setInput(expected)
        let input = toDoItemData.locationName
        XCTAssertEqual(input, expected, "The location text field shall contain the item location name.")
    }

    func test_shouldAllowAddressInput() throws {
        let expected = "Dummy address"
        try sut
            .inspect()
            .find(ViewType.TextField.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Address"
            })
            .setInput(expected)
        let input = toDoItemData.addressString
        XCTAssertEqual(input, expected, "The address text field shall contain the item address text.")
    }

    func test_shouldHaveASaveButton() throws {
        XCTAssertNoThrow(try sut
            .inspect()
            .find(ViewType.Button.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Save"
            })
        )
    }

    func test_saveButton_shouldFetchCoordinates() throws {
        toDoItemData.title = "Dummy title"
        let expected = "Dummy address"
        toDoItemData.addressString = expected
        try sut
            .inspect()
            .find(ViewType.Button.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Save"
            })
            .tap()
        XCTAssertEqual(apiClientMock.coordinateAddress, expected, "Tapping the Save button shall retrieve address specified by the coordinates.")
    }

    func test_save_whenAddressEmpty_shouldNotFetchCoordinate() throws {
        toDoItemData.title = "Dummy title"
        try sut
            .inspect()
            .find(ViewType.Button.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Save"
            })
            .tap()
        XCTAssertNil(apiClientMock.coordinateAddress, "Tapping the save button when there are no coordinates shall not call the api client method.")
    }

    func test_save_shouldCallDelegate() throws {
        toDoItemData.title = "Dummy title"
        toDoItemData.addressString = "Dummy address"
        apiClientMock.coordinateReturnValue = Coordinate(latitude: 1, longitude: 2)
        let delegateMock = ToDoItemInputViewDelegateMock()
        sut.delegate = delegateMock
        try sut
            .inspect()
            .find(ViewType.Button.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == "Save"
            })
            .tap()
        XCTAssertEqual(delegateMock.lastToDoItemData?.title, "Dummy title", "Tapping the save button shall call the view delegate method - item title.")
        XCTAssertEqual(delegateMock.lastCoordinate?.latitude, 1, "Tapping the save button shall call the view delegate method - item latitude retrieved.")
        XCTAssertEqual(delegateMock.lastCoordinate?.longitude, 2, "Tapping the save button shall call the view delegate method - item longitude retrieved.")
    }
}

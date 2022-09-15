//
//  AppCoordinatorTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 16/9/2022.
//

import XCTest
@testable import ToDo

class AppCoordinatorTests: XCTestCase {
    var sut: AppCoordinator!
    var navigationControllerMock: NavigationControllerMock!
    var window: UIWindow!

    override func setUpWithError() throws {
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        navigationControllerMock = NavigationControllerMock()
        sut = AppCoordinator(window: window, navigationController: navigationControllerMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationControllerMock = nil
        window = nil
    }

    func test_start_shouldSetDelegate() throws {
        sut.start()
        let listViewController = try XCTUnwrap(navigationControllerMock.lastPushedViewController as? ToDoItemsListViewController, "The ToDoItemsListViewController shall be a sub-view of the Navigation Controller.")
        XCTAssertIdentical(listViewController.delegate as? AppCoordinator, sut, "The Application Coordinator shall be the delegate for the ToDoItemsListViewController.")
    }

    func test_start_shouldAssignItemStore() throws {
        sut.start()
        let listViewController = try XCTUnwrap(navigationControllerMock.lastPushedViewController as? ToDoItemsListViewController, "The ToDoItemsListViewController shall be a sub-view of the Navigation Controller.")
        XCTAssertNotNil(listViewController.toDoItemStore)
    }
}

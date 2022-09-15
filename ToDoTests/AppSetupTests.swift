//
//  AppSetupTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 16/9/2022.
//

import XCTest
@testable import ToDo

class AppSetupTests: XCTestCase {
    func test_application_shouldSetupRoot() throws {
        let application = UIApplication.shared
        let scene = application.connectedScenes.first as? UIWindowScene
        let root = scene?.windows.first?.rootViewController
        let nav = try XCTUnwrap(root as? UINavigationController, "The Application's root view controller shall be a Navigation Controller.")
        XCTAssert(nav.topViewController is ToDoItemsListViewController, "The Navigation Controller's top view controller shall be a ToDoItemsListViewController.")
    }
}

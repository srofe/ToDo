//
//  ToDoItemsListViewControllerDelegationMock.swift
//  ToDoTests
//
//  Created by Simon Rofe on 2/8/2022.
//

import Foundation
@testable import ToDo
import UIKit

class ToDoItemsListViewControllerDelegationMock: ToDoItemsListViewControllerDelegation {
    var selectToDoItemReceivedArguments: (viewController: UIViewController, item: ToDoItem)?

    func selectToDoItem(_ viewController: UIViewController, item: ToDoItem) {
        selectToDoItemReceivedArguments = (viewController, item)
    }
}

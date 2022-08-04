//
//  ToDoItemData.swift
//  ToDo
//
//  Created by Simon Rofe on 4/8/2022.
//

import Foundation

class ToDoItemData: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var withDate = false
}

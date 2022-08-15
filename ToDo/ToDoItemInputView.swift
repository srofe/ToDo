//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by Simon Rofe on 4/8/2022.
//

import SwiftUI

struct ToDoItemInputView: View {
    @ObservedObject var data: ToDoItemData
    let apiClient: APIClientProtocol

    var body: some View {
        Form {
            SwiftUI.Section {
                TextField("Title", text: $data.title)
                Toggle("Add Date", isOn: $data.withDate)
                if data.withDate {
                    DatePicker("Date", selection: $data.date)
                }
                TextField("Description", text: $data.itemDescription)
            }
            SwiftUI.Section {
                TextField("Location", text: $data.locationName)
                TextField("Address", text: $data.addressString)
            }
            SwiftUI.Section {
                Button(action: addToDoItem,
                       label: {
                    Text("Save")
                })
            }
        }
    }

    private func addToDoItem() {
        apiClient.coordinate(
            for: data.addressString,
            completion: { coordinate in
            })
    }
}

struct ToDoItemInputView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemInputView(data: ToDoItemData(), apiClient: APIClient())
    }
}

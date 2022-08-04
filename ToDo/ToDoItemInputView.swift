//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by Simon Rofe on 4/8/2022.
//

import SwiftUI

struct ToDoItemInputView: View {
    @ObservedObject var data: ToDoItemData

    var body: some View {
        TextField("Title", text: $data.title)
    }
}

struct ToDoItemInputView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemInputView(data: ToDoItemData())
    }
}

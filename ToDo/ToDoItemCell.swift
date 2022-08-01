//
//  ToDoItemCell.swift
//  ToDo
//
//  Created by Simon Rofe on 1/8/2022.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

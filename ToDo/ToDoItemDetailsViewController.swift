//
//  ToDoItemDetailsViewController.swift
//  ToDo
//
//  Created by Simon Rofe on 2/8/2022.
//

import UIKit
import MapKit

class ToDoItemDetailsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var doneButton: UIButton!
    var toDoItem: ToDoItem? {
        didSet {
            titleLabel.text = toDoItem?.title
        }
    }
}

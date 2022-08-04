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
    let dateFormatter = DateFormatter()
    var toDoItem: ToDoItem? {
        didSet {
            titleLabel.text = toDoItem?.title
            if let timestamp = toDoItem?.timestamp {
                dateLabel.text = dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))
            }
            if let description = toDoItem?.itemDescription {
                descriptionLabel.text = description
            }
            if let location = toDoItem?.location {
                locationLabel.text = location.name
            }
            if let coordinate = toDoItem?.location?.coordinate {
                mapView.setCenter(CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), animated: false)
            }
            doneButton.isEnabled = false
        }
    }
}

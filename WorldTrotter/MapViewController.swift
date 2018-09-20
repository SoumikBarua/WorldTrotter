//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by SB on 8/18/17.
//  Copyright © 2017 SB. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
        
        // Delegate and Core Location
        mapView.delegate = self
        locationManager = CLLocationManager()
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // Button for displaying and zooming in on the user's current location
        let locationButton = UIButton()
        locationButton.setTitle("Tap for location", for: .normal)
        locationButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        locationButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        locationButton.setTitleColor(UIColor.black, for: .normal)
        locationButton.layer.cornerRadius = 7
        locationButton.clipsToBounds = true
        
        locationButton.addTarget(self, action: #selector(MapViewController.showLocation(_:)), for: .touchUpInside)
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(locationButton)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let bottomConstraint = locationButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -8)
        let centerXConstraint = locationButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        
        bottomConstraint.isActive = true
        centerXConstraint.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    func showLocation(_ sender: UIButton) {
        print("Came to showLocation func")
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let zoomedLocation = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 500, 500)
        mapView.setRegion(zoomedLocation, animated: true)
    }
}

//
//  PlacesDetailViewController.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 31.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit
import MapKit

class PlacesDetailViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!

    var presenter: PlacesDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
    }

}

extension PlacesDetailViewController: PlacesDetailViewProtocol {
    func getPlaceInfo(lat: Double, lng: Double) {
        let annotation = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: lat,
                                                longitude: lng)
        annotation.coordinate = coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }

    func setNavigationTitle(title: String) {
        navigationItem.title = title
    }
}

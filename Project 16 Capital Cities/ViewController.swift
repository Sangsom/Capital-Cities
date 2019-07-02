//
//  ViewController.swift
//  Project 16 Capital Cities
//
//  Created by Rinalds Domanovs on 02/07/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "View",
            style: .done,
            target: self,
            action: #selector(changeMapView))

        let london = Capital(
            title: "London",
            coordinate: CLLocationCoordinate2D(
                latitude: 51.507222,
                longitude: -0.1275),
            info: "Home to the 2012 Summer Olympics.",
            url: URL(string: "https://en.wikipedia.org/wiki/London")!)
        let oslo = Capital(
            title: "Oslo",
            coordinate: CLLocationCoordinate2D(
                latitude: 59.95,
                longitude: 10.75),
            info: "Founded over a thousand years ago.",
            url: URL(string: "https://en.wikipedia.org/wiki/Oslo")!)
        let paris = Capital(
            title: "Paris",
            coordinate: CLLocationCoordinate2D(
                latitude: 48.8567,
                longitude: 2.3508),
            info: "Often called the City of Light.",
            url: URL(string: "https://en.wikipedia.org/wiki/Paris")!)
        let rome = Capital(
            title: "Rome",
            coordinate: CLLocationCoordinate2D(
                latitude: 41.9,
                longitude: 12.5),
            info: "Has a whole country inside it.",
            url: URL(string: "https://en.wikipedia.org/wiki/Rome")!)
        let washington = Capital(
            title: "Washington",
            coordinate: CLLocationCoordinate2D(
                latitude: 38.895111,
                longitude: -77.036667),
            info: "Named after George himself.",
            url: URL(string: "https://en.wikipedia.org/wiki/Washington%2C_D.C.")!)
        let riga = Capital(
            title: "Riga",
            coordinate: CLLocationCoordinate2D(
                latitude: 56.948889,
                longitude: 24.106389),
            info: "Riga began to develop as a centre of Viking trade during the early Middle Ages.",
            url: URL(string: "https://en.wikipedia.org/wiki/Riga")!)
        let tallin = Capital(
            title: "Tallin",
            coordinate: CLLocationCoordinate2D(
                latitude: 59.437222,
                longitude: 24.745278),
            info: "Tallinn, first mentioned in 1219, received city rights in 1248 but the earliest human settlements date back 5,000 years.",
            url: URL(string: "https://en.wikipedia.org/wiki/Tallinn")!)
        let vilnius = Capital(
            title: "Vilnius",
            coordinate: CLLocationCoordinate2D(
                latitude: 54.683333,
                longitude: 25.283333),
            info: "Vilnius is classified as a Gamma global city according to GaWC studies.",
            url: URL(string: "https://en.wikipedia.org/wiki/Vilnius")!)

        mapView.addAnnotations([london, oslo, paris, rome, washington, riga, tallin, vilnius])
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }

        // 2
        let identifier = "Capital"

        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        annotationView?.pinTintColor = UIColor.red

        if annotationView == nil {
            // 4
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true

            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6
            annotationView?.annotation = annotation
        }

        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
//        let placeName = capital.title
//        let placeInfo = capital.info

//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)

        // Open new view controller
        let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        vc.url = capital.url
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func changeMapView() {
        let ac = UIAlertController(
            title: "Map View",
            message: "Please select how you want to view map.",
            preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { action in
            self.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: { action in
            self.mapView.mapType = .hybridFlyover
        }))
        ac.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: { action in
            self.mapView.mapType = .mutedStandard
        }))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { action in
            self.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Satellite Flyover", style: .default, handler: { action in
            self.mapView.mapType = .satelliteFlyover
        }))
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { action in
            self.mapView.mapType = .standard
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
}


//
//  ViewController.swift
//  mapkit
//
//  Created by admin on 7/30/19.
//  Copyright © 2019 admin. All rights reserved.
//
import MapKit
import UIKit


class ViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nyc = Capital(title: "New York", coordinate:CLLocationCoordinate2D(latitude: 40.7428, longitude: -73.9712), info: "The city that doesn't sleep")
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        mapView.addAnnotations([nyc,london,washington,rome,paris])
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {return nil}
        let identifier = "Capital"
        var annotaionView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotaionView == nil{
            annotaionView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotaionView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotaionView?.rightCalloutAccessoryView = btn
            
           
        }else{
            annotaionView?.annotation = annotation
        }
        
        return annotaionView
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital  = view.annotation as? Capital else{return}
        let name = capital.title
        let placeInfo = capital.info
        let ac = UIAlertController(title: name, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
        
    }
    
    
}

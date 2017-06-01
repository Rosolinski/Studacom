//
//  MapViewController.swift
//  Studacom
//
//  Created by Robin Osolinski on 23/03/2017.
//  Copyright © 2017 Robin Osolinski. All rights reserved.
//

import UIKit
import Foundation
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON


class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var showingAlert = false
    var refreshAlert: UIAlertController?
    
    var accommodations = [Accommodation]()
    
    @IBOutlet weak var PropertyMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.PropertyMap.showsUserLocation = true
            
        self.PropertyMap.mapType = MKMapType.hybrid
        self.PropertyMap.showsUserLocation = true
        PropertyMap.setUserTrackingMode(.follow, animated: true)
        PropertyMap.delegate = self
        
        loadAccommodation()
        
    }
    
    func loadAccommodation() {
        Alamofire.request("http://139.59.174.112/api/accommodations.json").response { [unowned self] response in
            
            guard let data = response.data else { return }
            
            let json = JSON(data: data)
            
            for accommodationData in json["data"].arrayValue {
                let accommodation = Accommodation(json: accommodationData)
                self.accommodations.append(accommodation)
            }
            
            self.addAnnotations()
        }
    }
    
    func addAnnotations() {
        for accommodation in accommodations {
            let annotation = CustomAnnotation()
            annotation.accommodation = accommodation
            annotation.coordinate = accommodation.coordinate
            annotation.title = "£\(accommodation.price!) pcm"
            PropertyMap.addAnnotation(annotation)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isEqual(mapView.userLocation) {
            
            let identifier = "User"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil{
                annotationView = CustomPointAnnotation(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
            } else {
                annotationView!.annotation = annotation
            }
            
            annotationView!.image = UIImage(named: "BlueHouse")!
            
            return annotationView
            
        }
        return nil
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "propertyMapSegue" {
            let vc = segue.destination as! PropertyInfoViewController
            vc.accommodation = sender as! Accommodation
        }
        
        
    }
    

}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let annotation = view.annotation as? CustomAnnotation else { return }
        
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "propertyMapSegue", sender: annotation.accommodation)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "An"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if anView == nil {
            anView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView?.animatesDrop = true
            anView?.canShowCallout = true
            anView?.isDraggable = true
            anView?.pinTintColor = .blue
            let rightButton: AnyObject! = UIButton(type: UIButtonType.detailDisclosure)
            anView?.rightCalloutAccessoryView = rightButton as? UIView
        }
        else {
            anView?.annotation = annotation
            anView?.image = UIImage(named: "BlueHouse")
        }
        
        if let anView = anView {
            // Configure your annotation view here
            anView.canShowCallout = true
        }
        
        return anView
    }
    
    
}

class CustomPointAnnotation: MKAnnotationView {
    var imageName: String!
}

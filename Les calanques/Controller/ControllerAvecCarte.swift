//
//  ControllerAvecCarte.swift
//  Les calanques
//
//  Created by Thierry Huu on 13/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var calanques: [Calanque] = CalanqueCollection().all()
    
    let reuseIdentifier = "reuseID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addAnnotations()
    }
    
    func addAnnotations() {
        for calanque in calanques {

            // Annotation de base
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = calanque.coordonnee
//            annotation.title = calanque.nom
//            mapView.addAnnotation(annotation)
            
            // Annotation personnalisée
            let annotation = MonAnnotation(calanque)
            mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // Vérifier que ce n'est pas la position de l'utilisateur
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        if let anno = annotation as? MonAnnotation {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                annotationView?.image = UIImage(named: "placeholder")
                annotationView?.canShowCallout = true
                return annotationView
            } else {
                return annotationView
            }
        }
        
        return nil
    }
    
    @IBAction func getPosition(_ sender: Any) {
        
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = MKMapType.standard
        case 1: mapView.mapType = MKMapType.satellite
        case 2: mapView.mapType = MKMapType.hybrid
        default: break
        }
    }
}

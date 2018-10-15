//
//  ControllerAvecCarte.swift
//  Les calanques
//
//  Created by Thierry Huu on 13/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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

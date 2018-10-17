//
//  MonAnnotation.swift
//  Les calanques
//
//  Created by Thierry Huu on 16/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
     var title: String?
    var calanque: Calanque
   
    init(_ calanque: Calanque) {
        self.calanque = calanque
        coordinate = calanque.coordonnee
        title = calanque.nom
    }
}

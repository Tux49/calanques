//
//  MonAnnotationView.swift
//  Les calanques
//
//  Created by Thierry Huu on 17/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        image = UIImage(named: "placeholder")
        canShowCallout = true
        
        leftCalloutAccessoryView = setupLeft()
        rightCalloutAccessoryView = setupRight()
        detailCalloutAccessoryView = setupCenter()
    }

    func setupLeft() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "distance"), for: .normal)
        button.addTarget(self, action: #selector(distance), for: .touchUpInside)
        return button
    }

    func setupRight() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "detail"), for: .normal)
        button.addTarget(self, action: #selector(detail), for: .touchUpInside)
        return button
    }
    
    func setupCenter() -> UIView {
        guard let anno = annotation as? MonAnnotation else { return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)) }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = true
        view.widthAnchor.constraint(equalToConstant: 125).isActive = true
        view.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = anno.calanque.image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        return view
    }
    
    @objc func distance() {
    }

    @objc func detail() {
        guard let anno = annotation as? MonAnnotation else { return }
        
        NotificationCenter.default.post(name: Notification.Name("detail"), object: anno.calanque)
    }
}

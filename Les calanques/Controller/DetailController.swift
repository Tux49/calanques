//
//  DetailController.swift
//  Les calanques
//
//  Created by Thierry Huu on 14/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var calanqueIV: ImageRonde!
    @IBOutlet weak var nomEtDesc: UITextView!
    
    var calanqueRecue: Calanque?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let calanque = calanqueRecue else { return }
        calanqueIV.image = calanque.image
        nomEtDesc.text = calanque.nom
        
        let mutable = NSMutableAttributedString(string: calanque.nom + "\n\n",
                                                attributes: [
                                                .foregroundColor: UIColor.red,
                                                .font: UIFont.boldSystemFont(ofSize: 20)
                                                ])
        mutable.append(NSMutableAttributedString(
            string: calanque.desc,
            attributes: [
                .font: UIFont.italicSystemFont(ofSize: 17),
                .foregroundColor: UIColor.darkGray
            ]))
        
        nomEtDesc.attributedText = mutable
        nomEtDesc.textAlignment = .center
    }
}

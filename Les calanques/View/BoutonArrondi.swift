//
//  BoutonArrondi.swift
//  Les calanques
//
//  Created by Thierry Huu on 14/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit

class BoutonArrondi: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = 10
    }

}

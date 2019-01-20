//
//  CustomTextField.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 19..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit
import QuartzCore

class CustomTextField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        layer.cornerRadius = 5
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

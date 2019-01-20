//
//  IncomeCustomView.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 20..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit

@IBDesignable
open class IncomeCustomView: UIView {

    @IBInspectable
    public var cornerRadius: CGFloat = 2 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    public var borderColor : UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var borderWith: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = borderWith
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

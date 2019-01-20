//
//  RegisterButtonview.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 20..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit

class RegisterButtonview: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("sssss")
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped)))
        backgroundColor = .red
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: -100, height: 100)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        
    }
    
    @objc func buttonTapped(){
        print("xxxx")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}

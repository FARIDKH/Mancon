//
//  ToIncomePageSegue.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 20..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit

class ToIncomePageSegue: UIStoryboardSegue {
    override func perform() {
        
        let fromVC = source as! HomeViewController
        let toVC = destination as! IncomeViewController
        
        let containerView = fromVC.view.superview
        containerView?.addSubview(toVC.view)
        
        let submitButton = fromVC.submitButton!
        
        let shapeLayer = CAShapeLayer()
        toVC.view.layer.mask = shapeLayer
        shapeLayer.fillColor = UIColor.blue.cgColor
        
        let startPath = UIBezierPath(ovalIn: submitButton.frame).cgPath
        let endPath = UIBezierPath(arcCenter: submitButton.center, radius: 1500, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true).cgPath
        shapeLayer.path = startPath
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = startPath
        pathAnimation.toValue = endPath
        pathAnimation.duration = 0.5
        pathAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.fillMode = .both
        
        shapeLayer.add(pathAnimation, forKey: "path")
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            
        }) { (finished) in
            self.source.present(self.destination, animated: false, completion: nil)
        }
        
    }
}

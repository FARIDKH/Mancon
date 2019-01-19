//
//  ViewController.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 18..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit


extension UIView {
    func dropShadow(){
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
    }
    
    func removeShadow(){
        layer.shadowOpacity = 0
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var registartionViews: [UIView]!
    @IBOutlet weak var registerConstraint: NSLayoutConstraint!
    @IBOutlet weak var logInConstraint: NSLayoutConstraint!
    @IBOutlet weak var registerContainerView: UIView!
    @IBOutlet weak var logInContainerView: UIView!
    @IBOutlet weak var logInRegisterButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var selectedTag:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSegmentedControl()
        registerContainerView.isHidden = true
        logInContainerView.isHidden = false
        
        setUpButton()
        for i in self.registartionViews{
            i.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerViewTapped(tag:))))
        }
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @objc func registerViewTapped(tag: Int){
        print("kkkk")
    }
    
    func setUpButton(){
        self.logInRegisterButton.titleEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        self.logInRegisterButton.layer.cornerRadius = 5
    }
    
    func setUpSegmentedControl(){
        segmentedControl.setTitle("Log In", forSegmentAt: 0)
        segmentedControl.setTitle("Register", forSegmentAt: 1)
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .white
        segmentedControl.addTarget(self, action: #selector(segmenedControlPressed), for: .allEvents)
    }
    
    @objc func segmenedControlPressed(){
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            logInRegisterButton.setTitle("Sign In", for: .normal)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.logInContainerView.isHidden = false
                self.registerContainerView.isHidden = true
                self.logInConstraint.priority = .defaultHigh
                self.registerConstraint.priority = .defaultLow
            }, completion: nil)
            
            break
        case 1:
            logInRegisterButton.setTitle("Sign Up", for: .normal)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.logInContainerView.isHidden = true
                self.registerContainerView.isHidden = false
                self.logInConstraint.priority = .defaultLow
                self.registerConstraint.priority = .defaultHigh
            }, completion: nil)
            
            
            
            break
        default:
            break
        }
    }
    
    
    
}


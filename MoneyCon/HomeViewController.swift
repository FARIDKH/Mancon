//
//  ViewController.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 18..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit




class HomeViewController : UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var homeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var signUpContainerView: UIView!
    @IBOutlet weak var signInContainerView: UIView!
    @IBOutlet weak var logInConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSegmentedControl()
        signUpContainerView.isHidden = true
        signInContainerView.isHidden = false
        setUpButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame : CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = self.homeScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        homeScrollView.contentInset = contentInset
        
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        homeScrollView.contentInset = .zero
    }
    
    
    
    
    func setUpButton(){
        self.submitButton.titleEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        self.submitButton.layer.cornerRadius = 5
    }
    
    func setUpSegmentedControl(){
        homeSegmentedControl.setTitle("Log In", forSegmentAt: 0)
        homeSegmentedControl.setTitle("Register", forSegmentAt: 1)
        homeSegmentedControl.backgroundColor = .clear
        homeSegmentedControl.tintColor = .white
        homeSegmentedControl.addTarget(self, action: #selector(segmenedControlPressed), for: .allEvents)
    }
    
    @objc func segmenedControlPressed(){
        var scrollViewHeight = homeScrollView.frame.height
        let scrollViewWidth = homeScrollView.frame.width
        var padding: CGFloat = 0
        if view.frame.height > 667 {
            padding = 100
        } else {
            padding = 200
        }
        switch self.homeSegmentedControl.selectedSegmentIndex {
        case 0:
            submitButton.setTitle("Sign In", for: .normal)
            scrollViewHeight -= padding
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.signInContainerView.isHidden = false
                self.signUpContainerView.isHidden = true
                self.logInConstraint.priority = .defaultHigh
                self.signUpConstraint.priority = .defaultLow
            }, completion: nil)
            
            break
        case 1:
            submitButton.setTitle("Sign Up", for: .normal)
//            print("1)")
//            print(scrollViewHeight)
//            print("2)")
//            print(signUpContainerView.frame.height)
            
            scrollViewHeight += padding
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.signInContainerView.isHidden = true
                self.signUpContainerView.isHidden = false
                self.logInConstraint.priority = .defaultLow
                self.signUpConstraint.priority = .defaultHigh
            }, completion: nil)
            break
        default:
            break
        }
        homeScrollView.contentSize = CGSize(width: scrollViewWidth, height: scrollViewHeight)
        
    }
    
    
    
}


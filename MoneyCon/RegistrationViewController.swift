//
//  RegistrationViewController.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 20..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(){
        
       
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundColor = .white
            
        }, completion: nil)
        
    }
    
    func removeShadow(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundColor = .clear
        }, completion: nil)
    }
    
}

extension UILabel {
    func changeTintColor(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.textColor = .black
            
        }, completion: nil)
    }
    func removeColor(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.textColor = .white
            
        }, completion: nil)
    }
}

class RegistrationViewController: UIViewController,UIGestureRecognizerDelegate,UITextFieldDelegate {

    @IBOutlet var registrationViews: [UIView]!
    
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var secondNameView: UIView!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var secondNameTextField: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    var selectedTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUpGestures()
        setUpDelegates()
    }
    
    func setUpDelegates(){
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setUpGestures(){
        
        let tapGestureRecognize = UITapGestureRecognizer(target: self, action: #selector(confirmPasswordTapped))
        confirmPasswordView.addGestureRecognizer(tapGestureRecognize)
        
        let passwordTap = UITapGestureRecognizer(target: self, action: #selector(passwordTapped))
        passwordView.addGestureRecognizer(passwordTap)
        
        
        let emailTap = UITapGestureRecognizer(target: self, action: #selector(emailTapped))
        emailView.addGestureRecognizer(emailTap)
        
        let lastNameTap = UITapGestureRecognizer(target: self, action: #selector(lastNameTapped))
        secondNameView.addGestureRecognizer(lastNameTap)
        
        let firstNameTap = UITapGestureRecognizer(target: self, action: #selector(firstNameTapped))
        firstNameView.addGestureRecognizer(firstNameTap)
        
        let phoneNumberTap = UITapGestureRecognizer(target: self, action: #selector(phoneNumberTapped))
        phoneNumberView.addGestureRecognizer(phoneNumberTap)
        
        
    }
    
    func removeShadowFromView(){
        firstNameLabel.removeColor()
        secondNameLabel.removeColor()
        phoneNumberLabel.removeColor()
        emailLabel.removeColor()
        passwordLabel.removeColor()
        confirmPasswordLabel.removeColor()
        for view in registrationViews {
            view.removeShadow()
        }
    }
    @objc func confirmPasswordTapped(){
        removeShadowFromView()
        confirmPasswordView.dropShadow()
        confirmPasswordLabel.changeTintColor()
    }
    
    @objc func passwordTapped(){
        removeShadowFromView()
        passwordView.dropShadow()
        passwordLabel.changeTintColor()
    }

    @objc func emailTapped(){
        removeShadowFromView()
        emailView.dropShadow()
        emailLabel.changeTintColor()
    }
    
    @objc func lastNameTapped(){
        removeShadowFromView()
        secondNameView.dropShadow()
        secondNameLabel.changeTintColor()
    }
    
    @objc func firstNameTapped(){
        removeShadowFromView()
        firstNameView.dropShadow()
        firstNameLabel.changeTintColor()
    }
    
    @objc func phoneNumberTapped(){
        removeShadowFromView()
        phoneNumberView.dropShadow()
        phoneNumberLabel.changeTintColor()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

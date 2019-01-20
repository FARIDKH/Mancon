//
//  IncomeViewController.swift
//  MoneyCon
//
//  Created by Farid Ganbarli on 2019. 01. 20..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit


class IncomeViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var incomeLabel: UILabel!
    
    @IBOutlet weak var incomeTextField: UITextField!
    
    private let accesoryView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.backgroundColor = .black
        view.alpha = 0.6
        return view
    }()
    
    private let doneButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(doneButtonIsPressed), for: .allTouchEvents)
//        button.showsTouchWhenHighlighted = true
        return button
    }()
    
    @objc func doneButtonIsPressed(){
        incomeTextField.resignFirstResponder()
    }

    
    func addAccesory(){
        
        accesoryView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40)
        
        accesoryView.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.incomeTextField.inputAccessoryView = accesoryView
        
        accesoryView.addSubview(doneButton)
        NSLayoutConstraint.activate([
                doneButton.topAnchor.constraint(equalTo: accesoryView.topAnchor, constant: 5),
                doneButton.leadingAnchor.constraint(equalTo: accesoryView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//                doneButton.bottomAnchor.constraint(equalTo: accesoryView.bottomAnchor, constant: 10),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incomeTextField.delegate = self
        addAccesory()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        incomeLabel.text = "Income: $\(textField.text ?? "0.00")"
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

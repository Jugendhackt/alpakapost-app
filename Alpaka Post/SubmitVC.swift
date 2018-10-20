//
//  SubmitVC.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import UIKit

class SubmitVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var durationTextView: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmBtn.layer.cornerRadius = 5
        confirmBtn.layer.masksToBounds = false
        
        startTextField.delegate = self
        destinationTextField.delegate = self
        durationTextView.delegate = self
    }
    
    @IBAction func submitted(_ sender: UIButton) {
        let start = startTextField.text!
        let destination = destinationTextField.text!
        let duration = Double(durationTextView.text!) ?? 0
        let startDate = startDatePicker.date
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

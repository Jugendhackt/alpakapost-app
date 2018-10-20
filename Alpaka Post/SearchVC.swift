//
//  ViewController.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var destTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func searchBtnPressed(_ sender: UIButton) {
        //search
        if !areValuesValid(){
            let alert = UIAlertController(title: "No City Entered", message: "Please check the cities you have entered agian.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let connectionViewController = storyboard.instantiateViewController(withIdentifier: "connectionVC")
            
            self.navigationController?.pushViewController(connectionViewController, animated: true)
        }
    }
    
    func areValuesValid() -> Bool{
        if startTextField.text != "" && destTextField.text != ""{
            return true
        }
        return false
    }
    
}


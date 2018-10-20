//
//  ViewController.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class SearchVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var destTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var volunteerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let hackspaces = Client.shared.getHackerspaces()
        for hackspace in hackspaces {
            addHackspace(hackspace: hackspace)
        }
        
        startTextField.delegate = self
        destTextField.delegate = self
        
        self.volunteerBtn.isHidden = !Client.shared.anythingToVolunteer()
    }

    @IBAction func searchBtnPressed(_ sender: UIButton) {
        //search
        if !areValuesValid(){
            let alert = UIAlertController(title: "No City Entered", message: "Please check the cities you have entered agian.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        Client.shared.start = self.startTextField.text!
        Client.shared.destination = self.destTextField.text!
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let connectionViewController: ConnectionsVC = storyboard.instantiateViewController(withIdentifier: "connectionVC") as! ConnectionsVC
            
            self.navigationController?.pushViewController(connectionViewController, animated: true)
        }
    }
    
    func areValuesValid() -> Bool{
        if startTextField.text != "" && destTextField.text != ""{
            return true
        }
        return false
    }
    
    func addHackspace(hackspace: Hackerspace){
        let hackspaceAnnotation = MKPointAnnotation()
        hackspaceAnnotation.coordinate = hackspace.location
        hackspaceAnnotation.title = hackspace.name
        
        self.mapView.addAnnotation(hackspaceAnnotation)
        self.mapView.selectAnnotation(hackspaceAnnotation, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


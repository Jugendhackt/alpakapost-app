//
//  COnnectionsVC.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import UIKit

class ConnectionsVC: UIViewController {
    

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func displayData(){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
        
    }
}

//
//  COnnectionsVC.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import UIKit

class ConnectionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var connectionTable = UITableView()
    var connection :[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        self.connectionTable = UITableView()
        self.connectionTable.delegate = self
        self.connectionTable.dataSource = self
        self.connectionTable.register(UITableViewCell.self, forCellReuseIdentifier: "connectionCell")
    }
    
    func displayData(){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "connectionCell")!
        cell.textLabel?.text = "Connection #\(indexPath.row)"
        return cell
    }
}

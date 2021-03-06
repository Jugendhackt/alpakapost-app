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
    @IBOutlet weak var connectionTable: UITableView!
    var connection :[Ride] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        
        self.connectionTable.delegate = self
        self.connectionTable.dataSource = self
        self.connectionTable.register(UITableViewCell.self, forCellReuseIdentifier: "connectionCell")
        
        let client = Client.shared
        let connections = client.getConnections(from: client.start, to: client.destination)
        displayData(connections: connections)
    }
    
    func displayData(connections: [Ride]){
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
        self.connection = connections
        self.connectionTable.reloadData()
        self.view.addSubview(connectionTable)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.connection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "connectionCell")!
        let connection = self.connection[indexPath.row]
        
//        let dateOfArrival = connection.startTime.addingTimeInterval((connection.duration))
//        let dateFormatter = DateFormatter()
//        dateFormatter.calendar = Calendar(identifier: .iso8601)
//        dateFormatter.dateFormat = "dd.MM. hh:ss"
//        let dateString = dateFormatter.string(from: dateOfArrival)
        
        
        let title = "\(connection.start) -> \(connection.destination) "//| Arrival at \(dateString)"
        
        cell.textLabel?.text = title
        return cell
    }
}

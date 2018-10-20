//
//  DeliverVC.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import UIKit

class DeliverVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.frame = self.view.frame
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "package")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var sections = 0
        
        if Client.shared.myparcels.count != 0 {
            sections += 1
        }
        
        if Client.shared.volunteeringCauses.count != 0 {
            sections += 1
        }
        
        if Client.shared.possibleVolunteeringCauses.count != 0 {
            sections += 1
        }
        
        if sections == 0 {
            let alert = UIAlertController(title: "Nothing To Show", message: "There is no package you sent, deliverd or you were invited to deliver.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Client.shared.packages.count
        }
        return Client.shared.volunteeringCauses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "package")!
        
        if indexPath.section == 0 {
            
        } else {
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Parcel Tracking"
        }
        
        if section == 1{
            return "Volunteering Transport"
        }
        
        if section == 2{
            return "Pending Volunteering Invitation"
        }
        
        return ""
    }
}

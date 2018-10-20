//
//  Client.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import Foundation
import SwiftyJSON

class Client {
    private static let instance = Client()
    
    static var shared: Client {
        return instance
    }
    
    var start: String = ""
    var destination: String = ""
    
    private var saved_packages :[PackageDelivery]?
    
    var rides :[Ride] = []
    
    let baseURL = "http://100.100.255.49:8080/"
    
    func getConnections(from: String, to: String) -> [[Ride]] {
        return [[Ride(start: "Berlin", destination: "Leipzig", startTime: 34573475, duration: 23409, driverName: "Paul", driverID: 30), Ride(start: "Leipzig", destination: "München", startTime: 3471924982, duration: 345834, driverName: "Josef", driverID: 35968)], [Ride(start: "Berlin", destination: "Köln", startTime: 9248572895, duration: 23540, driverName: "Manuel", driverID: 023234), Ride(start: "Köln", destination: "Kiel", startTime: 3494598, duration: 4985, driverName: "Robert", driverID: 2349), Ride(start: "Kiel", destination: "München", startTime: 0293409, duration: 234099, driverName: "Hebert", driverID: 0349)]]
    }
    
    func getHackerspaces() -> [Hackerspace]{
        let request = baseURL + "locations"
        let url = URL(string: request)!
        do{
            let data = try? String(contentsOf: url)
            let json = JSON(parseJSON: data!)
            
            var hackerspaces :[Hackerspace] = []
            for index in 0..<json.count {
                let name = json[index]["name"].stringValue
                let lat = json[index]["latitude"].doubleValue
                let long = json[index]["longitude"].doubleValue
                
                hackerspaces.append(Hackerspace(name: name, latitude: lat, longitude: long))
            }
            
            return hackerspaces
        }catch{
            return [Hackerspace]()
        }
    }
    
    var packages: [PackageDelivery] {
        get {
            if self.saved_packages == nil{
                //Get packages from backend
                let request = baseURL + ""
                let url = URL(string: request)
                do{
                    let data = try? String(contentsOf: url!)
                    let json = JSON(parseJSON: data!)
                    
                    let endIndex = json.count
                    
                    for index in 0..<endIndex{
                        let start = json[index]["start"].stringValue
                        let destination = json[index]["destination"].stringValue
                        let mass = json[index]["mass"].doubleValue
                        let dimensions = json[index]["dimensions"].stringValue
                        let points = json[index]["points"].intValue
                        
                        let package = PackageDelivery(start: start, destination: destination, mass: Int(mass), dimensions: dimensions, points: points)
                        self.saved_packages?.append(package)
                    }
                    
                }
            }
            return self.saved_packages!
        }
    }
    
}

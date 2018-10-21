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
    private var saved_myPackages: [MyPackage]?
    
    var rides :[Ride] = []
    
    var possibleVolunteeringCauses :[PackageDelivery] = []
    var volunteeringCauses :[PackageDelivery] = []
    
    let baseURL = "http://100.100.255.49:8080/"
    
    func getConnections(from: String, to: String) -> [Ride] {
        var connection = [Ride]()
        
        let request = baseURL + "route?start_location_id=95&destination_location_id=134"
        let url = URL(string: request)!
        do{
            let data = try? String(contentsOf: url)
            let json = JSON(parseJSON: data!)
            
            for index in 0..<json.count {
                let name = json[index]["hs1_name"].stringValue
                let destination = json[index]["hs2_name"].stringValue
//                let startTime = json[index]["start_time"].double
//                let duration = json[index]["duration"].doubleValue
                
                connection.append(Ride(start: name, destination: destination, startTime: 1.0, duration: 1.0, driverName: "Driver", driverID: 42))
            }
            
            return connection
        }catch{
            return connection
        }
//        return [Ride(start: "Berlin", destination: "Leipzig", startTime: 34573475, duration: 23409, driverName: "Paul", driverID: 30), Ride(start: "Leipzig", destination: "München", startTime: 3471924982, duration: 345834, driverName: "Josef", driverID: 35968)]
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
    
    func anythingToVolunteer() -> Bool{
        self.possibleVolunteeringCauses = []
        return false
    }
    
    var myparcels: [MyPackage] {
        get{
            if self.saved_myPackages == nil{
                //get all that stuff
                let request = baseURL + "goods?user_id=1"
                let url = URL(string: request)
                do{
                    let data = try? String(contentsOf: url!)
                    let json = JSON(parseJSON: data!)
                    
                    let endIndex = json.count
                    for index in 1..<endIndex{
                        //let package = MyPackage(connection: <#T##[Ride]#>, stages: <#T##[TrackingStages]#>)
                    }
                }
                
                
                self.saved_myPackages = [MyPackage]()
            }
            return self.saved_myPackages!
        }
    }
    
}

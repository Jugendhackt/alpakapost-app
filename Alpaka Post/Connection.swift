//
//  Connection.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import Foundation


class  Ride {
    var start: String
    var destination: String
    var startTime: Date
    var duration: Double
    var driver: Driver
    
    init(start: String, destination: String, startTime: Double, duration: Double, driverName: String, driverID: Int){
        self.start = start
        self.destination = destination
        self.date = Date(timeIntervalSince1970: startTime)
        self.duration = duration
        self.driver = Driver(name: driverName, id: driverID)
    }
}


class Driver {
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

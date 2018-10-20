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
        self.startTime = Date(timeIntervalSince1970: startTime)
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



class MyPackage {
    var connection: [Ride]
    var stages: [TrackingStages]
    
    init(connection: [Ride], stages: [TrackingStages]) {
        self.connection = connection
        self.stages = stages
    }
}


class TrackingStages {
    var start: String
    var status: String
    var time: Date
    
    init(start: String, status: String, time: Double){
        self.start = start
        self.status = status
        self.time = Date(timeIntervalSince1970: time)
    }
}

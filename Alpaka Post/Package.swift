//
//  Package.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import Foundation

class PackageDelivery {
    var start = ""
    var destination = ""
    var mass = 0
    var dimensions = ""
    var points = 100
    
    init(start: String, destination: String, mass: Int, dimensions: String, points: Int){
        self.start = start
        self.destination = destination
        self.mass = mass
        self.dimensions = dimensions
        self.points = points
    }
}

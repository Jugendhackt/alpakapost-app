//
//  Hackerspace.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import Foundation
import CoreLocation


class Hackerspace {
    var location = CLLocationCoordinate2D()
    var name = ""
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        
        let latDeg = CLLocationDegrees(exactly: latitude)
        let longDeg = CLLocationDegrees(exactly: longitude)
        self.location = CLLocationCoordinate2D(latitude: latDeg!, longitude: longDeg!)
    }
}

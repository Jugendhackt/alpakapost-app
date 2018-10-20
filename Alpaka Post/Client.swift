//
//  Client.swift
//  Alpaka Post
//
//  Created by Fynn Kiwitt on 20.10.18.
//  Copyright © 2018 Fynn Kiwitt. All rights reserved.
//

import Foundation

class Client {
    private static let instance = Client()
    
    static var shared: Client {
        return instance
    }
    
    var start: String = ""
    var destination: String = ""
    
    func getConnections(from: String, to: String) -> [[Ride]] {
        return []
    }
}

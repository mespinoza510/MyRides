//
//  Address.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/11/21.
//

import Foundation

struct Location: Decodable {
    var address: String
    var lat: Double
    var lng: Double
}

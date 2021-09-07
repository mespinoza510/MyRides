//
//  OrderedWaypoint.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/11/21.
//

import Foundation

struct OrderedWaypoint: Decodable {
    var id: Int
    var anchor: Bool
    var passengers: [Passenger]
    var location: Location
}

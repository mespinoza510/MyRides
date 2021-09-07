//
//  Rides.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/11/21.
//

import Foundation

struct Ride: Decodable {
    let tripId: Int
    let inSeries: Bool
    let startsAt: Date
    let endsAt: Date
    let estimatedEarningsCents: Int
    let estimatedRideMinutes: Int
    let estimatedRideMiles: Double
    let orderedWaypoints: [OrderedWaypoint]
}

struct Rides: Decodable {
    let rides: [Ride]
}

//
//  Trip.swift
//  MyRides
//
//  Created by Marco Espinoza on 9/2/21.
//

import Foundation

struct Trip {
    var rides: [Ride]
    let date: Date
    
    init(ride: Ride) {
        self.rides = [ride]
        self.date = ride.startsAt
    }
}

extension Trip {
    
    var estimatedEarningsCents: Int {
        var price = 0
        rides.forEach { price += $0.estimatedEarningsCents }
        return price
    }
    
    var startsAt: Date? {
        rides.sorted(by: { $0.startsAt < $1.startsAt }).first?.startsAt
    }
    
    var endsAt: Date? {
        rides.sorted(by: { $0.endsAt < $1.endsAt }).last?.endsAt
    }
}

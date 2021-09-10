//
//  Passenger.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/11/21.
//

import Foundation

struct Passenger: Decodable {
    let id: Int
    var boosterSeat: Bool
    let firstName: String
}

//
//  Constants.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/26/21.
//

import UIKit

enum TimeFormatString {
    static let hourAndMinute  = "h:mm a"
    static let monthAndDay    = "E MM/dd"
    static let monthDayYear   = "MM/dd/yyyy"
}

enum MyRidesColor {
    static let ridesColor = UIColor(red: 0, green: 0.2863, blue: 0.6196, alpha: 1)
    static let headerColor = UIColor(red: 0.9294, green: 0.9294, blue: 0.9294, alpha: 1).cgColor
    static let lightBlueColor = UIColor(red: 0, green: 0.7176, blue: 0.898, alpha: 1)
}

enum SFSymbols {
    static let diamond = UIImage(systemName: "diamond.fill")
    static let circle = UIImage(systemName: "circle.fill")
}

enum RidesConstants {
    static let estimated = "ESTIMATED"
    static let est = "est."
    static let riders = "riders"
    static let rider = "rider"
    static let booster = " • 1 booster"
    static let rideDetailsTitle = "Ride Details"
    static let tripIsPartOfSeriesLabel = "This trip is part of a series."
    static let pickup = "Pickup"
    static let dropoff = "Drop-off"
    static let cancelTrip = "Cancel This Trip"
}

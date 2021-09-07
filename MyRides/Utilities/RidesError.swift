//
//  Constants.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/13/21.
//

import Foundation

enum RidesError: String, Error {
    case invalidURL = "There was an issue connecting to server. If this persists, please contact support."
    case invalidData = "The data received from server was invalid. Please contact support"
    case invalidResponse = "Invalid response from server. Please try again later or contact support."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
}

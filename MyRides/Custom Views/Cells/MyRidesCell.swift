//
//  MyRidesCell.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/28/21.
//

import UIKit

class MyRidesCell: UITableViewCell {
    
    static let reuseID = "MyRidesCell"
    
    let startTimeLabel = RidesTitleLabel(textAlignment: .left, fontSize: 14, weight: .bold)
    let endTimeLabel = RidesTitleLabel(textAlignment: .left, fontSize: 14, weight: .regular)
    let numberOfPassengersLabel = RidesTitleLabel(textAlignment: .left, fontSize: 11, weight: .medium)
    let estLabel = RidesTitleLabel(textAlignment: .left, fontSize: 12, weight: .regular)
    let amountLabel = RidesSecondaryTitleLabel(fontSize: 16)
    let addressLabel = RidesTitleLabel(textAlignment: .left, fontSize: 14, weight: .regular)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mapAddresses(ride: Ride) -> String {
        return ride.orderedWaypoints.enumerated().map { "\($0 + 1). " + $1.location.address }.joined(separator: "\n")
    }
    
    private func getTotalPassengers(for ride: Ride) -> Int {
        return ride.orderedWaypoints.map { $0.passengers }.count
    }
    
    private func getNumberOfBoosters(for ride: Ride) -> Int {
        return ride.orderedWaypoints.flatMap { $0.passengers }.filter { $0.boosterSeat }.count
    }
    
    func set(ride: Ride) {
        let totalPassengers = getTotalPassengers(for: ride)
        let totalBoosters = getNumberOfBoosters(for: ride)
        let isPlural = (totalPassengers > 1 ) ? RidesConstants.riders : RidesConstants.rider
        let pluralizeBooster = totalBoosters.pluralizeBoosterNum()
        let addresses = mapAddresses(ride: ride)
        
        startTimeLabel.text          = ride.startsAt.convertDateFormat(to: .time)
        endTimeLabel.text            = "- " + ride.endsAt.convertDateFormat(to: .time)
        numberOfPassengersLabel.text = "(\(totalPassengers) " + "\(isPlural)\(pluralizeBooster)"
        estLabel.text                = RidesConstants.est
        
        amountLabel.text             = "$" + ride.estimatedEarningsCents.convertToDollar()
        amountLabel.textColor        = MyRidesColor.ridesColor
        addressLabel.text            = addresses
        addressLabel.numberOfLines   = 0
    }
    
    private func configure() {
        addSubviews(startTimeLabel, endTimeLabel, numberOfPassengersLabel, estLabel, amountLabel, addressLabel)
        
        accessoryType = .detailButton
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 2
        
        NSLayoutConstraint.activate([
            startTimeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            startTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            startTimeLabel.widthAnchor.constraint(equalToConstant: 80),
            
            addressLabel.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 15),
            addressLabel.leadingAnchor.constraint(equalTo: startTimeLabel.leadingAnchor),
            addressLabel.widthAnchor.constraint(equalToConstant: 300),
            addressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            endTimeLabel.centerYAnchor.constraint(equalTo: startTimeLabel.centerYAnchor),
            endTimeLabel.leadingAnchor.constraint(equalTo: startTimeLabel.trailingAnchor, constant: -20),
            endTimeLabel.widthAnchor.constraint(equalToConstant: 80),
            endTimeLabel.bottomAnchor.constraint(equalTo: addressLabel.topAnchor, constant: -20),
            
            numberOfPassengersLabel.centerYAnchor.constraint(equalTo: endTimeLabel.centerYAnchor),
            numberOfPassengersLabel.leadingAnchor.constraint(equalTo: endTimeLabel.trailingAnchor, constant: -12),
            numberOfPassengersLabel.widthAnchor.constraint(equalToConstant: 120),
            numberOfPassengersLabel.bottomAnchor.constraint(equalTo: addressLabel.topAnchor, constant: -20),
            
            estLabel.centerYAnchor.constraint(equalTo: startTimeLabel.centerYAnchor),
            estLabel.leadingAnchor.constraint(equalTo: numberOfPassengersLabel.trailingAnchor, constant: 30),
            estLabel.widthAnchor.constraint(equalToConstant: 20),
            estLabel.bottomAnchor.constraint(equalTo: addressLabel.topAnchor, constant: -10),
            
            amountLabel.centerYAnchor.constraint(equalTo: estLabel.centerYAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: estLabel.trailingAnchor, constant: 5),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            amountLabel.bottomAnchor.constraint(equalTo: addressLabel.topAnchor, constant: -20),
        ])
    }
    
}

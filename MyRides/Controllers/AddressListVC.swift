//
//  AddressListVC.swift
//  MyRides
//
//  Created by Marco Espinoza on 9/4/21.
//

import UIKit

class AddressListVC: UIViewController {

    let lineSeparatorView = LineSeparatorView()
    let lineSeparatorView2 = LineSeparatorView()
    let lineSeparatorView3 = LineSeparatorView()
    let pickupImageView = UIImageView()
    let dropoffImageView = UIImageView()
    let pickupLabel = RidesTitleLabel(textAlignment: .left, fontSize: 12, weight: .bold)
    let dropoffLabel = RidesTitleLabel(textAlignment: .left, fontSize: 12, weight: .bold)
    var pickupAddressLabel = RidesTitleLabel(textAlignment: .left, fontSize: 14, weight: .light)
    var dropoffAddressLabel = RidesTitleLabel(textAlignment: .left, fontSize: 14, weight: .light)
    let tripInfoLabel = RidesTitleLabel(textAlignment: .left, fontSize: 12, weight: .light)
    
    var ride: Ride!
    
    init(ride: Ride) {
        super.init(nibName: nil, bundle: nil)
        self.ride = ride
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configureUIElements()
    }
    
    private func configureUIElements() {
        pickupImageView.image = ride.orderedWaypoints.first!.anchor ? SFSymbols.diamond : SFSymbols.circle
        pickupImageView.tintColor = MyRidesColor.lightBlueColor
        pickupLabel.text = RidesConstants.pickup
        pickupAddressLabel.text = ride.orderedWaypoints.first!.location.address
        
        dropoffImageView.image = ride.orderedWaypoints.last!.anchor ? SFSymbols.diamond : SFSymbols.circle
        dropoffImageView.tintColor = MyRidesColor.lightBlueColor
        dropoffLabel.text = RidesConstants.dropoff
        dropoffAddressLabel.text = ride.orderedWaypoints.last!.location.address
        
        tripInfoLabel.text = "Trip ID: \(ride.tripId) • \(ride.estimatedRideMiles) mi • \(ride.estimatedRideMinutes) min"
        
    }
    
    private func layoutUI() {
        view.addSubviews(lineSeparatorView, lineSeparatorView2, lineSeparatorView3, pickupImageView, dropoffImageView, pickupLabel, pickupAddressLabel, dropoffLabel, dropoffAddressLabel, tripInfoLabel)
        
        pickupImageView.translatesAutoresizingMaskIntoConstraints = false
        dropoffImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineSeparatorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            lineSeparatorView.widthAnchor.constraint(equalToConstant: view.bounds.size.width),
            lineSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            pickupImageView.topAnchor.constraint(equalTo: lineSeparatorView.bottomAnchor, constant: 20),
            pickupImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pickupImageView.widthAnchor.constraint(equalToConstant: 15),
            pickupImageView.heightAnchor.constraint(equalToConstant: 15),
            
            pickupLabel.centerYAnchor.constraint(equalTo: pickupImageView.centerYAnchor),
            pickupLabel.leadingAnchor.constraint(equalTo: pickupImageView.trailingAnchor, constant: 10),
            pickupLabel.widthAnchor.constraint(equalToConstant: 100),
            pickupLabel.heightAnchor.constraint(equalToConstant: 15),
            
            pickupAddressLabel.topAnchor.constraint(equalTo: pickupLabel.bottomAnchor, constant: 10),
            pickupAddressLabel.leadingAnchor.constraint(equalTo: pickupLabel.leadingAnchor),
            pickupAddressLabel.widthAnchor.constraint(equalToConstant: 250),
            pickupAddressLabel.heightAnchor.constraint(equalToConstant: 14),
            
            lineSeparatorView2.topAnchor.constraint(equalTo: pickupAddressLabel.bottomAnchor, constant: 20),
            lineSeparatorView2.widthAnchor.constraint(equalToConstant: view.layer.bounds.size.width),
            lineSeparatorView2.heightAnchor.constraint(equalToConstant: 1),
            
            dropoffImageView.topAnchor.constraint(equalTo: lineSeparatorView2.bottomAnchor, constant: 20),
            dropoffImageView.centerXAnchor.constraint(equalTo: pickupImageView.centerXAnchor),
            dropoffImageView.widthAnchor.constraint(equalToConstant: 15),
            dropoffImageView.heightAnchor.constraint(equalToConstant: 15),
            
            dropoffLabel.centerYAnchor.constraint(equalTo: dropoffImageView.centerYAnchor),
            dropoffLabel.leadingAnchor.constraint(equalTo: dropoffImageView.trailingAnchor, constant: 10),
            dropoffLabel.widthAnchor.constraint(equalToConstant: 50),
            dropoffLabel.heightAnchor.constraint(equalToConstant: 15),
            
            dropoffAddressLabel.topAnchor.constraint(equalTo: dropoffLabel.bottomAnchor, constant: 10),
            dropoffAddressLabel.leadingAnchor.constraint(equalTo: dropoffLabel.leadingAnchor),
            dropoffAddressLabel.widthAnchor.constraint(equalToConstant: 250),
            dropoffAddressLabel.heightAnchor.constraint(equalToConstant: 14),
            
            lineSeparatorView3.topAnchor.constraint(equalTo: dropoffAddressLabel.bottomAnchor, constant: 20),
            lineSeparatorView3.widthAnchor.constraint(equalToConstant: view.bounds.width),
            lineSeparatorView3.heightAnchor.constraint(equalToConstant: 1),
            
            tripInfoLabel.topAnchor.constraint(equalTo: lineSeparatorView3.bottomAnchor, constant: 15),
            tripInfoLabel.leadingAnchor.constraint(equalTo: dropoffImageView.leadingAnchor),
            tripInfoLabel.widthAnchor.constraint(equalToConstant: 250),
            tripInfoLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
        
    }

}

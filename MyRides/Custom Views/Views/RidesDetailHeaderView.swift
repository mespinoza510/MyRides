//
//  RidesDetailHeaderView.swift
//  MyRides
//
//  Created by Marco Espinoza on 9/3/21.
//

import UIKit

class RidesDetailHeaderView: UIViewController {
    
    let dateLabel = RidesTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let startTimeLabel = RidesTitleLabel(textAlignment: .left, fontSize: 16, weight: .semibold)
    let endTimeLabel = RidesTitleLabel(textAlignment: .left, fontSize: 16, weight: .regular)
    let estimatedCostLabel = RidesTitleLabel(textAlignment: .center, fontSize: 14, weight: .regular)
    let amountLabel = RidesSecondaryTitleLabel(fontSize: 16)
    let capsuleView = RidesCapsuleView()
    
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
    
    func configureUIElements() {
        dateLabel.text          = ride.startsAt.convertDateFormat(to: .monthAndDay)
        dateLabel.textColor     = MyRidesColor.ridesColor
        startTimeLabel.text     = "•  " + ride.startsAt.convertDateFormat(to: .time)
        endTimeLabel.text       = "- " + ride.endsAt.convertDateFormat(to: .time)
        estimatedCostLabel.text = RidesConstants.estimated
        amountLabel.text        = "$\(ride.estimatedEarningsCents.convertToDollar())"
        amountLabel.textColor   = .white
        
        view.sendSubviewToBack(capsuleView)
    }
    
    private func layoutUI() {
        view.addSubviews(dateLabel, startTimeLabel, endTimeLabel, estimatedCostLabel, amountLabel, capsuleView)
        
        view.layer.bounds.size.height = 50
        view.layer.bounds.size.width = view.layer.bounds.width
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dateLabel.widthAnchor.constraint(equalToConstant: 80),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            startTimeLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            startTimeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 5),
            startTimeLabel.widthAnchor.constraint(equalToConstant: 90),
            startTimeLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            
            endTimeLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            endTimeLabel.leadingAnchor.constraint(equalTo: startTimeLabel.trailingAnchor, constant: -5),
            endTimeLabel.bottomAnchor.constraint(equalTo: startTimeLabel.bottomAnchor),
            
            estimatedCostLabel.topAnchor.constraint(equalTo: view.topAnchor),
            estimatedCostLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            estimatedCostLabel.widthAnchor.constraint(equalToConstant: 70),
            estimatedCostLabel.heightAnchor.constraint(equalToConstant: 20),
            
            amountLabel.topAnchor.constraint(equalTo: estimatedCostLabel.bottomAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: estimatedCostLabel.leadingAnchor, constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            amountLabel.heightAnchor.constraint(equalToConstant: 25),
            
            capsuleView.topAnchor.constraint(equalTo: amountLabel.topAnchor),
            capsuleView.leadingAnchor.constraint(equalTo: estimatedCostLabel.leadingAnchor),
            capsuleView.trailingAnchor.constraint(equalTo: estimatedCostLabel.trailingAnchor),
            capsuleView.bottomAnchor.constraint(equalTo: amountLabel.bottomAnchor)
        ])
    }
}

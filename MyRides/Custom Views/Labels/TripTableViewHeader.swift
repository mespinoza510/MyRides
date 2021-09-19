//
//  TripHeader.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/29/21.
//

import UIKit

class TripTableViewHeader: UITableViewHeaderFooterView {
    
    static let tripHeaderID = "TripHeader"
    
    let dateLabel = RidesTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let startTimeLabel = RidesTitleLabel(textAlignment: .left, fontSize: 12, weight: .bold)
    let endTimeLabel = RidesTitleLabel(textAlignment: .left, fontSize: 12, weight: .regular)
    let estimatedCostLabel = RidesTitleLabel(textAlignment: .center, fontSize: 14, weight: .regular)
    let amountLabel = RidesSecondaryTitleLabel(fontSize: 16)

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(trip: RideSchedule) {
        dateLabel.text          = trip.date.convertDateFormat(to: .monthAndDay) + "  •"
        dateLabel.textColor     = MyRidesColor.ridesColor
        startTimeLabel.text     = trip.startsAt?.convertDateFormat(to: .time)
        endTimeLabel.text       = "- " + trip.endsAt!.convertDateFormat(to: .time)
        estimatedCostLabel.text = RidesConstants.estimated
        amountLabel.text        = "$\(trip.estimatedEarningsCents.convertToDollar())"
        amountLabel.textColor   = MyRidesColor.ridesColor
    }
    
    private func configureContents() {
        contentView.addSubviews(dateLabel, startTimeLabel, endTimeLabel, estimatedCostLabel, amountLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dateLabel.widthAnchor.constraint(equalToConstant: 90),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            startTimeLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            startTimeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            startTimeLabel.widthAnchor.constraint(equalToConstant: 60),
            startTimeLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            
            endTimeLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            endTimeLabel.leadingAnchor.constraint(equalTo: startTimeLabel.trailingAnchor, constant: -5),
            endTimeLabel.bottomAnchor.constraint(equalTo: startTimeLabel.bottomAnchor),
            
            estimatedCostLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            estimatedCostLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            estimatedCostLabel.widthAnchor.constraint(equalToConstant: 70),
            estimatedCostLabel.heightAnchor.constraint(equalToConstant: 20),
            
            amountLabel.topAnchor.constraint(equalTo: estimatedCostLabel.bottomAnchor),
            amountLabel.centerXAnchor.constraint(equalTo: estimatedCostLabel.centerXAnchor),
            amountLabel.widthAnchor.constraint(equalToConstant: 60),
            amountLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

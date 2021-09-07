//
//  RidesCapsuleView.swift
//  MyRides
//
//  Created by Marco Espinoza on 9/4/21.
//

import UIKit

class RidesCapsuleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        frame = .init(x: 0, y: 0, width: 70, height: 25)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = MyRidesColor.lightBlueColor
        roundCorners(corners: [.topRight, .topLeft, .bottomLeft, .bottomRight], amount: 10)
    }
}

//
//  RidesSecondaryTitleLabel.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/26/21.
//

import UIKit

class RidesSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byCharWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}

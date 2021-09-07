//
//  LineSeparatorView.swift
//  MyRides
//
//  Created by Marco Espinoza on 9/4/21.
//

import UIKit

class LineSeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiaryLabel
        frame = .init(x: 0, y: 0, width: bounds.width, height: 1)
    }
}

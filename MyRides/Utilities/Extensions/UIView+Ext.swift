//
//  UIView+Ext.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/13/21.
//

import UIKit

extension UIView {
    
    enum Corner:Int {
            case bottomRight = 0,
            topRight,
            bottomLeft,
            topLeft
        }
        
        private func parseCorner(corner: Corner) -> CACornerMask.Element {
            let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            return corners[corner.rawValue]
        }
        
        private func createMask(corners: [Corner]) -> UInt {
            return corners.reduce(0, { (a, b) -> UInt in
                return a + parseCorner(corner: b).rawValue
            })
        }
        
        func roundCorners(corners: [Corner], amount: CGFloat) {
            layer.cornerRadius = amount
            let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
            layer.maskedCorners = maskedCorners
        }
    
    func pinToEdges(of superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

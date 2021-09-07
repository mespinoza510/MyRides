//
//  Int+Ext.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/29/21.
//

import Foundation

extension Int {
    
    func convertToDollar() -> String {
        let amount = Double(self)
        let centsToDollar = amount / Double(100)
        return String(format: "%.2f", centsToDollar)
    }
}

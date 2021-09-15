//
//  CLLocationCoordinate2D+Ext.swift
//  MyRides
//
//  Created by Marco Espinoza on 9/15/21.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    
    func middleLocationWith(location: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let degrees = Double.pi / 180
        
        let lng1 = longitude * degrees
        let lng2 = location.longitude * degrees
        let lat1 = latitude * degrees
        let lat2 = location.latitude * degrees
        
        let deltaLon = lng2 - lng1
        let x = cos(lat2) * cos(deltaLon)
        let y = cos(lat2) * sin(deltaLon)
        
        let lat3 = atan2( sin(lat1) + sin(lat2), sqrt((cos(lat1) + x) * (cos(lat1) + x) + y * y) )
        let lng3 = lng1 + atan2(y, cos(lat1) + x)
        
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat3 * 1 / degrees, lng3 * 1 / degrees)
        return center
    }
}

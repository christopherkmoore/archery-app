//
//  DoubleExtension.swift
//  archery app
//
//  Created by Ian Gristock on 02/07/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}
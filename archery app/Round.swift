//
//  Game.swift
//  archery app
//
//  Created by Ian Gristock on 14/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import Foundation
import RealmSwift

enum BowType: String {
    case Recurve = "Recurve"
    case Compound = "Compound"
}

class Round: Object {
    
    dynamic var id =  UUID().uuidString
    let ends = List<End>()
    dynamic var name: String?
    dynamic var arrows: Int = 0
    
    fileprivate dynamic var bowType = BowType.Recurve.rawValue
    
    var bow: BowType {
        get{
            if let bow = BowType(rawValue: bowType) {
                return bow
            }
            return .Recurve
        }
        set{
            bowType = newValue.rawValue
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    var endsAverage: Double {
        let endsTotal = ends.count
        var totalSum = 0
        for end in ends {
            totalSum += end.shots.reduce(0) { $0 + $1.score }
        }
        if endsTotal == 0 {
            return 0
        }
        let average = Double(totalSum) / Double(endsTotal)
        return average.roundToPlaces(2)
    }
    
    var totalGold: Double {
        var totalSum = 0
        for end in ends {
            totalSum += end.shots.filter{ $0.score > 8 }.count
        }
        print(Double(totalSum) / 100, Double(self.totalShots))
        let percentage = (Double(totalSum) / 100) * Double(self.totalShots)
        return percentage.roundToPlaces(2)
    }
    
    var totalShots: Int {
        var totalSum = 0
        for end in ends {
            totalSum += end.shots.count
        }
        return totalSum
    }
    var runningTotal: Int {
        var totalSum = 0
        for end in ends {
            totalSum += end.shots.reduce(0) { $0 + $1.score }
        }
        return totalSum
    }

}

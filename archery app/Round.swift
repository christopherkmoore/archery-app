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
    
    let ends = List<End>()
    dynamic var name: String?
    dynamic var arrows: Int = 0
    
    private dynamic var bowType = BowType.Recurve.rawValue
    
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

}

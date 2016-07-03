//
//  End.swift
//  archery app
//
//  Created by Ian Gristock on 14/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import Foundation
import RealmSwift

class End: Object {
    let shots = List<Shot>()
    dynamic var createdAt = NSDate()
    dynamic var updatedAt = NSDate()
}
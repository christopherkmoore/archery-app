//
//  Score.swift
//  archery app
//
//  Created by Ian Gristock on 28/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import Foundation
import RealmSwift

class Shot: Object {
    dynamic var score = 0
    dynamic var colour = ""
}

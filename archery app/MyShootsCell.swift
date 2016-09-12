//
//  MyShotsCell.swift
//  archery app
//
//  Created by Ian Gristock on 12/09/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//
import UIKit

class MyShootsCell: UITableViewCell {

    @IBOutlet weak var scoreBoxView: UIView!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var scoringType: UILabel!
    @IBOutlet weak var roundName: UILabel!
    @IBOutlet weak var shootDate: UILabel!
    @IBOutlet weak var shootAverage: UILabel!
    @IBOutlet weak var totalEnds: UILabel!
}

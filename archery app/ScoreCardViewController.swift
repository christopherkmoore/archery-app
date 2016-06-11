//
//  ScoreCardViewController.swift
//  archery app
//
//  Created by Ian Gristock on 08/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

class ScoreCardViewController: UIViewController {

    @IBOutlet weak var scoreViews: UIStackView!
    @IBOutlet weak var scorecardStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //autolayout the stack view - pin 30 up 20 left 20 right 30 down
        let scoreBoxView = ScoreBoxesView(frame: self.view.frame, numberOfInputs: 6)
        self.view.addSubview(scoreBoxView)
        let viewsDictionary = ["scoreBoxView":scoreBoxView]
        let scorebox_view_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[scoreBoxView]-20-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        let scorebox_view_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[scoreBoxView(44)]", //vertical constraint 30 points from top and bottom
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil,
            views: viewsDictionary)
        
        self.view.addConstraints(scorebox_view_H)
        self.view.addConstraints(scorebox_view_V)


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

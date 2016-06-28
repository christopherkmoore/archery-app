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
    @IBOutlet weak var toggle: SegmentedControl!
    
    @IBOutlet weak var keyPad: KeyPadView!
    var scores: [Int] = [9, 8, 2]
    var scoreBoxView: ScoreBoxesView!
    var round: Round?
    var selectedIndex = 0
    let colorDictionary = [
        0:UIColor(red: 220/255, green: 224/255, blue: 85/255, alpha: 1.0),
        1:UIColor(red: 224/255, green: 85/255, blue: 85/255, alpha: 1.0),
        2:UIColor(red: 85/255, green: 145/255, blue: 224/255, alpha: 1.0),
        3:UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0),
        4:UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0),
        5:UIColor(red: 113/255, green: 199/255, blue: 119/255, alpha: 1.0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyPad.delegate = self
        scoreViews.translatesAutoresizingMaskIntoConstraints = false
        toggle.items = ["Scoring", "Ends"]
        setupScoreBoard()
    }
    
    func setupScoreBoard() {
        for _ in 1...6 {
            let label = UILabel()
            label.bounds = CGRectMake(0.0, 0.0, 50, 50)
            label.layer.cornerRadius = 25
            label.layer.backgroundColor = UIColor.lightGrayColor().CGColor
            label.textAlignment = .Center
            label.widthAnchor.constraintEqualToConstant(50).active = true;
            label.heightAnchor.constraintEqualToConstant(50).active = true;
            scoreViews.addArrangedSubview(label)
            
        }
    }
}

extension ScoreCardViewController: KeyPadDelegate {
    
    func didPressKey(sender: KeyPadView, key: Int ) {
        if selectedIndex < round?.arrows {
            let label = scoreViews.arrangedSubviews[selectedIndex]as! UILabel
            label.text = "\(key)"
            selectedIndex += 1
        }
    }
    
    func didPressKey(sender: KeyPadView, specialKey: String) {
        print(specialKey)
    }

    
}

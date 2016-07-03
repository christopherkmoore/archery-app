//
//  KeyMapView.swift
//  Target Helper
//
//  Created by Ian Gristock on 06/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

protocol ScoreBoxDelegate: class {
    func didUpdateShots(scoreBoxView: ScoreBoxesView, shots: [Shot])
}


@IBDesignable
class ScoreBoxesView: UIView {
    
    var view: UIView!
    var currentlySelectedIndex = 0
    var maxShotsAllowed = 6
    var stackView: UIStackView!
    private var shots: [Shot] = []
    weak var delegate: ScoreBoxDelegate?
    
    func displayInputs(){
        for _ in 1...6 {
            let label = UILabel()
            label.bounds = CGRectMake(0.0, 0.0, 40, 40)
            label.layer.cornerRadius = 20
            label.layer.backgroundColor = UIColor(hexString: "#eeeeee").CGColor
            label.textAlignment = .Center
            label.textColor = UIColor.whiteColor()
            label.widthAnchor.constraintEqualToConstant(40).active = true;
            label.heightAnchor.constraintEqualToConstant(40).active = true;
            label.userInteractionEnabled = true
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(
                target: self, action: #selector(didTapShot))
            label.addGestureRecognizer(tap)
            stackView.addArrangedSubview(label)
            
        }
        self.addSubview(stackView)
        //autolayout the stack view - pin 30 up 20 left 20 right 30 down
        let viewsDictionary = ["stackView":stackView]
        let stackView_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-0-[stackView]-0-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-0-[stackView]-0-|", //vertical constraint 30 points from top and bottom
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil,
            views: viewsDictionary)
        self.addConstraints(stackView_H)
        self.addConstraints(stackView_V)
    }
    
    func didTapShot(sender: UITapGestureRecognizer) {
        let tappedIndex = stackView.subviews.indexOf(sender.view!)!
        if tappedIndex < maxShotsAllowed {
            currentlySelectedIndex = tappedIndex
        }

    }
    
    func addShot(score: Int, colour: UIColor) {
        if currentlySelectedIndex < maxShotsAllowed {
            let shot = Shot()
            shot.colour = colour.toHexString()
            shot.score = score
            if shots.indices.contains(currentlySelectedIndex) {
                shots[currentlySelectedIndex] = shot
            } else {
                shots.append(shot)
            }

            let label = stackView.arrangedSubviews[currentlySelectedIndex] as? UILabel
            label?.text = "\(score)"
            label?.layer.backgroundColor = colour.CGColor
            currentlySelectedIndex += 1
            delegate?.didUpdateShots(self, shots: shots)
        }
        
    }
    
    func getShots() -> [Shot] {
        return shots
    }
    
    func resetScores() {
        currentlySelectedIndex = 0
        for label in stackView.subviews as! [UILabel] {
            label.layer.backgroundColor = UIColor(hexString: "#eeeeee").CGColor
            label.text = ""
        }
        shots.removeAll()
    }
    
    func setupStackView() {
        stackView = UIStackView()
        stackView.axis = .Horizontal
        stackView.distribution = .EqualSpacing
        stackView.alignment = .Center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        displayInputs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStackView()
        displayInputs()
    }
}


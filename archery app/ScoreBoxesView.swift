//
//  KeyMapView.swift
//  Target Helper
//
//  Created by Ian Gristock on 06/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
@IBDesignable
class ScoreBoxesView: UIView {
    
    var view: UIView!
    var currentlySelectedIndex = 0
    var countOfInputs = 0
    var inputs: [UITextView]!
    
    func addInput() -> UITextView {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.blueColor().CGColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 3
        return textView
    }
    
    func displayInputs(){
        self.backgroundColor = UIColor.redColor()
        let stackView = UIStackView()
        stackView.axis = .Horizontal
        stackView.distribution = .FillEqually
        stackView.alignment = .Fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0...countOfInputs {
            stackView.addArrangedSubview(addInput())
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("called override init", countOfInputs)
        displayInputs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("required init", countOfInputs)
        displayInputs()
    }
    
     init(frame: CGRect, numberOfInputs: Int) {
       self.countOfInputs = numberOfInputs
        let newFrame = CGRectMake(0,20,frame.width,44);
        super.init(frame: newFrame)
        displayInputs()
    }
}


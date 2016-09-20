//
//  KeyMapView.swift
//  Target Helper
//
//  Created by Ian Gristock on 06/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

protocol KeyPadDelegate: class {
    func didPressKey(_ sender: KeyPadView, key: Int, colour: UIColor )
    func didPressKey(_ sender: KeyPadView, specialKey: String)
}
@IBDesignable
class KeyPadView: UIView {
    
    var view: UIView!
    weak var delegate: KeyPadDelegate?
    
    let (columns, rows) = (4, 6) as (CGFloat, CGFloat)
    
    // basic buttons: all 1x1 unit
    let buttonRows = [["9", "10"], ["7", "8"], ["5", "6"], ["3", "4"], ["1", "2"] ]
    
    // special cases: non-square or out of position
    let specialButtons = [("=", CGPoint(x: 3, y: 4), CGSize(width: 1, height: 2)),
                          ("0", CGPoint(x: 0, y: 5), CGSize(width: 2, height: 1)),
                          (".", CGPoint(x: 2, y: 5), CGSize(width: 1, height: 1))]
    
    let colorDictionary = [
        0:UIColor(red: 220/255, green: 224/255, blue: 85/255, alpha: 1.0),
        1:UIColor(red: 224/255, green: 85/255, blue: 85/255, alpha: 1.0),
        2:UIColor(red: 85/255, green: 145/255, blue: 224/255, alpha: 1.0),
        3:UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0),
        4:UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0),
        5:UIColor(red: 113/255, green: 199/255, blue: 119/255, alpha: 1.0)
    ]
    
    func colorButton(
        withColor color:UIColor,
                  title:String) -> UIButton
    {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = color
        newButton.setTitle(title, for: UIControlState())
        newButton.setTitleColor(UIColor.white, for: UIControlState())
        newButton.layer.cornerRadius = 10
        newButton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 30)
        return newButton
    }
    
    func displayKeyboard(){
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // draw basic buttons
        for (rowNumber, row) in buttonRows.enumerated() {
            let rowStackview = UIStackView()
            rowStackview.axis = .horizontal
            rowStackview.distribution = .fillEqually
            rowStackview.alignment = .fill
            rowStackview.spacing = 10
            for (_, text) in row.enumerated() {
                
                let button = colorButton(withColor: colorDictionary[rowNumber]!,title: text)
                button.addTarget(self, action: #selector(KeyPadView.numberPressed(_:)), for: UIControlEvents.touchUpInside)
                rowStackview.addArrangedSubview(button)
            }
            stackView.addArrangedSubview(rowStackview)
        }
        let rowStackview = UIStackView()
        rowStackview.axis = .horizontal
        rowStackview.distribution = .fillEqually
        rowStackview.alignment = .fill
        rowStackview.spacing = 5
        let zeroButton = colorButton(withColor: colorDictionary[4]!, title: "0")
        zeroButton.addTarget(self, action: #selector(KeyPadView.numberPressed(_:)), for: UIControlEvents.touchUpInside)
        rowStackview.addArrangedSubview(zeroButton)
        
        let okButton = colorButton(withColor: colorDictionary[5]!, title: "OK")
        okButton.addTarget(self, action: #selector(KeyPadView.specialKeyPressed(_:)), for: UIControlEvents.touchUpInside)
        rowStackview.addArrangedSubview(okButton)
        
        stackView.addArrangedSubview(rowStackview)
        self.addSubview(stackView)
        
        //autolayout the stack view - pin 30 up 20 left 20 right 30 down
        let viewsDictionary = ["stackView":stackView]
        
        let stackView_H = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[stackView]-0-|",  //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[stackView]-0-|", //vertical constraint 30 points from top and bottom
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil,
            views: viewsDictionary)
        self.addConstraints(stackView_H)
        self.addConstraints(stackView_V)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        displayKeyboard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        displayKeyboard()
    }
    
    func numberPressed(_ sender: UIButton) {
        self.delegate?.didPressKey(self, key: Int(sender.titleLabel!.text!)!, colour: sender.backgroundColor!)
    }
    
    func specialKeyPressed(_ sender: UIButton) {
        self.delegate?.didPressKey(self, specialKey: sender.titleLabel!.text!)
    }
    
}


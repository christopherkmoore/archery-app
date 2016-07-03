
//
//  EndTableViewCell.swift
//  archery app
//
//  Created by Ian Gristock on 03/07/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

class EndTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var endLabel: UILabel!
    var end: End? {
        didSet {
            stackView.subviews.forEach({ $0.removeFromSuperview() })
            for shot in end!.shots {
                let label = UILabel()
                label.bounds = CGRectMake(0.0, 0.0, 30, 30)
                label.layer.cornerRadius = 15
                label.layer.backgroundColor = UIColor(hexString: shot.colour).CGColor
                label.text = "\(shot.score)"
                label.textAlignment = .Center
                label.textColor = UIColor.whiteColor()
                label.widthAnchor.constraintEqualToConstant(30).active = true;
                label.heightAnchor.constraintEqualToConstant(30).active = true;
                stackView.addArrangedSubview(label)
                stackView.translatesAutoresizingMaskIntoConstraints = false
            }
            
            let totalSum = end!.shots.reduce(0) { $0 + $1.score }
            let label = UILabel()
            label.bounds = CGRectMake(0.0, 0.0, 30, 30)
            label.layer.cornerRadius = 15
            label.layer.backgroundColor = UIColor(hexString: "#4000ff").CGColor
            label.text = "\(totalSum)"
            label.textAlignment = .Center
            label.textColor = UIColor.whiteColor()
            label.widthAnchor.constraintEqualToConstant(30).active = true;
            label.heightAnchor.constraintEqualToConstant(30).active = true;
            stackView.addArrangedSubview(label)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

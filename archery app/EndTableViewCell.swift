
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
                label.bounds = CGRect(x: 0.0,y: 0.0,width: 30,height: 30)
                label.layer.cornerRadius = 15
                label.layer.backgroundColor = UIColor(hexString: shot.colour).cgColor
                label.text = "\(shot.score)"
                label.textAlignment = .center
                label.textColor = UIColor.white
                label.widthAnchor.constraint(equalToConstant: 30).isActive = true;
                label.heightAnchor.constraint(equalToConstant: 30).isActive = true;
                stackView.addArrangedSubview(label)
                stackView.translatesAutoresizingMaskIntoConstraints = false
            }
            
            let totalSum = end!.shots.reduce(0) { $0 + $1.score }
            let label = UILabel()
            label.bounds = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
            label.layer.cornerRadius = 15
            label.layer.backgroundColor = UIColor(hexString: "#4000ff").cgColor
            label.text = "\(totalSum)"
            label.textAlignment = .center
            label.textColor = UIColor.white
            label.widthAnchor.constraint(equalToConstant: 30).isActive = true;
            label.heightAnchor.constraint(equalToConstant: 30).isActive = true;
            stackView.addArrangedSubview(label)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

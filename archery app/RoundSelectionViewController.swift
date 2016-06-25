//
//  RoundSelectionViewController.swift
//  archery app
//
//  Created by Ian Gristock on 08/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import RealmSwift


protocol RoundSelectionDelegate: class {
    func didSelectRound(sender: RoundSelectionViewController, round: Round)
}

class RoundSelectionViewController: UIViewController {

    weak var delegate:RoundSelectionDelegate?
    @IBOutlet weak var scoreType: SegmentedControl!
    @IBOutlet weak var ends: SegmentedControl!
    @IBOutlet weak var createRoundButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var roundNameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bowChoiceControl.items = ["Recurve", "Compound"]
        scoreType.items = ["Imperial", "Metric"]
        ends.items = ["1", "2", "3", "4", "5", "6"]
        setupView()
        roundNameInput.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func bowChoiceClicked(sender: SegmentedControl) {
        print(sender.selectedIndex)
    }
    @IBOutlet weak var bowChoiceControl: SegmentedControl!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func createRoundClicked(sender: AnyObject) {
        let realm = try! Realm()
        // You only need to do this once (per thread)
        let round = Round()
        round.arrows = Int(ends.items[ends.selectedIndex])!
        round.bow = BowType(rawValue: bowChoiceControl.items[bowChoiceControl.selectedIndex])!
        if roundNameInput.text!.isEmpty {
            let roundsCount = realm.objects(Round.self).count
            round.name = "Round \(roundsCount + 1)"
        } else {
            round.name = roundNameInput.text
        }
        // Add to the Realm inside a transaction
        try! realm.write {
  
            realm.add(round)
        }
        delegate?.didSelectRound(self, round: round)
    }

    func setupView() {
        cancelButton.layer.borderColor = UIColor.whiteColor().CGColor
        cancelButton.layer.cornerRadius = 8.0
        cancelButton.layer.borderWidth = 1
        createRoundButton.layer.cornerRadius = 8.0
        roundNameInput.layer.backgroundColor = UIColor.clearColor().CGColor
        roundNameInput.layer.borderWidth = 1
        roundNameInput.layer.borderColor = UIColor.whiteColor().CGColor
        roundNameInput.layer.cornerRadius = 8
    }

}


extension RoundSelectionViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {  //delegate method
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}
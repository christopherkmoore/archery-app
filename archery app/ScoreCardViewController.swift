//
//  ScoreCardViewController.swift
//  archery app
//
//  Created by Ian Gristock on 08/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import RealmSwift

class ScoreCardViewController: UIViewController {

    @IBOutlet weak var toggle: SegmentedControl!
    @IBOutlet weak var scoreBoxView: ScoreBoxesView!
    @IBOutlet weak var keyPad: KeyPadView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalGoldLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var endsPlayedLabel: UILabel!
    
    var scores: [Int] = [9, 8, 2]

    @IBOutlet weak var endAverage: UILabel!
    
    var round: Round?
    
    @IBAction func toggleClicked(_ sender: SegmentedControl) {
        switch(sender.selectedIndex) {
        case 0:
            tableView.isHidden = true
            scoreBoxView.isHidden = false
            keyPad.isHidden = false
            break
        case 1:
            tableView.isHidden = false
            scoreBoxView.isHidden = true
            keyPad.isHidden = true
            tableView.reloadData()
            break
        default:
            tableView.isHidden = true
            scoreBoxView.isHidden = false
            keyPad.isHidden = false
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyPad.delegate = self
        toggle.items = ["Scoring", "Ends"]
        scoreBoxView.maxShotsAllowed = round?.arrows ?? 6
        scoreBoxView.delegate = self
        updateScoreBoard()
    }
    
    func updateScoreBoard() {
        endAverage.text = "\(round!.endsAverage)"
        totalGoldLabel.text = "\(round!.runningTotal)"
        endsPlayedLabel.text = "\(round!.ends.count)"
    }
    
}

extension ScoreCardViewController: KeyPadDelegate {
    
    func didPressKey(_ sender: KeyPadView, key: Int, colour: UIColor) {
        scoreBoxView.addShot(key, colour: colour)
    }
    
    func didPressKey(_ sender: KeyPadView, specialKey: String) {
        let realm = try! Realm()
        try! realm.write {
        let end = End()
        for shot in scoreBoxView.getShots() {
            end.shots.append(shot)
        }
        round?.ends.append(end)
        realm.add(round!, update: true)
        }
        tableView.reloadData()
        scoreBoxView.resetScores()
        self.totalLabel.text = "0"
        updateScoreBoard()
    }
}

extension ScoreCardViewController: ScoreBoxDelegate {
    
    func didUpdateShots(_ scoreBoxView: ScoreBoxesView, shots: [Shot]) {
        let total = shots.reduce(0) { $0 + $1.score }
        self.totalLabel.text = "\(total)"
    }
}

extension ScoreCardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return round?.ends.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let end = round!.ends[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EndCell", for: indexPath) as! EndTableViewCell
        cell.end = end
        cell.endLabel.text = "End \((indexPath as NSIndexPath).row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}



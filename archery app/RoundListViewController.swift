//
//  ViewController.swift
//  archery app
//
//  Created by Ian Gristock on 07/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit
import RealmSwift

class RoundListViewController: UIViewController {
    
    var rounds: Results<Round>?

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var createNewRoundButton: UIButton!
    
    @IBAction func createNewRoundClicked(_ sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectRoundVC") as! RoundSelectionViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNewRoundButton.layer.cornerRadius = 8
        let realm = try! Realm()
        rounds = realm.objects(Round.self)
        self.tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        if segue!.identifier == "SelectedRound" {
            let viewController: ScoreCardViewController = segue!.destination as! ScoreCardViewController
            
            if let round = sender as? Round {
                viewController.round = round
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow!
                viewController.round = self.rounds![indexPath.row]
            }
            
            
        }
        
    }
}

extension RoundListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rounds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let round = rounds![indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel!.text = round.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SelectedRound", sender: self)
    }
}

extension RoundListViewController: RoundSelectionDelegate {
    
    func didSelectRound(_ sender: RoundSelectionViewController, round: Round) {
        print(round)
        DispatchQueue.main.async{
            sender.dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "SelectedRound", sender: round)
            })
            
        }
         //
        
       
    }
}

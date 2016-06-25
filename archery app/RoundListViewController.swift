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
    
    @IBAction func createNewRoundClicked(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SelectRoundVC") as! RoundSelectionViewController
        vc.delegate = self
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNewRoundButton.layer.cornerRadius = 8
        let realm = try! Realm()
        rounds = realm.objects(Round.self)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RoundListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rounds?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let round = rounds![indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel!.text = round.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("SelectedRound", sender: self)
    }
}

extension RoundListViewController: RoundSelectionDelegate {
    
    func didSelectRound(sender: RoundSelectionViewController, round: Round) {
        print(round)
        dispatch_async(dispatch_get_main_queue()){
            sender.dismissViewControllerAnimated(true, completion: {
            self.performSegueWithIdentifier("SelectedRound", sender: self)
            })
            
        }
         //
        
       
    }
}

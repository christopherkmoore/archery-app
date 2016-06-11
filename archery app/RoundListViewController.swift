//
//  ViewController.swift
//  archery app
//
//  Created by Ian Gristock on 07/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

class RoundListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func createNewRoundClicked(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SelectRoundVC") as! RoundSelectionViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RoundListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

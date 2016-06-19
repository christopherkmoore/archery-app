//
//  RoundSelectionViewController.swift
//  archery app
//
//  Created by Ian Gristock on 08/06/2016.
//  Copyright © 2016 Ian Gristock. All rights reserved.
//

import UIKit

protocol RoundSelection {
    
    func roundSelected(selection: Round)
}

class RoundSelectionViewController: UIViewController {

    @IBOutlet weak var scoreType: SegmentedControl!
    @IBOutlet weak var ends: SegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bowChoiceControl.items = ["Recurve", "Compound"]
        scoreType.items = ["Imperial", "Metric"]
        ends.items = ["One", "Two", "Three", "Four", "Five", "Six"]
        

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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

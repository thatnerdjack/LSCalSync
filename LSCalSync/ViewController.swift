//
//  ViewController.swift
//  LSCalSync
//
//  Created by block7 on 12/9/15.
//  Copyright © 2015 Jack Doherty. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.getCalData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testFunc(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mainToBlockDisplay") {
            let DVC = segue.destinationViewController as! BlockDisplayViewController        }
    }

}
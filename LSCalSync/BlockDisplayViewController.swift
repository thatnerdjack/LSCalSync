//
//  BlockDisplayViewController.swift
//  LSCalSync
//
//  Created by block7 on 12/21/15.
//  Copyright © 2015 Jack Doherty. All rights reserved.
//

import UIKit

class BlockDisplayViewController: UIViewController {
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var blockNum: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    var block :Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blockNum.text = String(block)
    }
}

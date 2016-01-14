//
//  ViewController.swift
//  LSCalSync
//
//  Created by block7 on 12/9/15.
//  Copyright © 2015 Jack Doherty. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var blockPicker: UIPickerView!
    
    var pickerDataSource = ["1st Block", "2nd Block", "3rd Block", "4th Block", "5th Block", "6th Block"]
    var pickerValue :Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.blockPicker.dataSource = self
        self.blockPicker.delegate = self
        DataManager.getCalData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testFunc(sender: AnyObject) {
        let dayData = DataManager.getDayData(DataManager.getDateString())
        print(dayData["id"])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mainToBlockDisplay") {
            let DVC = segue.destinationViewController as! BlockDisplayViewController
            DVC.block = pickerValue
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue = row
    }

}
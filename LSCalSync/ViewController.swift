//
//  ViewController.swift
//  LSCalSync
//
//  Created by block7 on 12/9/15.
//  Copyright © 2015 Jack Doherty. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    var calDataPath: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()
        getCalData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCalData() {
        Alamofire.download(.GET,
            "http://jackshighadventureproject.website/calendar_days.json",
            destination: { (temporaryURL, response) in
                let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)[0]
                let pathComponent = response.suggestedFilename
                
                self.calDataPath = directoryURL.URLByAppendingPathComponent(pathComponent!)
                return self.calDataPath!
        })
            .response { (request, response, _, error) in
                print(response)
                print("Downloaded file to \(self.calDataPath!)")
        }
    }
    
    func loadCalData() {
        let fileManager = NSFileManager.defaultManager()
//        let dataBuffer = fileManager.contentsAtPath(calDataPath?.absoluteString)
    }

}
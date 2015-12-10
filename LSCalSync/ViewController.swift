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

    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAPI() {
        Alamofire.request(.GET, "https://mylsapp.com/api/v1/calendar_days.json").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }
    }

}
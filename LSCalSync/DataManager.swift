//
//  DataManager.swift
//  LSCalSync
//
//  Created by block7 on 12/21/15.
//  Copyright © 2015 Jack Doherty. All rights reserved.
//

import SwiftyJSON

class DataManager {
    static var calDataJSON :JSON = nil
    
    class func getCalData() {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://jackshighadventureproject.website/calendar_days.json")!)
        request.HTTPMethod = "GET"
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil {
                var result = NSString(data: data!, encoding: NSASCIIStringEncoding)
                calDataJSON = JSON(result!)
            }
        }
        task.resume()
    }
    
    class func getDateString() -> String {
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.stringFromDate(date)
    }
    
    class func printDateID() {
        
    }
}
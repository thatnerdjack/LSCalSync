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
                calDataJSON = JSON(data: data!)
            }
        }
        task.resume()
    }
    
    class func getDateString() -> String {
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        //print("Date \(formatter.stringFromDate(date))")
        return formatter.stringFromDate(date)
    }
    
    class func getDayData(date: String) -> Dictionary<String, AnyObject> {
        var day = [String: AnyObject]()
        for var i = 0; i < calDataJSON.count; i++ {
            if(calDataJSON[i]["date"].string == date) {
                day["date"] = calDataJSON[i]["date"].string
                day["weekColor"] = calDataJSON[i]["color"].string
                day["dayOfWeek"] = calDataJSON[i]["day_of_week"].string
                day["quarter"] = calDataJSON[i]["quarter"].int
                day["blocks"] = calDataJSON[i]["calendar_blocks"].dictionaryObject
                return day
            }
        }
        NSException(name: "DateNotFound", reason: "Date entered was not a day found in the school year calendar.", userInfo: nil).raise()
        return day
    }
}
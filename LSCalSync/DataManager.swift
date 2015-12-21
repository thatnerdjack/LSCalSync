//
//  DataManager.swift
//  LSCalSync
//
//  Created by block7 on 12/21/15.
//  Copyright © 2015 Jack Doherty. All rights reserved.
//

import Alamofire
import SwiftyJSON

class DataManager {
    static var calDataPath: NSURL?
    
    class func getCalData() {
        Alamofire.download(.GET, "http://jackshighadventureproject.website/calendar_days.json", destination: { (temporaryURL, response) in
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
    
    class func loadCalData() -> JSON {
        let fileManager = NSFileManager.defaultManager()
        if let dataBuffer = fileManager.contentsAtPath((calDataPath?.absoluteString)!) {
            let json = JSON(dataBuffer)
            return json
        } else {
            getCalData()
            return loadCalData()
        }
    }
}
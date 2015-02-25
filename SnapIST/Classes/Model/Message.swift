//
//  Message.swift
//  SnapIST
//
//  Created by Ivan Bruel on 24/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import Foundation

class Message {
    
    let id: Int
    let text: String
    let timestamp: NSDate
    let username: String
    
    init(id: Int, text: String, timestamp: NSDate, username: String) {
        self.id = id
        self.text = text
        self.timestamp = timestamp
        self.username = username
    }
    
    var formattedText: String {
        get {
            return "[\(formattedTimestamp)][\(username)]: \(text)"
        }
    }
    
    var formattedTimestamp: String {
        get {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            return dateFormatter.stringFromDate(timestamp)
        }
    }
    
}
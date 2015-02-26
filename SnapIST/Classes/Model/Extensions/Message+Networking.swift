//
//  Message+Networking.swift
//  SnapIST
//
//  Created by Ivan Bruel on 24/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import Foundation

extension Message {
    
    // MARK: Serialization
    class func fromJSON(json: [String: AnyObject]?) -> Message? {
        if let jsonUnwrapped = json {
            if let id = jsonUnwrapped["id"] as? Int {
                if let text = jsonUnwrapped["text"] as? String {
                    if let timestamp = timestampFromString(jsonUnwrapped["updatedAt"] as? String) {
                        if let username = jsonUnwrapped["username"] as? String {
                            return Message(id: id, text: text, timestamp: timestamp, username: username)
                        }
                    }
                }
            }
        }
        return nil
    }
    
    // Just a code alternative for fromJSON(_)
    class func fromJSON2(json: [String: AnyObject]?) -> Message? {
        if let jsonUnwrapped = json {
            let id = jsonUnwrapped["id"] as? Int
            let text = jsonUnwrapped["text"] as? String
            let timestamp = timestampFromString(jsonUnwrapped["updatedAt"] as? String)
            let username = jsonUnwrapped["username"] as? String
            
            if id != nil && text != nil && timestamp != nil && username != nil {
                return Message(id: id!, text: text!, timestamp: timestamp!, username: username!)
            }
        }
        
        return nil
    }
    
    private class func timestampFromString(timestampString: String?) -> NSDate? {
        if let timestampStringUnwrapped = timestampString {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"
            return dateFormatter.dateFromString(timestampStringUnwrapped)
            
        }
        return nil
    }
    
}
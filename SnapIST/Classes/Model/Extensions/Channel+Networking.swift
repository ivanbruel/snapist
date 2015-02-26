//
//  Channel+Networking.swift
//  SnapIST
//
//  Created by Ivan Bruel on 23/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import Foundation

extension Channel {
    
    // MARK: Constants
    private struct Constants {
        static let channelsURL = "http://52.16.55.73/channels"
        static let messagesURL = "http://52.16.55.73/channels/%d/messages"
    }
    
    // MARK: Serialization
    private class func fromJSON(json: [String: AnyObject]?) -> Channel? {
        if let jsonUnwrapped = json {
            if let id = jsonUnwrapped["id"] as? Int {
                if let name = jsonUnwrapped["name"] as? String {
                    return Channel(id: id, name: name)
                }
            }
        }
        return nil
    }
    
    // MARK: Networking
    class func findAll(response: ([Channel]?, NSError?) -> Void) {
        request(.GET, Constants.channelsURL, parameters: nil).responseJSON { (_, _, json, error) -> Void in
            if let jsonArray = json as? [[String: AnyObject]] {
                var channelsArray: [Channel] = []
                for channelJSON in jsonArray {
                    if let channel = Channel.fromJSON(channelJSON) {
                        channelsArray.append(channel)
                    }
                }
                response(channelsArray, nil)
            } else {
                response(nil, error)
            }
        }
    }
    
    func getMessages(response: ([Message]?, NSError?) -> Void) {
        let url = String(format: Constants.messagesURL, id)
        request(.GET, url, parameters: nil).responseJSON { (_, _, json, error) -> Void in
            if let jsonArray = json as? [[String: AnyObject]] {
                var messagesArray: [Message] = []
                for messageJSON in jsonArray {
                    if let message = Message.fromJSON(messageJSON) {
                        messagesArray.append(message)
                    }
                }
                response(messagesArray, nil)
            } else {
                response(nil, error)
            }
        }
    }
    
}


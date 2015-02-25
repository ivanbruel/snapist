//
//  Channel.swift
//  SnapIST
//
//  Created by Ivan Bruel on 23/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

class Channel {

    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    var formattedName: String {
        get {
            return "#\(name)"
        }
    }

}

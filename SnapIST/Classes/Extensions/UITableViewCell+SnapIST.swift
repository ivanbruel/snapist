//
//  UITableViewCell+SnapIST.swift
//  SnapIST
//
//  Created by Ivan Bruel on 25/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func themeChannelCell() {
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.greenColor()
        self.selectedBackgroundView = selectedBackgroundView
        
        self.backgroundColor = UIColor.blackColor()
        self.contentView.backgroundColor = UIColor.blackColor()
        
        if let textLabel = self.textLabel {
            textLabel.font = UIFont(name: "Menlo-Regular", size: 15)
            textLabel.textColor = UIColor.greenColor()
            textLabel.highlightedTextColor = UIColor.blackColor()
            textLabel.backgroundColor = UIColor.blackColor()
        }
    }
    
    func themeMessageCell() {
        self.backgroundColor = UIColor.blackColor()
        self.contentView.backgroundColor = UIColor.blackColor()
        
        if let textLabel = self.textLabel {
            textLabel.numberOfLines = 0
            textLabel.font = UIFont(name: "Menlo-Regular", size: 13)
            textLabel.textColor = UIColor.greenColor()
            textLabel.backgroundColor = UIColor.blackColor()
            textLabel.lineBreakMode = .ByWordWrapping;
        }
    }
    
}



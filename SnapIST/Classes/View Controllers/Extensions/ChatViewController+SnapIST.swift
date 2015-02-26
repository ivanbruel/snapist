//
//  ChatViewController+SnapIST.swift
//  SnapIST
//
//  Created by Ivan Bruel on 25/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import UIKit

extension ChatViewController {
    
    func calculateHeightForIndexPath(indexPath: NSIndexPath) -> CGFloat {
        let message = messages[indexPath.row]
        let size = CGSize(width: CGRectGetWidth(tableView.bounds) - 40, height: CGFloat.max)
        let string = (message.formattedText as NSString)
        let attributes = [NSFontAttributeName: UIFont(name: "Menlo-Regular", size: 13)!]
        let rect = string.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.size.height
    }
    
}

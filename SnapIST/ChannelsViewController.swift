//
//  LoginViewController.swift
//  SnapIST
//
//  Created by Ivan Bruel on 23/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import UIKit

class ChannelsViewController: UITableViewController {
    
    var channels: [Channel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeAppearance()
        loadChannels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Logic
    private func customizeAppearance() {
        tableView.backgroundColor = UIColor.blackColor()
    }
    
    private func loadChannels() {
        channels = []
        Channel.findAll { (channels, error) -> Void in
            if let errorUnwrapped = error {
                UIAlertView(title: "Error", message: errorUnwrapped.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
            } else if let channelsUnwrapped = channels {
                self.channels = channelsUnwrapped
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as UITableViewCell
        let channel = channels[indexPath.row]
        
        cell.backgroundColor = UIColor.blackColor()
        cell.contentView.backgroundColor = UIColor.blackColor()
        
        if let textLabel = cell.textLabel {
            textLabel.text = channel.formattedName
            textLabel.font = UIFont(name: "Menlo-Regular", size: 15)
            textLabel.textColor = UIColor.greenColor()
            textLabel.backgroundColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


}


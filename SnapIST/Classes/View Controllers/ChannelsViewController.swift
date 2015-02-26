//
//  LoginViewController.swift
//  SnapIST
//
//  Created by Ivan Bruel on 23/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import UIKit

class ChannelsViewController: UITableViewController {
    
    var channels: [Channel] = []
    
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
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.greenColor()
        refreshControl?.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
    }
    
    private func loadChannels() {
        Channel.findAll { (channels, error) -> Void in
            self.refreshControl?.endRefreshing()
            if let errorUnwrapped = error {

                UIAlertView(title: "Error", message: errorUnwrapped.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
            } else if let channelsUnwrapped = channels {
                self.channels = channelsUnwrapped
                self.tableView.reloadData()
            }
        }
    }
    
    func refresh() {
        loadChannels()
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as UITableViewCell
        let channel = channels[indexPath.row]
        
        cell.themeChannelCell()

        if let textLabel = cell.textLabel {
            textLabel.text = channel.formattedName

        }
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? UITableViewCell {
            if let indexPath = tableView.indexPathForCell(cell) {
                let channel = channels[indexPath.row]
                if let chatViewController = segue.destinationViewController as? ChatViewController {
                    chatViewController.channel = channel
                }
            }
        }
    }
    
}


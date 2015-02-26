//
//  ChatViewController.swift
//  SnapIST
//
//  Created by Ivan Bruel on 25/02/15.
//  Copyright (c) 2015 SINFO 22. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var messages: [Message] = []
    var channel: Channel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeAppearance()
        loadChannels()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Logic
    private func customizeAppearance() {
        self.title = channel.formattedName
    }
    
    private func loadChannels() {
        channel.getMessages { (messages, error) -> Void in
            if let errorUnwrapped = error {
                UIAlertView(title: "Error", message: errorUnwrapped.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
            } else if let messagesUnwrapped = messages {
                self.messages = messagesUnwrapped
                self.tableView.reloadData()
            }
        }
    }

    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as UITableViewCell
        let message = messages[indexPath.row]

        cell.themeMessageCell()
        
        if let textLabel = cell.textLabel {
            textLabel.text = message.formattedText

        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return calculateHeightForIndexPath(indexPath)
    }
    
}

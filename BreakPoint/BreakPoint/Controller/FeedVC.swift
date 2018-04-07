//
//  FirstViewController.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/4/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var messageArray = [Message]()
    
    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.getAllFeedMessages { (returnedMessageArray) in
            
            self.messageArray = returnedMessageArray.reversed()
            self.tableView.reloadData()
        }
    }

}

// MARK: - TableView Implementation

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else { return UITableViewCell() }
        
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUsername(forUID: message.senderID) { (returnedUsername) in
            
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        
        return cell
        
    }
    
}


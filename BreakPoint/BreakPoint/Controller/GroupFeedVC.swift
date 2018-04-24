//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/23/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendMessageView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendBtn.bindToKeyboard()
    }
    
    // MARK: - Actions
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    }
    
    
    

}

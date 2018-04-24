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
    
    var group: Group?
    
    // MARK: Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendMessageView.bindToKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        groupTitleLbl.text = group?.groupTitle
        
        DataService.instance.getEmails(forGroup: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
            print("Number of people in group = \(returnedEmails.count)")
        }
        
        //membersLbl.text = group?.members.joined(separator: ", ")
    }
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    // MARK: - Actions
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    }
    
    
    

}

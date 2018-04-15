//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/14/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMembersLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
    

}

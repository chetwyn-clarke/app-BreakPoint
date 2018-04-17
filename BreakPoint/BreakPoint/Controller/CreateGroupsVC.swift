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
    
    var emailArray = [String]()
    var chosenUsers = [String]()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doneBtn.isHidden = true
    }
    
    // MARK: - Actions
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
}

// MARK: TableView Implementation

extension CreateGroupsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else { return UITableViewCell() }
        
        let profileImage = UIImage(named: "defaultProfileImage")
        
        if chosenUsers.contains(emailArray[indexPath.row]) {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        } else {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        
        let user = cell.emailLbl.text!
        
        if !chosenUsers.contains(user) {
            chosenUsers.append(user)
            groupMembersLbl.text = chosenUsers.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            chosenUsers = chosenUsers.filter({$0 != cell.emailLbl.text!})
            
            if chosenUsers.count >= 1 {
                groupMembersLbl.text = chosenUsers.joined(separator: ", ")
            } else {
                groupMembersLbl.text = "add people to your group"
                doneBtn.isHidden = true
            }
        }
    }
}

// MARK: TextField Implementation

extension CreateGroupsVC: UITextFieldDelegate {
    
    @ objc func textFieldDidChange() {
        
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }
    
}

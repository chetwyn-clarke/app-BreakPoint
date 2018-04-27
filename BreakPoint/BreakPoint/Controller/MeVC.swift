//
//  MeVC.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/5/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    // MARK: - Actions

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        
        let logoutPopUp = UIAlertController(title: "Logout?", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonWasTapped) in
            
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: auth_VC) as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (buttonWasTapped) in
            self.dismiss(animated: true, completion: nil)
        }
        
        logoutPopUp.addAction(logoutAction)
        logoutPopUp.addAction(cancelAction)
        present(logoutPopUp, animated: true, completion: nil)
    }
    
}

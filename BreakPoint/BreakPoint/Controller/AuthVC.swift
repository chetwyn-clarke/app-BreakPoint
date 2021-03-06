//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/5/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
        
    }

    // MARK: - Actions
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        
        let login_VC = storyboard?.instantiateViewController(withIdentifier: loginVC)
        
        present(login_VC!, animated: true, completion: nil)
        
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    
    
    

}

//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/5/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

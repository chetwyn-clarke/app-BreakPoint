//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/6/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    // MARK: - Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
    }

    
    // MARK: - Actions
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        
        if textView.text != nil && textView.text != createPostVC_Placeholder {
            
            sendBtn.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)! , withGroupKey: nil) { (isComplete) in
                
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("There was an error sending the message to the feed.")
                }
            }
            
        }
        
    }

    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - TextView Implementation

extension CreatePostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}

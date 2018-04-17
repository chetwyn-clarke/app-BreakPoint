//
//  UserCell.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/15/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkmark: UIImageView!
    
    var checkmarkIsShowing = false
    
    func configureCell(profileImage: UIImage, email: String, isSelected: Bool) {
        self.userImage.image = profileImage
        self.emailLbl.text = email
        if isSelected {
            self.checkmark.isHidden = false
        } else {
            self.checkmark.isHidden = true
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            if checkmarkIsShowing == false {
                checkmark.isHidden = false
                checkmarkIsShowing = true
            } else {
                checkmark.isHidden = true
                checkmarkIsShowing = false
            }
        }
    }

}

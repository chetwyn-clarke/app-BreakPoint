//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/20/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(forGroup group: Group) {
        self.groupTitleLbl.text = group.groupTitle
        self.groupDescriptionLbl.text = group.groupDescription
        self.memberCountLbl.text = "\(group.memberCount) members."
    }
    
//    func configureCell(title: String, description: String, memberCount: Int) {
//        self.groupTitleLbl.text = title
//        self.groupDescriptionLbl.text = description
//        self.memberCountLbl.text = "\(memberCount) members."
//    }
    

}

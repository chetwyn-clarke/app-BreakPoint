//
//  SecondViewController.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/4/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        cell.configureCell(title: "Caribbean Crew", description: "Caribbean pilots at Copa", memberCount: 4)
        
        return cell
    }
}


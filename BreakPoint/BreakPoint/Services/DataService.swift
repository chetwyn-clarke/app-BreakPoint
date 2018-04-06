//
//  DataService.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/4/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    // MARK: - Initialisation
    
    static let instance = DataService()
    
    // MARK: - Properties
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    // MARK: - Functions
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    func uploadPost(withMessage message: String, forUID uid:String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()) {
        
        if groupKey != nil {
            // send to group ref
        } else {
            // Pass to feed
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderID": uid])
            
            sendComplete(true)
        }
        
    }
    
}

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
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
        
    }
    
    func getAllFeedMessages(handler: @escaping (_ message: [Message]) -> ()) {
        
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            
            var messageArray = [Message]()
            
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapshot {
                
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderID = message.childSnapshot(forPath: "senderID").value as! String
                
                let message = Message(content: content, senderID: senderID)
                messageArray.append(message)
            }
            
            handler(messageArray)
        }
    }
    
    func getEmail(forSearchQuery query: String, handler: @escaping (_ emailArray: [String]) -> ()) {
        
        var emailArray = [String]()
        
        REF_USERS.observe(.value) { (userSnapshot) in
            
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query) == true && email != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
            }
            
            handler(emailArray)
        }
    }
    
    func getIds(forUsernames usernames: [String], handler: @escaping (_ uidArray: [String]) -> ()) {
        
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            
            var idArray = [String]()
            
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if usernames.contains(email) {
                    idArray.append(user.key)
                }
            }
            
            handler(idArray)
        }
    }
    
    func createGroup(forTitle title: String, andDescription description: String, forUserIDs ids: [String], handler: @escaping (_ groupCreated: Bool) -> ()) {
        
        REF_GROUPS.childByAutoId().updateChildValues(["title": title, "description": description, "members": ids])
        
        handler(true)
        
    }
    
}

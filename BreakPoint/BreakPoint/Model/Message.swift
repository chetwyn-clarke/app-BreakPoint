//
//  Message.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/6/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import Foundation

class Message {
    
    // MARK: Properties
    
    private var _content: String
    private var _senderID: String
    
    var content: String {
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    // MARK: Initialisation
    
    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }
}

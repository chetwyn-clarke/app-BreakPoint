//
//  InsetTextField.swift
//  BreakPoint
//
//  Created by Chetwyn on 4/5/18.
//  Copyright © 2018 Clarke Enterprises. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

    private var insetPaddding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        
        self.attributedPlaceholder = placeholder
        
        super.awakeFromNib()
    }
    
    // MARK: - TextField Offsets
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insetPaddding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insetPaddding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insetPaddding)
    }

}

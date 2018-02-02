//
//  roundButton.swift
//  Calculator
//
//  Created by Mark Lucas on 01/02/2018.
//  Copyright © 2018 Mark Lucas. All rights reserved.
//

import UIKit

@IBDesignable

class roundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        
        didSet {
            
            if roundButton {
                
                layer.cornerRadius = frame.height / 2
                
            }
            
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        if roundButton {
            
            layer.cornerRadius = frame.height / 2
            
        }
        
    }

}

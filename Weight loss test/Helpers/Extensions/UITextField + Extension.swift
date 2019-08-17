//
//  UITextField + Extension.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setupBorder() {
        layer.borderColor = #colorLiteral(red: 0.9686738849, green: 0.9754894376, blue: 0.9907442927, alpha: 1)
        layer.borderWidth = 1
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
}

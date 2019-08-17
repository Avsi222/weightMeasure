//
//  UIViewController + Extensions.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addTapOnKeyboardHiding() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

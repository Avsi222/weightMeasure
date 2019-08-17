//
//  NavigationBarStyle.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

class NavigationBarStyle: UINavigationBar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        topItem?.backBarButtonItem = backButton
        
    }
    
}

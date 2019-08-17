//
//  UserInfoModel.swift
//  Weight loss test
//
//  Created by Ramazan on 19/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//
import UIKit

struct UserInfoModel {
    static var shared = UserInfoModel()
    
    var weight: Int = 0
    var desiredWieght: Int = 0
    var height: Int = 0
    var isTestComplete = UserDefaults.standard.value(forKey: "isTest")
    var weightDay = [Int]()
}

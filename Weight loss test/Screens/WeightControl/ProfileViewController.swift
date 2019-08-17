//
//  ProfileViewController.swift
//  Weight loss test
//
//  Created by Арсений Дорогин on 17/08/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var circleView:UIView!
    @IBOutlet weak var weightLabel:UILabel!
    @IBOutlet weak var diprLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var decodedArray = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.object(forKey: "weight") as! Data) as! [Int]
        let lastWeightElem = decodedArray.count
        let newIndex = lastWeightElem-2
        if newIndex > 0{
            let lastWeight = decodedArray[lastWeightElem-2]
            let razn = lastWeight - decodedArray[lastWeightElem-1]
            diprLabel.text = "\(razn) кг"
        }else{
            diprLabel.text = "\(0) кг"
        }
        weightLabel.text = "\(decodedArray[lastWeightElem-1]) кг"
        circleView.layer.cornerRadius = circleView.frame.width/2
        circleView.layer.borderWidth = 5
        circleView.layer.borderColor = #colorLiteral(red: 0, green: 0.6979902387, blue: 0.6433882117, alpha: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

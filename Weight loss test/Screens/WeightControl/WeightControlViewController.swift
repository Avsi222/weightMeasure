//
//  WeightControlViewController.swift
//  Weight loss test
//
//  Created by Арсений Дорогин on 17/08/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

class WeightControlViewController: UIViewController {

    @IBOutlet weak var weightInputTextField:UITextField!
    @IBOutlet weak var saveButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addTapOnKeyboardHiding()
    }
    
    @IBAction func savePressed(_ sender:UIButton){
        UserInfoModel.shared.weight = Int(weightInputTextField.text ?? "0") ?? 0
        //UserInfoModel.shared.weightDay.append(Int(weightInputTextField.text ?? "0") ?? 0)
        
        var decodedArray = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.object(forKey: "weight") as! Data) as! [Int]
        decodedArray.append(UserInfoModel.shared.weight)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: decodedArray)
        UserDefaults.standard.set(encodedData, forKey: "weight")
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

extension WeightControlViewController: BaseViewProtocol {
    func setupView() {
        //saveButton.setupBorder()
        saveButton.layer.cornerRadius = 5
        weightInputTextField.setupBorder()
    }
}

extension WeightControlViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField.text == "" {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
    
}

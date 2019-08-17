//
//  SecondVC.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

final class SecondVC: UIViewController {
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var heightTextField: UITextField!
    @IBOutlet private weak var weightTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addTapOnKeyboardHiding()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "2/22"
    }
    
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 4
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func nextButtonIsClicked(_ sender: UIButton) {
        UserInfoModel.shared.height = Int(heightTextField.text ?? "0") ?? 0
        UserInfoModel.shared.weight = Int(weightTextField.text ?? "0") ?? 0
        let result = [UserInfoModel.shared.weight]
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: result)
        UserDefaults.standard.set(encodedData, forKey: "weight")
        
        guard let vc = UIStoryboard.init(name: "ThirdSB", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC else {fatalError()}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showErrorInputAlert(text: String) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Понятно", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func setupAlert() {
        if Int(weightTextField.text ?? "0") ?? 0 < 60 ||
            Int(weightTextField.text ?? "0") ?? 0 > 200 {
            showErrorInputAlert(text: "Введите корректное значение веса - от 60 до 200")
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        if Int(heightTextField.text ?? "0") ?? 0 < 140 ||
            Int(heightTextField.text ?? "0") ?? 0 > 220 {
            showErrorInputAlert(text: "Введите корректное значение роста - от 140 до 220")
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    
}

extension SecondVC: BaseViewProtocol {
    
    func setupView() {
        nextButton.setupBorder()
        heightTextField.setupBorder()
        weightTextField.setupBorder()
    }
    
}

extension SecondVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if weightTextField.text != "" && heightTextField.text != "" {
            nextButton.isEnabled = true
            setupAlert()
        } else {
            nextButton.isEnabled = false
        }
        
    }
    
}

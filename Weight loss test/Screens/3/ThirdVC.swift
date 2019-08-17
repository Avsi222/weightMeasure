//
//  ThirdVC.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

final class ThirdVC: UIViewController {
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var inputWeightTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addTapOnKeyboardHiding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "3/22"
    }

    
    @IBAction func nextButtonIsClicked(_ sender: UIButton) {
        guard let vc = UIStoryboard.init(name: "FourthSB", bundle: nil).instantiateViewController(withIdentifier: "FourthVC") as? FourthVC else {fatalError()}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showErrorInputAlert(text: String) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Понятно", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

extension ThirdVC: BaseViewProtocol {
    
    func setupView() {
        nextButton.setupBorder()
        inputWeightTextField.setupBorder()
    }
    
}

extension ThirdVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if inputWeightTextField.text == "" {
            nextButton.isEnabled = false
        } else {
            if (Int(inputWeightTextField.text ?? "0") ?? 0) < (UserInfoModel.shared.height - 120) {
                showErrorInputAlert(text: "Желаемый вес слишком маленький")
            }
            nextButton.isEnabled = true
        }
    }
    
}

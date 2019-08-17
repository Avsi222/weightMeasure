//
//  FirstVC.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

final class FirstVC: UIViewController {
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var ageInputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addTapOnKeyboardHiding()
        if (UserInfoModel.shared.isTestComplete != nil){
            
            
            guard let vc = UIStoryboard.init(name: "WeightControl", bundle: nil).instantiateViewController(withIdentifier: "tabBarController") as? UITabBarController else {fatalError()}
            navigationController?.present(vc, animated: true)
           // performSegue(withIdentifier: "logOk", sender: self)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "1/22"
    }
    
    @IBAction private func nextButtonIsClicked(_ sender: UIButton) {
        
        guard let vc = UIStoryboard.init(name: "SecondSB", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {fatalError()}
        navigationController?.pushViewController(vc, animated: true)
        /*
        guard let vc = UIStoryboard.init(name: "Questions", bundle: nil).instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController else {fatalError()}
        navigationController?.pushViewController(vc, animated: true)
        */
        
        
    }

}

extension FirstVC: BaseViewProtocol {
    func setupView() {
        nextButton.setupBorder()
        ageInputTextField.setupBorder()
    }
}

extension FirstVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if ageInputTextField.text == "" {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    
}

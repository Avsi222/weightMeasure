//
//  ResultVC.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit
import MBCircularProgressBar

final class ResultVC: UIViewController {
    
    @IBOutlet private weak var infoAbout6in12Label: UILabel!
    @IBOutlet private weak var idealWeightLabel: UILabel!
    @IBOutlet private weak var needToResetLabel: UILabel!
    @IBOutlet private weak var firstCircle: MBCircularProgressBarView!
    @IBOutlet private weak var secondCicrlce: MBCircularProgressBarView!

    @IBOutlet private
    var midLineConstraint: NSLayoutConstraint!
    
    var heighMinus = 0
    var idealWeight = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        switch UserInfoModel.shared.height {
        case 150...160:
            heighMinus = 100
        case 166...175:
            heighMinus = 105
        case 175...185:
            heighMinus = 110
        default:
            heighMinus = 100
        }
        //dump(UserInfoModel.shared)
        let disereWidth = UserInfoModel.shared.height - heighMinus
        idealWeightLabel.text = disereWidth.description
        idealWeight = (UserInfoModel.shared.weight - disereWidth)
        needToResetLabel.text = (UserInfoModel.shared.weight - disereWidth).description
        UserDefaults.standard.set(true, forKey: "isTest")
        UserInfoModel.shared.isTestComplete = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimation()
        
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 2.0) {
            self.firstCircle.value = 100
            
        }
        UIView.animate(withDuration: 2.0, animations: {
            self.secondCicrlce.value = 100
            
        })
        self.midLineConstraint.constant = self.view.bounds.width - 40
        UIView.animate(withDuration: 2.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func exitPress(_ sender: UIButton){
        
        guard let vc = UIStoryboard.init(name: "WeightControl", bundle: nil).instantiateViewController(withIdentifier: "tabBarController") as? UITabBarController else {fatalError()}
        navigationController?.present(vc, animated: true)
    }

}

extension ResultVC: BaseViewProtocol {
    
    func setupView() {
        infoAbout6in12Label.setupBorder()
    }
    
}

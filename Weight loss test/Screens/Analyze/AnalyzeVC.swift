//
//  AnalyzeVC.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit
import MBCircularProgressBar

final class AnalyzeVC: UIViewController {
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var firstCircle: MBCircularProgressBarView!
    @IBOutlet private weak var secondCicrlce: MBCircularProgressBarView!
    @IBOutlet private weak var thirdCircle: MBCircularProgressBarView!
    @IBOutlet private var midLineConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        firstCircle.value = 0
        secondCicrlce.value = 0
        thirdCircle.value = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimation()
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 2.0) {
            self.firstCircle.value = 100
            
        }
        UIView.animate(withDuration: 3.0, animations: {
            self.secondCicrlce.value = 100
            
        })
          self.midLineConstraint.constant = self.view.bounds.width - 40
        UIView.animate(withDuration: 4.0) {
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 4.0, animations: {
            self.thirdCircle.value = 100
            self.nextButton.alpha = 1.0
        })
    }
    
    @IBAction private func nextButtonIsClicked(_ sender: UIButton) {
        guard let vc = UIStoryboard.init(name: "ResultSB", bundle: nil).instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {fatalError()}
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension AnalyzeVC: BaseViewProtocol {
    func setupView() {
        nextButton.setupBorder()
    }
}

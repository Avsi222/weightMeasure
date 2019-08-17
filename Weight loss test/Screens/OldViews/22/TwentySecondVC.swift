//
//  TwentySecondVC.swift
//  Weight loss test
//
//  Created by Ramazan on 11/07/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

class TwentySecondVC: UIViewController {
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private var textLabels: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "22/22"
    }

    
    private func setupChoiseButtonColors(_ tag: Int) {
            for item in self.textLabels {
                if item.tag == tag {
                    item.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
                    item.backgroundColor = #colorLiteral(red: 0, green: 0.6470588235, blue: 0.5764705882, alpha: 1)
                } else {
                    item.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    item.backgroundColor = .clear
            }
        }
    
    }
    
    @IBAction private func choiseButtonIsClicked(_ sender: UIButton) {
        setupChoiseButtonColors(sender.tag)
    }
    
    
    
    @IBAction private func nextButtonIsClicked(_ sender: UIButton) {
        guard let vc = UIStoryboard.init(name: "AnalyzeSB", bundle: nil).instantiateViewController(withIdentifier: "AnalyzeVC") as? AnalyzeVC else {fatalError()}
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension TwentySecondVC: BaseViewProtocol {
    
    func setupView() {
        for item in textLabels {
            item.setupBorder()
        }
        nextButton.setupBorder()
    }
    
}

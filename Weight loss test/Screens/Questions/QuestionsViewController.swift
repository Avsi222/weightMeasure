//
//  QuestionsViewController.swift
//  Weight loss test
//
//  Created by Арсений Дорогин on 14/08/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var questionHitLabel:UILabel!
    
    @IBOutlet weak var answerButton1:UIButton!
    @IBOutlet weak var answerButton2:UIButton!
    @IBOutlet weak var answerButton3:UIButton!
    @IBOutlet weak var answerButton4:UIButton!
    @IBOutlet weak var answerButton5:UIButton!
    @IBOutlet weak var answerButton6:UIButton!
    @IBOutlet weak var saveButton:UIButton!
    
    var buttonsArray = [UIButton]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        let leftButton = UIBarButtonItem(image: UIImage(named: "iosBack"), style: .plain, target: self, action: #selector(addTapped))
        leftButton.tintColor = .white
            //UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(addTapped))
        self.navigationItem.leftBarButtonItem = leftButton
        initButtons()
        setupView()
    }
    
    @objc
    func addTapped(){
        if index == 0{
            navigationController?.popViewController(animated: false)
        }else{
            index -= 1
            setupView()
        }
    }
    
    func setupView(){
        
        if index > 17{
            guard let vc = UIStoryboard.init(name: "AnalyzeSB", bundle: nil).instantiateViewController(withIdentifier: "AnalyzeVC") as? AnalyzeVC else {fatalError()}
            navigationController?.pushViewController(vc, animated: true)
        }else{
            initQuestions()
            initNumber()
            initAnswers()
        }
    }
    
    func initButtons(){
        buttonsArray.append(answerButton1)
        buttonsArray.append(answerButton2)
        buttonsArray.append(answerButton3)
        buttonsArray.append(answerButton4)
        buttonsArray.append(answerButton5)
        buttonsArray.append(answerButton6)
        answerButton1.tag = 1
        answerButton2.tag = 2
        answerButton3.tag = 3
        answerButton4.tag = 4
        answerButton5.tag = 5
        answerButton6.tag = 6
        saveButton.setupBorder()
    }
    
    @objc
    func buttonPressed(_ sender: UIButton){
        sender.setButtonSelected()
        for button in buttonsArray{
            if button.tag != sender.tag{
                button.setButtonNormal()
            }
        }
    }
    
    func initAnswers(){
        var indexAnswer = 0
        for button in buttonsArray{
            button.setWhiteBorder()
            button.setButtonNormal()
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            if indexAnswer >= answers[index].count{
                button.isHidden = true
            }else{
                button.isHidden = false
                button.setTitle(answers[index][indexAnswer], for: .normal)
                indexAnswer += 1
                button.titleLabel?.textAlignment = .center
            }
        }
    }
    
    func initQuestions(){
        questionLabel.text = questions[index].uppercased()
    }
    
    func initNumber(){
        title = "\(index+5)/22"
    }

    @IBAction func nextAnswer(_ sender: UIButton){
        index+=1
        setupView()
    }
    
}
extension UIButton{
    func setWhiteBorder(){
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 5
    }
    
    func setButtonNormal(){
        self.backgroundColor = .clear
        self.titleLabel?.tintColor = .white
    }
    
    func setButtonSelected(){
        self.titleLabel?.tintColor = UIColor(red: 31/255, green: 3/255, blue: 108/255, alpha: 1)
        self.backgroundColor = UIColor(red: 0/255, green: 165/255, blue: 147/255, alpha: 1)
    }
}

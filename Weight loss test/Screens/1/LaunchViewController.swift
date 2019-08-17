//
//  LaunchViewController.swift
//  Weight loss test
//
//  Created by Арсений Дорогин on 16/08/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import Foundation

import UIKit

class launchViewController: UIViewController{
    
    @IBOutlet weak var progressView:UIProgressView!
    
    let progress = Progress(totalUnitCount: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initProgressView()
        // Do any additional setup after loading the view.
    }
    
    func initProgressView(){
        // 1
        progressView.progress = 0.0
        progress.completedUnitCount = 0
        
        // 2
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                self.performSegue(withIdentifier: "loading", sender: nil)
                return
            }
            // 3
            self.progress.completedUnitCount += 1
            self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
        }
    }
}

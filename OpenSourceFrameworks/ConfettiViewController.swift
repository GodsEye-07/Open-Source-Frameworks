//
//  ConfettiViewController.swift
//  OpenSourceFrameworks
//
//  Created by Ayush Verma on 17/05/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import SAConfettiView

class ConfettiViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.confetti()
        
        
        // to keep the speed of the particles less but to increase the number use following.
//        for _ in 0...3{
//            self.confetti()
//        }
        
    }
    
    
    func confetti(){
        
        let confettiView = SAConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.type = .Diamond
        confettiView.colors = [UIColor.red, UIColor.green, UIColor.blue]
        confettiView.intensity = 1.0
        
        confettiView.startConfetti()
    }

    
//eoc
}

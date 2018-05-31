//
//  ThirdViewController.swift
//  OpenSourceFrameworks
//
//  Created by Ayush Verma on 31/05/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import SwiftSiriWaveformView

open class ThirdViewController: UIViewController {
    
    @IBOutlet weak var audioView: SwiftSiriWaveformView!
    
    var timer:Timer?
    var change:CGFloat = 0.01
    

    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.audioView.density = 1.0
        
        timer = Timer.scheduledTimer(timeInterval: 0.009, target: self, selector: #selector(ThirdViewController.refreshAudioView(_:)), userInfo: nil, repeats: true)
    }
    
    @objc internal func refreshAudioView(_:Timer) {
        if self.audioView.amplitude <= self.audioView.idleAmplitude || self.audioView.amplitude > 1.0 {
            self.change *= -1.0
        }
        
        // Simply set the amplitude to whatever you need and the view will update itself.
        self.audioView.amplitude += self.change
    }
    
}

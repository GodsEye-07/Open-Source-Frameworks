//
//  ConfettiViewController.swift
//  OpenSourceFrameworks
//
//  Created by Ayush Verma on 17/05/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import SAConfettiView
import AGCircularPicker

class ConfettiViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pickerView: AGCircularPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let valueOption = AGCircularPickerValueOption(minValue: 0, maxValue: 100)
        let titleOption = AGCircularPickerTitleOption(title: "Picker Title")
        let option = AGCircularPickerOption(valueOption: valueOption, titleOption: titleOption)
        pickerView.setupPicker(delegate: self, option: option)
        
        // to keep the speed of the particles less but to increase the number use following.
//        for _ in 0...3{
//            self.confetti()
//        }
        
    }
    
    
    func confetti(){
        
        let confettiView = SAConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.type = .Confetti
        confettiView.colors = [UIColor.red, UIColor.green, UIColor.blue]
        confettiView.intensity = 1.0
        
        confettiView.startConfetti()
    }
    
}

extension ConfettiViewController {
    
    func updateLabel(value: Int, color: UIColor) {
        titleLabel.text = String(format: "%02d", value)
        titleLabel.textColor = color
        
        
        //check to control the amount of the confetti and also how to stop after it agian changes back to normal ie to 1,2,3,4,5....
        if titleLabel.text == "100" {
            self.confetti()
        }
    }
    
}


extension ConfettiViewController: AGCircularPickerViewDelegate {
    
    func circularPickerViewDidChangeValue(_ value: Int, color: UIColor, index: Int) {
        updateLabel(value: value, color: color)
    }
    
    func circularPickerViewDidEndSetupWith(_ value: Int, color: UIColor, index: Int) {
        updateLabel(value: value, color: color)
    }
    
    func didBeginTracking(timePickerView: AGCircularPickerView) {
        
    }
    
    func didEndTracking(timePickerView: AGCircularPickerView) {
        
    }
    
}

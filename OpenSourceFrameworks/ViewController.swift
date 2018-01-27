//
//  ViewController.swift
//  OpenSourceFrameworks
//
//  Created by Ayush Verma on 27/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController,G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if  let tessaract = G8Tesseract(language: "eng"){
                tessaract.delegate = self
            
            tessaract.image = UIImage(named: "abc")?.g8_grayScale()
            tessaract.recognize()
            
            textView.text = tessaract.recognizedText
        }
        
    }
    
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Image recognition of \(tesseract.progress) %")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


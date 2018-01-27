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
    
    @IBAction func addImage(_ sender: Any) {
        
       //add the option to choose from camera and galley option to choose to uplaod the image from.
        
        
        let imageOptions = UIAlertController(title: "Choose an action", message: "choose a method to add from that destination", preferredStyle: .actionSheet)
        
        let cameraOption = UIAlertAction(title: "Camera", style: .default) { (true) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        }
        
        imageOptions.addAction(cameraOption)
        
        let galleryOption = UIAlertAction(title: "Phtot Gallery", style: .default) { (true) in
            
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                let imageSelected = UIImagePickerController()
                imageSelected.allowsEditing = false
                imageSelected.sourceType = .photoLibrary
                
                self.present(imageSelected, animated: true, completion: nil)
                
            }
        }
        
        imageOptions.addAction(galleryOption)
        
        let cancelOption = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        imageOptions.addAction(cancelOption)
        
     present(imageOptions, animated: true, completion: nil)
        
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Image recognition of \(tesseract.progress) %")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


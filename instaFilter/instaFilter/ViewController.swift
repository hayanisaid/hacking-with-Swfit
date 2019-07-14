//
//  ViewController.swift
//  instaFilter
//
//  Created by admin on 7/13/19.
//  Copyright © 2019 admin. All rights reserved.
//
import CoreImage
import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    var currentFilter: CIFilter!
    var context :CIContext!
   // @IBOutlet weak var intensity: UILabel!
    @IBOutlet weak var intensity: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    var currentImage :UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "InstaFiler"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importImages))
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }
    @objc func importImages(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else{return}
        dismiss(animated:true)
        currentImage = image
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
        
    @IBAction func changeFilter(_ sender: Any) {
    }
    
    @IBAction func save(_ sender: Any) {
    }
    @IBAction func intensityChanged(_ sender: Any) {
        applyProcessing()
    }
    
    func applyProcessing(){
        guard let image = currentFilter.outputImage else {return}
        currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)
        if let cgimg = context.createCGImage(image, from: image.extent){
              let processedImage = UIImage(cgImage: cgimg)
            imageView.image = processedImage
        }
    
        
    }
}


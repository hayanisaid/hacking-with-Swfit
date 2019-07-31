//
//  ViewController.swift
//  swift-animations
//
//  Created by admin on 7/30/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
       var imageView : UIImageView!
       var currentImageAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
        
        
    }

    @IBAction func runAnimation(_ sender: UIButton) {
        sender.isHidden = true
        
       // UIView.animate(withDuration: 1,delay: 0, animations: {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            switch self.currentImageAnimation{
            case 0:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
                break
            case 1:
                self.imageView.transform = .identity
            case 2:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 3:
                self.imageView.transform = .identity
                break
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 5:
                self.imageView.transform = .identity
                break
            case 6:
                self.imageView.alpha = 0.4
                self.imageView.backgroundColor = .green
                break
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = .clear
                break
            default:
                break
            }
            
        }) { finished in
            sender.isHidden = false
        }
        currentImageAnimation += 1
        if(currentImageAnimation>7){
            currentImageAnimation = 0
        }
    }
    
}


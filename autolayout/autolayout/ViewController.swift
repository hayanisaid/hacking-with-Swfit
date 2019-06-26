//
//  ViewController.swift
//  autolayout
//
//  Created by admin on 6/26/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createLableView()
    }


    func createLableView(){
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "These"
        label1.sizeToFit()
        label1.backgroundColor = UIColor.green
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Nice"
        label2.sizeToFit()
        label2.backgroundColor = UIColor.yellow
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.text = "Awsome"
        label3.sizeToFit()
        label3.backgroundColor = UIColor.orange
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.text = "Dope"
        label4.sizeToFit()
        label4.backgroundColor = UIColor.purple
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.text = "Nah"
        label5.sizeToFit()
        label5.backgroundColor = UIColor.red
        
        view.addSubview(label1)
         view.addSubview(label2)
         view.addSubview(label3)
        view.addSubview(label4)
         view.addSubview(label5)
        
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
//        for label in viewsDictionary.keys {
//            view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
//
//            let metrics = ["labelHeight": 100]
//           view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(labelHeight)]-[label3(labelHeight)]-[label4(labelHeight)]-[label5(labelHeight)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
//
//
//        }
        var previousLable : UILabel?
        
        for label in [label1,label2,label3,label4,label5]{
            
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 100).isActive = true
            if let previousLable = previousLable{
                label.topAnchor.constraint(equalTo: previousLable.bottomAnchor, constant: 10).isActive = true
            }else{
                // this is the first lable
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
           
            previousLable = label
            
        }
    }
    
   
}


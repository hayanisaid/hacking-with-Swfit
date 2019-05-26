//
//  ViewController.swift
//  UIAlert
//
//  Created by mac on 5/26/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func networkError(_ sender: Any) {
        Alert.showNetworkErrorAlert(vc: self)
    }
    
    @IBAction func invalidEmail(_ sender: Any) {
        Alert.showEmailErrorAlert(vc: self)
    }
    @IBAction func showBasicAlert(_ sender: Any) {
        Alert.showSimpleAlert(vc: self)
    }
    
}


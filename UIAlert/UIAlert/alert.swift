//
//  alert.swift
//  UIAlert
//
//  Created by mac on 5/26/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
   private static func showBasicAlert (on vc:UIViewController , with title:String, message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
    DispatchQueue.main.async {
         vc.present(alert, animated: true, completion: nil)
    }
        
    
    
    }
    
    static func showNetworkErrorAlert(vc :UIViewController){
        showBasicAlert(on: vc, with: "Network Error 🇬🇬", message: "Please check your connection")
    }
    
    static func showEmailErrorAlert(vc :UIViewController){
        showBasicAlert(on: vc, with: "Please correct infor below 🇬🇬", message: "invalid email")
    }
    static func showSimpleAlert(vc :UIViewController){
        showBasicAlert(on: vc, with: "simple alert 🇬🇬", message: "this is simple alert")
    }
}

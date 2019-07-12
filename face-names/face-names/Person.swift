//
//  Person.swift
//  face-names
//
//  Created by admin on 7/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name:String
    var image:String
    
     init(name:String,image:String) {
       self.name = name
        self.image = image
    }

}

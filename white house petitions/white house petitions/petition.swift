//
//  petition.swift
//  white house petitions
//
//  Created by admin on 7/7/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


struct Petition:Codable {
    var title:String
    var body :String
    var signatureCount:Int
}

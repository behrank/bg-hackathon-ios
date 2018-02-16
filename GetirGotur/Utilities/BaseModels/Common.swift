//
//  Common.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright © 2018 KG Teknoloji. All rights reserved.
//

import Foundation

struct CargoInfo {
    
    var countryName:String = ""
    var carryAmount:String = ""
    var isCarrierSelection:Bool = false
    init(contryName:String,carryAmount:String,isCarrierSelection:Bool) {
        self.carryAmount = carryAmount
        self.countryName = contryName
        self.isCarrierSelection = isCarrierSelection
    }
}


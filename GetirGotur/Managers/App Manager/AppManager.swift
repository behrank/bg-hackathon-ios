//
//  AppManager.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright © 2018 KG Teknoloji. All rights reserved.
//

import Foundation

class AppManager {
    
    static let shared = AppManager()
    var basicPickedCarryInfo = [CargoInfo]()
    
    
    fileprivate init(){
        
    }
    
    func pushCargoInfo(with data:CargoInfo) {
        basicPickedCarryInfo.append(data)
    }
    
}

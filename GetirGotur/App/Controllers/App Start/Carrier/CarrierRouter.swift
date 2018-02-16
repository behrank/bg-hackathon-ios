//
//  CarrierRouter.swift
//  GetirGotur
//
//  Created by Behran Kankul on 16.02.2018.
//  Copyright (c) 2018 KG Teknoloji. All rights reserved.
//

import UIKit

@objc protocol CarrierRoutingLogic
{

}

protocol CarrierDataPassing
{
    var dataStore: CarrierDataStore? { get }
}

class CarrierRouter: NSObject, CarrierRoutingLogic, CarrierDataPassing
{
    weak var viewController: CarrierViewController?
    var dataStore: CarrierDataStore?
    
    //MARK : Routing
    
}
